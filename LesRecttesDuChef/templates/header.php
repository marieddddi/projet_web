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
<html lang="fr" >

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

		<div id="banniere">
			<div id="image_gauche">
				<div id="logo1">    
					<img src="ressources/menu.png" alt="Logo 1" />
				</div>

				<div id="logo2">
					<a href="index.php?view=accueil">
						<img src="ressources/logoo.png" alt="Logo 2" />
					</a>
				</div>
			</div>

			<div id="secoco">

				<?php if (!(isset($_SESSION['id_pers'])) && valider("connecte", "SESSION")) : ?>
					<div id="moncompte" class="text">
						<a href="index.php?view=mon_compte" class="text">
							<img src="ressources/moncompte2.png" alt="Mon compte" />
							<span>Mon compte</span>
						</a>
					</div>
					<a href="controleur.php?action=Logout" class="text">
						<img src="ressources/deco.png" alt="Se déconnecter" />
						<span>Se déconnecter</span>
					</a>
				<?php else : ?>
					<a href="index.php?view=login" class="text">
						<img src="ressources/moncompte2.png" alt="Se connecter" />
						<span>Se connecter</span>
					</a>		
				<?php endif; ?>
			</div>
		</div>

		<div id="navigation">
			<div class="nav-links">
				<div id="logo3">    
					<img src="ressources/menu2.png" alt="Logo 3" />
				</div> 
				<br><br>
				<a href="index.php?view=accueil">ACCUEIL</a>
				<br>
				<a href="index.php?view=generateur">GENERATEUR</a>
				<br>
				<a href="index.php?view=galerie">GALERIE</a>
				<br>
				<a href="index.php?view=surprise">SURPRISE</a>
				<br>
				<a href="index.php?view=menu_de_fete">MENU DE FETE</a>
				<a href="index.php?view=propos">A PROPOS</a>
			</div>
		</div>

	</body>

	<!-- **** F I N **** B O D Y **** -->

</html>
