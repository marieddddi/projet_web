<?php

	// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
	if (basename($_SERVER["PHP_SELF"]) != "index.php")
	{
		header("Location:../index.php");
		die("");
	}

	// Pose qq soucis avec certains serveurs...
	echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";

?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


		<!-- **** H E A D **** -->
		<head>	
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title>Les recettes du chef</title>
			<link rel="stylesheet" type="text/css" href="css/header.css">

			<script>
				function toggleDiv() {
					var x = document.getElementById("texte");
					if (x.style.display === "none") {
						x.style.display = "block";
					} 
					else {
						x.style.display = "none";
					}
				}
			</script>

		</head>
		<!-- **** F I N **** H E A D **** -->


		<!-- **** B O D Y **** -->
		<body>

			<div id="banniere">
				
				<div id="image_gauche">
					<div id="menu_img">
						<img src="ressources/logo.png" alt="Cliquez pour afficher le menu" onclick="toggleDiv()" />
					</div>

					<div id="logo">
						<img src="ressources/logo.png" />
					</div>
				</div>

				<div id="secoco">
					<?php
					//Si l'utilisateur n'est pas connecte, on affiche un lien de connexion 
					if (!valider("connecte", "SESSION")) {
					echo "<a href=\"index.php?view=login\">Se connecter / S'inscrire </a>\n";
					}
					if (valider("connecte", "SESSION")) {
						echo '<a href="controleur.php?action=Logout">Déconnexion</a>';
					}
					?>
				</div>

				<div id="moncompte">
					<img src="ressources/moncompte.png" />
					<a href="index.php?view=mon_compte">Mon Compte</a>
				</div>
			</div>

			<div id="texte" class="hidden">
				<a href="index.php?view=accueil">ACCUEIL</a>
				<a href="index.php?view=generateur">GENERATEUR</a>
				<a href="index.php?view=galerie">GALERIE</a>
				<a href="index.php?view=surprise">SURPRISE</a>
				<a href="index.php?view=menu_de_fete">MENU DE FETE</a>
				<a href="index.php?view=propos">A PROPOS</a>
			</div>
		</body>
	<!-- **** F I N **** B O D Y **** -->

</html>