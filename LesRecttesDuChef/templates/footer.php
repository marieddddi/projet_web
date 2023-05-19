<?php

	// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
	if (basename($_SERVER["PHP_SELF"]) != "index.php")
	{
		header("Location:../index.php");
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
		<div id="pied">
			<?php
				//TODO:  Si l'utilisateur est connecte, on affiche un lien de deconnexion 
				if (valider("connecte", "SESSION")) {
					echo '<a href="controleur.php?action=Logout">Déconnexion</a>';
				}
			?>
		</div>
	</body>
	<!-- **** F I N **** B O D Y **** -->

</html>











