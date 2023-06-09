<?php

	include_once("libs/modele.php");
    include_once("libs/maLibForms.php");
	//C'est la propriété php_self qui nous l'indique : 
	// Quand on vient de index : 
	// [PHP_SELF] => /chatISIG/index.php 
	// Quand on vient directement par le répertoire templates
	// [PHP_SELF] => /chatISIG/templates/accueil.php

	// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
	// Pas de soucis de bufferisation, puisque c'est dans le cas où on appelle directement la page sans son contexte
	if (basename($_SERVER["PHP_SELF"]) != "index.php")
	{
		header("Location:../index.php?view=accueil");
		die("");
	}

?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<!-- **** H E A D **** -->
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Les recettes du chef</title>
		<link rel="stylesheet" type="text/css" href="css/accueil.css"/>
	</head>
	<!-- **** F I N **** H E A D **** -->


	<!-- **** B O D Y **** -->
	<body>

		<h1 id="anciens_plannings"> MES ANCIENS PLANNINGS </h1>
		<div id=liste>
			<?php
			echo '$_SESSION["id_pers"]='.$_SESSION["id_pers"];
				$planning=liste_planning($_SESSION["id_pers"]);
				mkLiens($planning, "num_semaine","num_semaine","index.php?view=planning","num_semaine");
			?>
		</div>

		<h1 id="recettes_fav"> MES RECETTES FAVORIES </h1>
		<div id=liste>
			<?php
				$recettes=liste_recette_fav($_SESSION['id_pers']);
				mkLiens($url="index.php",$recettes['num_semaine'],$qs="view=planning&num_semaine=$planning","");
			
			?>
		</div>

		<h1 id="avis"> MES AVIS </h1>
		<div id=liste>
			<?php
				$avis=liste_avis_personne($_SESSION['id_pers']);
				mkLiens($avis,"","","");
			?>
		</div>

		<h1 id="coordonnes"> MES COORDONNÉES </h1>
		<div id=liste>
			<?php 
			echo "<div id='pseudo'> PSEUDO ".$_SESSION['pseudo']."</div>";
			$mail= "lol";
			echo "<div id='pseudo'> ADRESSE MAIL ".$mail."</div>";
			?>
			
		</div>

	</body>
	<!-- **** F I N **** B O D Y **** -->

</html>
