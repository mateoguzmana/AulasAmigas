<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Access-Control-Allow-Headers, Access-Control-Request-Method, Access-Control-Request-Headers, Origin, X-Requested-With, Content-Type, Accept, Methods");
require_once "../models/login.model.php";

$data = json_decode(file_get_contents('php://input'), true);


$email    = $data["email"];
$password = $data["password"];

$users = new login();
$user = $users->log($email, $password); 

if($user!=""){
	$data = array('state'=>'1', 'iduser'=>$user);
}else{
	$data = array('state'=>'0');
}

 
	echo json_encode($data); 

?>