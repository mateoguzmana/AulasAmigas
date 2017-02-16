<?php

session_start();
require_once "connection.php";

class contents extends connection {

    public $con;

    public function __construct(){
      $this->con = $this->connect(); //Connect to database
    }

    public function getAllContents(){

    $query = $this->con->prepare("SELECT * FROM contents WHERE idstate=1");
    $query->execute();

    $results = $query->fetchAll(PDO::FETCH_ASSOC);

    return $results;

    }



}


?>