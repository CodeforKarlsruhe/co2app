<?php

// dummy test only !

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

die();

?>

