<?php
require_once "modeles/Database.php";
class Utilisateurs extends Database
{
    private $email_util;
    private $password_util;
    private $repeatPassword;

    public function inscriptionUtilisateur()
    {

    }

    public function connexionUtilisateur()
    {
        $db = $this->getPDO();

        if (isset($_SESSION['connect_user']) && $_SESSION['connect_user'] === true) {
            ?>
            <h1>Bonjour <?= $_POST['email_user'] ?></h1>
            <?php
        } else {
            echo "<p class='alert-warning mt-2 p-2'>Vous n'êtes pas encore inscrit sur notre site
                    <a href='inscription' class='btn btn-info'>S'incrire</a>
                </p>";
        }
    
        if (isset($_POST['email_user']) && !empty($_POST['email_user'])) {
            $this->email_user = trim(htmlspecialchars($_POST['email_user']));
        } else {
            echo "<p class='alert-danger p-3'>Merci de remplir le champ Email</p>";
        }

        if (isset($_POST['password_user']) && !empty($_POST['password_user'])) {
            $this->password_user = trim(htmlspecialchars($_POST['password_user']));
        } else {
            echo "<p class='alert-danger p-3'>Merci de renseigner le mot de passe</p>";
        }

        if (!empty($_POST['email_user']) && !empty($_POST['password_user'])) {
            $sql = "SELECT * FROM utilisateurs WHERE email = ? AND password = ?";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(1, $this->email_user);
            $stmt->bindParam(2, $this->password_user);

            $stmt->execute();

            if ($stmt->rowCount() >= 1) {
                $row = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($this->email_user === $row['email'] && $this->password_user === $row['password']) {
                    session_start();
                    $_SESSION['connect_user'] = true;
                    $_SESSION['email_user'] = $this->email_user;
                    header("Location: accueil");
                } else {
                    echo "<p class='alert-danger p-2'>Erreur : email et mot passe ne sont pas corrects !</p>";
                }
            } else {
                echo "<p class='alert-danger mt-3 p-2'>Aucun utilisateur ne possède cet email et/ou ce mot de passe</p>";
            }
        } else {
            echo "<p class='alert-danger p-2'>Merci de remplir tous les champs !</p>";
        }
var_dump($this->email_user);
var_dump($this->password_user);
    }
}