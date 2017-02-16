<?php

session_start();
require_once "connection.php";

class login extends connection {

    public $con;

    public function __construct(){
      $this->con = $this->connect(); //Connect to database
    }

    public function log($email, $password){

    $x = 0; //Define in 0 for count

    $query = $this->con->prepare("SELECT * FROM users WHERE email='$email' AND password='$password'");
    $query->execute();

    foreach ($query as $user) {
      $x++;
      $users = $user["iduser"];
    }

      //If user log x is > 0
      if($x>0){
        $_SESSION["user"] = $users; // Create session var for user logged
        return $users;
      }else{
        return 0;
      }
    }



}


?>