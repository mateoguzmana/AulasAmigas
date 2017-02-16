<?php

class connection{
    
  public $con;

  public function connect(){

    $this->con = new PDO("mysql:host=localhost;dbname=aulas_amigas;charset=utf8","root","");
    return $this->con;
  
  }

}
?>