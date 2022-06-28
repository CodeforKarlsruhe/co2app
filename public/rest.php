<?php
header("Access-Control-Allow-Methods: GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE, PATCH");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access-control-allow-origin, headers, origin, callback, content-type");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");
//header("Content-Type: */*;encoding=gzip, deflate, br");
//https://ionicframework.com/docs/troubleshooting/cors


/*
old
try {
    $input = json_decode(file_get_contents('php://input'), true);
    // Wir wählen die Operation anhand der Request Methode
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	    $result = array();
		// accept id=123 or no id field
		if (!array_key_exists("code",$input) || ($input["code"] == 123)) {
			// assume no errors: return 200
			header('HTTP/1.0 200 OK');
			$result = array("status" => 1, "id" => "abc", "message" => "Good Code");
		} else {
			// not authorized
			header('HTTP/1.0 403 Invalid ID');
			die();
			//$result["data"] = array("status" => 0, "message" => "Bad Code");
		}
    } else {
		throw new Exception('Invalid.');
	}

} catch (Exception $e) {
		//if ($e->getCode() == ApiException::MALFORMED_INPUT) {
		header('HTTP/1.0 409 Bad Request');
		die();
		//$result["data"] = $e->getMessage();
		//die($result);
}
 
header('Content-Type: application/json');

print(json_encode($result));


*/

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
  // pdo statements
  // --------------------------------------------------

// PDO statements
define ("DBCALL", array(
    "GET_USER_BY_HASH" => "SELECT * from users where hash = ?;",
    "ADD_USER" => "insert into users set name = ?, hash = ?;",
    "GET_SUBMISSION" => "SELECT * from submissions where user = ?;",
    "SELECT_SUBMISSION" => "SELECT * from submissions where id = ? for update;",
    "UPDATE_SUBMISSION" => "update submissions set location = ? where id = ?;"
	)
);


function openConnection() {
	// ini file on server is elsewhere
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


function removeSubmission($pdo,$location,$sectors,$id) {
	mlog("RemoveSub");
	return true;
}

function insertSubmission($pdo,$location,$sectors) {
	mlog("insterSub");
	$hash = "";
	return $hash;
}

function updateDash() {
	mlog("updateDash");

}



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
		// if code present, must match code1 or code2, else return invalid code
		if ($requestCode > "") {
			try {
				$queryCodes = $pdo->prepare('SELECT code1,code2 FROM defaults');
			} catch (PDOException $e) {
				mlog("PDO error " . $e->getMessage());
				die();
			}

			try {
				$queryCodes->execute();
				$codes = $queryCodes->fetchAll();
				if (count($codes) < 1) {
					mlog("Missing codes in DB");
					die();
				}
				if (($requestCode != $codes[0]["code1"]) && ($requestCode != $codes[0]["code2"])) {
					mlog("Invalid code: " . $requestCode);
					mlog($codes[0]["code1"]);
					$result = array("id" => "","msg" => REASON["KEY"],"status" => 0);
					break;
				}
			} catch (Exception $e) {
				die("Error: " . print_r($queryCodes->errorInfo(), true));
			}

		}		

		// if id present, must match existing id. if exist, update, else insert
		if ($requestId > "") {
			try {
				$queryId = $pdo->prepare('SELECT id FROM users where hash = ?');
			} catch (PDOException $e) {
				mlog("PDO error " . $e->getMessage());
				die();
			}

			try {
				$queryId->execute([$requestId]);
				$ids = $queryId->fetchAll();
				if (count($ids) == 0) {
					mlog("Invalid user " . $requestId);
					$result = array("id" => "","msg" => REASON["USER"],"status" => 0);
					break;
				}
				mlog("Users exists " . $ids[0]["hash"]);
				// remove submission for this user
				if (!removeSubmission($pdo,$location,$sectors,$ids[0]["id"])){
					mlog("Removal failed");
					die();
				}

			} catch (Exception $e) {
				die("Error: " . print_r($queryCodes->errorInfo(), true));
			}
		}		

		// insert submission()
		$hash = insertSubmission($pdo,$location,$sectors);
		if (hash == "") {
			mlog("Insert failed ");
			die();
		}
		// update dashboard tables
		updateDash();

		$result = array("id" => $hash,"msg" => "OK","status" => 1);


		break;

    default:
        mlog("Other");
		die(501);
        break;
}

echo json_encode($result);
ob_end_flush();


?>
