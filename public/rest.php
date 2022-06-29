<?php
header("Access-Control-Allow-Methods: GET, HEAD, POST, CONNECT, OPTIONS");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access-control-allow-origin, headers, origin, callback, content-type");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");
//header("Content-Type: */*;encoding=gzip, deflate, br");
//https://ionicframework.com/docs/troubleshooting/cors


/*
test with httpie
msg=CO2App
location:= '{"district":"Innenstadt-Ost","mult":0}'
co2parms:='{"sector1":{"value":1},"sector2":{"value":2},"sector3":{"value":3},"sector4":{"value":4},"sector5":{"value":5}}'

*/


// --------------------------------------------------
// error reasons
// --------------------------------------------------
define("REASON", [
    "AUTH" => "AUTH",
    "KEY" => "KEY",
    "CODE" => "CODE",
    "USER" => "USER"
]
);

define("DRYRUN",false); // default: false

// --------------------------------------------------
  //global config
  // --------------------------------------------------
$cfg = array();

// --------------------------------------------------
  // log function
  // --------------------------------------------------

  define("LOG", "rest.log");
  define("LPRIO", 0); // minimal log priority
  // log function to file
  function mlog($msg, $prio = 0)
  {
      if ($prio >= LPRIO) {
          $ts = date(DATE_RFC2822);
          file_put_contents(LOG, $ts . " : " . $msg . PHP_EOL, FILE_APPEND);
      }
  }


// --------------------------------------------------
  // function
  // --------------------------------------------------

function openConnection() {
	// ini file on server is elsewhere
	global $cfg;
	$cfg = array();
	try {
		if (!isset($_SERVER['HTTP_HOST']) or !isset($_SERVER['HTTPS'])) {
			$cfg = parse_ini_file("config.ini", false);
			$cfg["local"] = true;
		} else {
			// server
			$cfg = parse_ini_file("/var/www/files/co2/config.ini", false);
			$cfg["local"] = false;
		}

	} catch (Exception $e) {
		mlog("Invalid config");
		die("Config Error");
	}

	mlog("Config: " . json_encode($cfg));

	// open db 
	$dsn = "mysql:host=" .$cfg["dbhost"] . ";dbname=" . $cfg["dbname"];
	$attr = array(
		PDO::ATTR_EMULATE_PREPARES => false,
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
	);

	try {
		$pdo = new PDO($dsn, $cfg["dbuser"], $cfg["dbpass"],$attr);
	} catch (PDOException $e) {
		mlog("PDO error" . $e->getMessage());
		die();
	}
	mlog("DB open");

	return $pdo;
}

// --------------------------------------------------
  // insert function
  // num = 1 + mult
  // savings = (defaultCo2 - total)*num => by districts
  // sec1..5 = (defaultSec - val)*num => balance
  // --------------------------------------------------
function insertSubmission($pdo,$location,$sectors,$co2total,$parmsString,$requestCode,$remote,$id){
	global $cfg;
	mlog("instertSub");

	// get globals
	try {
		foreach ($pdo->query("select * from defaults") as $glob) {
			break;
		}
	} catch (PDOException $e) {
		mlog("PDO error" . $e->getMessage());
		die();
	}
	mlog(json_encode($glob));

	// total persons
	$num = 1 + $location["mult"];

	// create new user if required
	if ($id < 1) {
		$hash = uniqid($cfg["uprefix"]);
		try {
			$query = $pdo->prepare("insert into users set hash = ?");
			$pdo->beginTransaction();
			$query->execute([$hash]);
			$id = $pdo->lastInsertId();
			mlog("New user " . $id . " - " . $hash);
			$pdo->commit();
		} catch (PDOException $e) {
			mlog("PDO error" . $e->getMessage());
			$pdo->rollBack();
			mlog("New user failed: " . $e->getMessage());
			die();
		}
	} else {
		$hash = "";
	}
	// insert. scale co2 values by participants
	try {
		$sql = "insert into submissions set ";
		$sql .= "user = ?, ";
		$sql .= "co2total = ?, ";
		$sql .= "savingsTotal = ?, ";
		$sql .= "sector1 = ?, ";
		$sql .= "sector2 = ?, ";
		$sql .= "sector3 = ?, ";
		$sql .= "sector4 = ?, ";
		$sql .= "sector5 = ?, ";
		$sql .= "location = ?, ";
		$sql .= "mult = ?, ";
		$sql .= "json = ?, ";
		$sql .= "code = ?, ";
		$sql .= "remote = ? ";
		$query = $pdo->prepare($sql);
		$pdo->beginTransaction();
		$query->execute([
			$id,
			$num * $co2total, // total consumption
			$num * ($glob["co2total"] - $co2total), // total savings
			$num * ($glob["sector1"] - $sectors["sector1"]), // sector savings!
			$num * ($glob["sector2"] - $sectors["sector2"]),
			$num * ($glob["sector3"] - $sectors["sector3"]),
			$num * ($glob["sector4"] - $sectors["sector4"]),
			$num * ($glob["sector5"] - $sectors["sector5"]),
			$location["district"],
			$location["mult"],
			$parmsString,
			$requestCode,
			$remote
		]);
		$pdo->commit();
	} catch (PDOException $e) {
		mlog("PDO error" . $e->getMessage());
		$pdo->rollBack();
		mlog("New user failed");
		die();
	}

	updateDash($pdo,$glob);

	return $hash;
}

// --------------------------------------------------
  // remove function
  // --------------------------------------------------
function removeSubmission($pdo,$id) {
	global $cfg;
	mlog("RemoveSub");
	try {
		$query = $pdo->prepare("delete from submissions where user = ?");
		$pdo->beginTransaction();
		$query->execute([$id]);
		$pdo->commit();
	} catch (PDOException $e) {
		mlog("PDO error" . $e->getMessage());
		die();
	}
	return true;
}


// --------------------------------------------------
  // update function
  // --------------------------------------------------
  function updateDash($pdo,$glob) {
	mlog("updateDash");
	try {
		$sql  = "SELECT sum(sector1) as save1, ";
		$sql .= "sum(sector2) as save2, ";
		$sql .= "sum(sector3) as save3, ";
		$sql .= "sum(sector4) as save4, ";
		$sql .= "sum(sector5) as save5 ";
		$sql .= " from submissions";
		$query = $pdo->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		if (count($result) < 1) {
			mlog("No data on update");
			return;
		}
		$savings = $result[0];
		 print_r($savings);

		$balance = [
			$glob["sector1"] - $savings["save1"]/$glob["size"],
			$glob["sector2"] - $savings["save2"]/$glob["size"],
			$glob["sector3"] - $savings["save3"]/$glob["size"],
			$glob["sector4"] - $savings["save4"]/$glob["size"],
			$glob["sector5"] - $savings["save5"]/$glob["size"]
		];
		print_r($balance);
		// update
		$sql  = "update balance set sector1 = ?, sector2 = ?, sector3 = ?, sector4 = ?, sector5 = ?";
		$query = $pdo->prepare($sql);
		$pdo->beginTransaction();
		$query->execute($balance);
		$pdo->commit();

	} catch (PDOException $e) {
		mlog("PDO error" . $e->getMessage());
		die();
	}
	/*
		1) sector savings for balance chart
			sector default - sectorSavings/size
			sum(sector1), sum(sector2),... 
		2) district savings for map
			savingsByDist/distSize  
			sum(savings) group by district
		3) partizipants + mults
			count(=) + sum(mult) group by district

	*/
	/*
	query options with aggregation
		$query = $pdo->prepare('SELECT count(*) as cnt, sum(mult) as mult FROM submissions where location = ?');
		$query->execute(["Innenstadt-Ost"]);
		$result = $query->fetchAll();
		print_r($result);
		Array
			(
				[0] => Array
					(
						[cnt] => 1
						[mult] => 7
					)

			)

	with grouping. note the fetch_group | ...

			$query = $pdo->prepare('SELECT location, count(*) as cnt, sum(mult) as mult FROM submissions group by location');
			$query->execute();
			$result = $query->fetchAll(PDO::FETCH_GROUP|PDO::FETCH_ASSOC);
			print_r($result);
				
			Array
			(
				[Innenstadt-Ost] => Array
					(
						[0] => Array
							(
								[cnt] => 15
								[mult] => 5
							)

					)

				[Innenstadt-West] => Array
					(
						[0] => Array
							(
								[cnt] => 1
								[mult] => 7
							)

					)

			)

*/

}


// --------------------------------------------------
  // start ...
  // --------------------------------------------------


$meth = $_SERVER["REQUEST_METHOD"];

$result = array();

switch ($meth) {
    case "POST":
        mlog("POST");
        $input = json_decode(file_get_contents('php://input'), true);
        mlog("Input: " . json_encode($input));
        // we expect msg, co2total, co2parms and location
        if (!(array_key_exists("msg", $input)) || 
			!(array_key_exists("co2parms", $input)) ||
			!(array_key_exists("location", $input)))
			{
            mlog("Keys missing");
            $result = array("id" => "","msg" => REASON["KEY"],"status" => 0);
            break;
        }
		// check request msg
		if ($input["msg"] != "CO2App") {
            $result = array("id" => "","msg" => REASON["KEY"],"status" => 0);
            break;
		};
		// check location
        $location = $input["location"];
        if (!(array_key_exists("district", $location)) || 
			!(array_key_exists("mult", $location))) {
				$result = array("id" => "","msg" => REASON["KEY"],"status" => 0);
				break;
		}
		// more work for co2parms ...
        $co2parms = $input["co2parms"];
		$sects = ["sector1","sector2","sector3","sector4","sector5"];
		$sectors = array();
		$co2total = 0;
		foreach($sects as $s) {
			if (!(array_key_exists($s, $co2parms)) || !(array_key_exists("value", $co2parms[$s]))) {
				break;
			}
			// append sector value
			$sectors[$s] = $co2parms[$s]["value"];
			// sum
			$co2total += $co2parms[$s]["value"];
		}
		// counts must match
		if (count($sectors) != count($sects)) {
			$result = array("id" => "","msg" => REASON["KEY"],"status" => 0);
			break;
		}
		// encode parms
		$parmsString = json_encode($co2parms);

		// optional code and id
		$requestCode = array_key_exists("code", $input) ? $input["code"] : "";
		$requestId = array_key_exists("id", $input) ? $input["id"] : "";

		// open db connection
		$pdo = openConnection();

		// verify
		// district must exist
		try {
			$query = $pdo->prepare('SELECT * FROM districts where name = ?');
		} catch (PDOException $e) {
			mlog("PDO error " . $e->getMessage());
			header('HTTP/1.0 501 Server Error');
			die();
		}

		try {
			$query->execute([$location["district"]]);
			$result = $query->fetchAll();
			if (count($result) < 1) {
				mlog("Invalid location");
				header('HTTP/1.0 501 Server Error');
				die();
			}
		} catch (PDOException $e) {
			mlog("PDO error " . $e->getMessage());
			header('HTTP/1.0 501 Server Error');
			die();
		}

		// if code present, must match code1 or code2, else return invalid code
		if ($requestCode > "") {
			try {
				$query = $pdo->prepare('SELECT code1,code2 FROM defaults');
			} catch (PDOException $e) {
				mlog("PDO error " . $e->getMessage());
				header('HTTP/1.0 501 Server Error');
				die();
			}

			try {
				$query->execute();
				$result = $query->fetchAll();
				if (count($result) < 1) {
					mlog("Missing codes in DB");
					header('HTTP/1.0 501 Server Error');
					die();
				}
				if (($requestCode != $result[0]["code1"]) && ($requestCode != $result[0]["code2"])) {
					mlog("Invalid code: " . $requestCode);
					mlog($result[0]["code1"]);
					$result = array("id" => "","msg" => REASON["KEY"],"status" => 0);
					break;
				}
			} catch (PDOException $e) {
				mlog("PDO error " . $e->getMessage());
				header('HTTP/1.0 501 Server Error');
				die();
			}

		}		

		// if id present, must match existing id. if exist, update, else insert
		if ($requestId > "") {
			try {
				$query = $pdo->prepare('SELECT id, hash FROM users where hash = ?');
				$query->execute([$requestId]);
				$result = $query->fetchAll();
				if (count($result) < 1) {
					mlog("Invalid user " . $requestId);
					$result = array("id" => "","msg" => REASON["USER"],"status" => 0);
					break;
				}
				mlog("Users exists " . $result[0]["hash"]);
				$user = $result[0]["id"];
				// remove submission for this user
				if (!removeSubmission($pdo,$result[0]["id"])){
					mlog("Removal failed");
					header('HTTP/1.0 501 Server Error');
					die();
				}

			} catch (PDOException $e) {
				mlog("PDO error " . $e->getMessage());
				header('HTTP/1.0 501 Server Error');
				die();
			}
		} else {
			$user = 0;
		}

		// get remote info
		$remote = $_SERVER['REMOTE_ADDR']?:($_SERVER['HTTP_X_FORWARDED_FOR']?:$_SERVER['HTTP_CLIENT_IP']);

		// insert submission(), insert with update!
		$hash = insertSubmission($pdo,$location,$sectors,
			$co2total,$parmsString,$requestCode,$remote,$user);

		if ($hash == "") {
			// user re-used
			$hash = $requestId;
			mlog("Reusing user  " . $hash);
		}


		$result = array("id" => $hash,"msg" => "OK","status" => 1);


		break;

    default:
        mlog("Other");
		header('HTTP/1.0 409 Bad Request');
		die();
        break;
}

header('HTTP/1.0 200 OK');
echo json_encode($result);
ob_end_flush();


/*

header('HTTP/1.0 200 OK');
header('HTTP/1.0 403 Invalid ID');
header('HTTP/1.0 409 Bad Request');

*/

?>
