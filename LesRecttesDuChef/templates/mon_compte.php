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
		<h1 id="anciens_plannings"> Mes anciens plannings </h1>
		    <div id=liste>
            <?php
            $planning=liste_planning(/*$_SESSION['id_pers']*/10);
            mkLiens($planning,"num_semaine","","");
        
            ?>
	</body>
	<!-- **** F I N **** B O D Y **** -->

</html>
