<?php
require_once "modeles/Database.php";
class Gites extends Database {

    private $nom_gite;
    public function getGites(){

        $db = $this->getPDO();
        $sql = "SELECT * FROM gites";
        $gites = $db->query($sql);
        return $gites;
    }
}
