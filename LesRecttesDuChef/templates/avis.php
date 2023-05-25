<?php

	// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
	if (basename($_SERVER["PHP_SELF"]) != "index.php")
	{
		header("Location:../index.php?view=login");
		die("");
	}

?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


	<!-- **** H E A D **** -->
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Les recettes du chef</title>
		<link rel="stylesheet" type="text/css" href="css/avis.css">
	</head>
	<!-- **** F I N **** H E A D **** -->


	<!-- **** B O D Y **** -->
		<body>
        <div id="Avis">
        </div>
			<h1>Rédigez votre avis ici !</h1>
         
			<div id="formAvis">
				<form action="controleur.php" method="GET">
					<div class ="log"><p>Titre de l'avis: </p><input type="text" id="titre" name="titre" value="" required/></div><br />
					<div class ="log"><p>Contenu de l'avis: </p><textarea id="contenu" name="contenu" rows="4" cols="50" required></textarea></div><br />
					<input type="submit" name="action" value="Envoyer" id="envoyer"/>
				</form>
			</div>


		</div>


       
	</body>
<!-- **** F I N **** B O D Y **** -->

</html>