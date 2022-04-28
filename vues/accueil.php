<?php
require_once "modeles/Gites.php";

$gitesClasse = new Gites();

$gites = $gitesClasse->getGites();
// var_dump($gites);

?>

<div class="row">

<?php
foreach ($gites as $gite) {
    ?>

    <div class="col-md-4 col-sm-12 mt-5 mb-5">
        <p>*** <b><em> <?= $gite['nom_gite'] ?></em></b> ***</p>
        <img src="<?= $gite['img_gite'] ?>" alt="photo-gite" title="photo-gite"/></br></br>
        <p>Description >>> <em>  <?= $gite['description_gite'] ?></em></p>

    </div>

    <?php
}
?>
</div>

