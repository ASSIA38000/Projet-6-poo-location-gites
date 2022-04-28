<?php
ob_start();

if(isset($_GET['url'])){
    $url = $_GET['url'];
	
}else{
    $url = "accueil";
}

if($url === ""){
    $url = "accueil";
}

if($url === "accueil"){
    $title  = "ACCUEIL";
    require_once "vues/accueil.php";
}

elseif($url === "details"){
    $title  = "DETAILS";
    require_once "vues/details.php";
}

elseif($url === "connexion"){
    $title  = "CONNEXION";
    require_once "vues/connexion.php";
}

elseif($url === "inscription"){
    $title  = "INSCRIPTION";
    require_once "vues/inscription.php";
}

elseif ($url === "deconnexion"){
    require_once "vues/deconnexion.php";
}

else if($url === "administration" && isset($_SESSION['connecter']) && $_SESSION['connecter'] === true){
    $title = "ADMINISTRATION";
    require_once "vues/administration.php";
}

elseif ($url === "404"){
    $title  = "ERREUR";
    require_once "vues/404.php";
	
}elseif($url !=  '#:[\w]+)#'){
    header("Location: accueil");
}

$content = ob_get_clean();
require_once "template.php";
