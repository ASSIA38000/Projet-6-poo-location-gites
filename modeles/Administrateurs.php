<?php
require_once "modeles/Database.php";

class Administrateurs extends Database
{

    private $email_admin;
    private $password_admin;

    public function connexionAdmin(){

        $db = $this->getPDO();

        if(isset($_POST['email_admin']) && !empty($_POST['email_admin'])){

//  Pour accéder à une propiété privée (variable dans une classe) on utilise $this 
//  ici pour stocker la valeur de $_POST
            
            $this->email_admin = trim(htmlspecialchars($_POST['email_admin']));
        }else{
            echo "<p class='alert-danger p-3 mt-3'>Merci de remplir le champ Email</p>";
        }

        if(isset($_POST['password_admin']) && !empty($_POST['password_admin'])){
            $this->password_admin = trim(htmlspecialchars($_POST['password_admin']));
        }else{
            echo "<p class='alert-danger p-3 mt-3'>Merci de renseigner votre mot de passe</p>";
        }

        if(!empty($_POST['email_admin']) && !empty($_POST['password_admin'])){

            $sql = "SELECT * FROM administrateurs WHERE email_admin = ? AND password_admin = ?";

            $stmt = $db->prepare($sql);

            $stmt->bindParam(1, $this->email_admin);
            $stmt->bindParam(2, $this->password_admin);

            $stmt->execute();

            if($stmt->rowCount() >= 1){

                $row = $stmt->fetch(PDO::FETCH_ASSOC);

                if($this->email_admin === $row['email_admin'] && $this->password_admin === $row['password_admin']){

                    session_start();

                    $_SESSION['connecter'] = true;
                    $_SESSION['email_admin'] = $this->email_admin;

                    header('Location: administration');
                }else{
                    echo "<p class='alert-danger mt-3 p-2'>Erreur de connexion, Merci de vérifier votre email et mot de passe</p>";
                }
            }else{
                echo "<p class='alert-danger mt-3 p-2'>Erreur de connexion !</p>";
            }
        }else{
            echo "<p class='alert-danger mt-3 p-2'>Merci de remplir tous les champs</p>";
        }
    }
}