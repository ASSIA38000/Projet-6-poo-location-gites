<?php
require_once "modeles/Utilisateurs.php";
require_once "modeles/Administrateurs.php";
$adminClasse = new Administrateurs();
$userClasse = new Utilisateurs();

?>
<h3 class="text-success">Vous êtes : </h3>
<span>
    <a class="btn btn-outline-light" id="toggle-admin">Administateur</a>
    <a class="btn btn-outline-light" id="toggle-user">Client</a>
</span>


<div id="form-admin">
    <?php
    if(isset($_SESSION['connect']) && $_SESSION['connect'] === true){
        header("administration");
    }else{
        ?>
        <h2 class="mt-5 text-center text-success">CONNEXION A VOTRE ESPACE ADMINISTRATION</h2>
        <form method="post">
            <div class="form-group">
                <label for="exampleInputEmail1">Email</label>
                <input type="email" name="email_admin" class="form-control" id="exampleInputEmail1" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" name="password_admin" class="form-control" id="exampleInputPassword1" placeholder="Mot de passe">
            </div>
            <button name="btn_valid_admin" type="submit" class="mb-3 btn btn-success">Connexion</button>
        </form>

        <?php
        if(isset($_POST['btn_valid_admin'])){
            $adminClasse->connexionAdmin();
        }
    }
    ?>
</div>

<div id="form-user">
    <?php
    if(isset($_SESSION['connect_user']) && $_SESSION['connect_user'] === true){
        header("Location: accueil");
    }else{
        ?>
        <h2 class="mt-5 text-center text-info">CONNEXION A VOTRE ESPACE CLIENT</h2>
        <form method="post">
            <div class="form-group">
                <label for="exampleInputEmail1">Email</label>
                <input type="email" name="email_user" class="form-control" id="exampleInputEmail1" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" name="password_user" class="form-control" id="exampleInputPassword1" placeholder="Mot de passe">
            </div>
            <button name="btn_valid_user" type="submit" class="mb-5 btn btn-info">CONNEXION</button>
        </form>

        <?php
        if(isset($_POST['btn_valid_user'])){
            $userClasse->connexionUtilisateur();
        }
    }
    ?>
</div>

