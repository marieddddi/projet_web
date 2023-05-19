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
		<link rel="stylesheet" type="text/css" href="css/creercompte.css">
	</head>
	<!-- **** F I N **** H E A D **** -->


	<!-- **** B O D Y **** -->
	<body id="tout">
		<div id="corps">
        <div id="image">
        <img src="ressources/chef.png"/>
        </div>
			<p>Créer mon compte</p>
         
			<div id="formLogin">
				<form action="controleur.php" method="GET">
					<div class ="log"><label for="pseudo"> Pseudo  </label><input type="text" id="login" name="pseudo" value="" /></div><br />
					<div class ="log"><label for="mail"> Adresse mail  </label><input type="text" id="mail" name="mail" value="" /></div><br />
                    <div class ="log"><label for="passe">Mot de passe  </label><input type="password" id="passe" name="passe" value="" /></div><br />
					<div class ="log"><label for="passe2">Confirmer le mot de passe  </label><input type="password" id="passe2" name="passe2" value="" /></div><br />
					
						<input type="submit" name="action" value="S INSCRIRE" id="creer"/>
				
				</form>
			</div>


		</div>
       
	</body>
<!-- **** F I N **** B O D Y **** -->

