<?php
include "../modeles/Gites.php";

$gitesClasse = new Gites();
$gites = $gitesClasse->getGites();

?>
<h3 class="text-danger">Liste de nos gites</h3>
<div class="row">

<?php
foreach ($gites as $row) {
    ?>
    <div class="col-md-3 col-sm-12">
        <div class="card">
            <img  src="<?= $row['img_gite'] ?>" class="card-img-top img-fluid" alt="...">
            <div class="card-body">
                <h5 class="card-title text-info"><?= $row['nom_gite'] ?></h5>
                <p><b>Nombre de chambres : </b><b class="text-danger"><?= $row['nbr_chambre'] ?></b></p>

            </div>
        </div>
    </div>

    <?php
}
?>
</div>
