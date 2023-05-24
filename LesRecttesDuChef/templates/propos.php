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
		
	</head>

	<!-- **** F I N **** H E A D **** -->



	<!-- **** B O D Y **** -->

	<body>
        <a href="index.php?view=services">Services</a>
		<hr>
        <a href="index.php?view=equipe">L'équipe</a>
		<hr>
        <a href="index.php?view=contact">Nous contacter</a>
	</body>

	<!-- **** F I N **** B O D Y **** -->

</html>
