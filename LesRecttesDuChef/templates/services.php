<?php
	// Si la page est appelée directement par son adresse, on redirige en passant par la page index
	if (basename($_SERVER["PHP_SELF"]) != "index.php") {
		header("Location:../index.php");
		die("");
	}

	// Pose quelques soucis avec certains serveurs...
	echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";
?>


<!DOCTYPE html>
<html lang="fr">

	<!-- **** H E A D **** -->

	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Les recettes du chef</title>
		<link rel="stylesheet" type="text/css" href="css/header.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="js/header.js"></script>
	</head>

	<!-- **** F I N **** H E A D **** -->



	<!-- **** B O D Y **** -->

	<body>
       <h1>Nos services de recettes de cuisine</h1>
       <p>BIENVENUE SUR NOTRE PAGE DE SERVICES, OÙ NOUS PRÉSENTONS LES DIFFÉRENTS OUTILS ET FONCTIONNALITÉS QUE
NOUS PROPOSONS POUR AIDER LES PASSIONNÉS DE CUISINE À CRÉER DES PLATS SAVOUREUX ET CRÉATIFS. CE SITE WEB
COMPORTE UN GÉNÉRATEUR DE PLANNING DE RECETTES PERSONNALISÉ QUI PERMET DE TROUVER DES IDÉES DE REPAS EN
FONCTION DES INGRÉDIENTS DISPONIBLES ET DES PRÉFÉRENCES CULINAIRES. NOUS METTONS AUSSI À DISPOSITION LA
BANQUE DE RECETTES QUE VOUS TROUVEREZ DANS LA GALERIE.</p>
        <div>
            <h2>GÉNÉRATEUR PLANNING DE RECETTES PERSONNALISÉ :</h2>
            <p>NOTRE GÉNÉRATEUR DE PLANNING DE RECETTES EST UN
OUTIL PRATIQUE QUI VOUS AIDE À TROUVER DES
RECETTES EN FONCTION DE VOS PRÉFÉRENCES
ALIMENTAIRES ET DES INGRÉDIENTS DONT VOUS
DISPOSEZ.
IL SUFFIT DE SÉLECTIONNER LES INGRÉDIENTS QUE VOUS
SOUHAITEZ UTILISER ET DE PRÉCISER VOS PRÉFÉRENCES
DE TEMPS DE PRÉPARATION, DE NIVEAU DE DIFFICULTÉ,
ET NOTRE GÉNÉRATEUR DE RECETTES SE CHARGE DU
RESTE.
ESSAYEZ-LE MAINTENANT POUR DÉCOUVRIR DE
NOUVELLES IDÉES DE REPAS !</p>
            <h2>BIBLIOTHÈQUE DE RECETTES :</h2>
            <p>NOTRE SITE PROPOSE ÉGALEMENT UNE VASTE BIBLIOTHÈQUE
DE RECETTES DE CUISINE, AVEC DES PLATS TRADITIONNELS ET
DES CRÉATIONS ORIGINALES. VOUS POUVEZ PARCOURIR NOTRE
CATALOGUE DE RECETTES EN FONCTION DE DIFFÉRENTS
CRITÈRES, TELS QUE LES INGRÉDIENTS, LES TEMPS DE
PRÉPARATION ET DE CUISSON, ET PLUS ENCORE.
NOUS METTONS À JOUR RÉGULIÈREMENT NOTRE COLLECTION
DE RECETTES POUR VOUS OFFRIR DE NOUVELLES IDÉES DE
REPAS À CHAQUE VISITE.</p>
        </div>

	</body>

	<!-- **** F I N **** B O D Y **** -->

</html>
