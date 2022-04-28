<?php

class Database
{
    private $host = "localhost";
    private $dbname = "location_gite";
    private $user = "root";
    private $pass = "";

    public function getPDO(){
        try {
            $db = new PDO('mysql:host='.$this->host.';dbname='.$this->dbname.";charset=UTF8", $this->user, $this->pass);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "<div class='text-center'>
                    <p class='mt-3 alert alert-success'>Vous êtes connecté à PDO MySQL !</p>
                </div>";
        }catch (PDOException $exception){
            echo "<div class='text-center'>
                    <p class='alert alert-danger'>Erreur de connexion PDO MySQL !</p>
                </div>" . $exception->getMessage();
            die();
        }
        return $db;
    }

}

