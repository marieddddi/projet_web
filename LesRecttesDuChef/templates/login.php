<?php

// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php") {
	header("Location:../index.php?view=login");
	die("");
}

// Chargement eventuel des données en cookies
$login = valider("login", "COOKIE");
$passe = valider("passe", "COOKIE");

?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


	<!-- **** H E A D **** -->

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Les recettes du chef</title>
		<link rel="stylesheet" type="text/css" href="css/login.css">
	</head>
	<!-- **** F I N **** H E A D **** -->


	<!-- **** B O D Y **** -->
	<body id="tout">
		<div id="corps">
			<div id="image">
				<img src="ressources/chef.png" />
			</div>
			<p id="mess">Se connecter</p>

			<div id="formLogin">
				<form action="controleur.php" method="GET">
					<div class="log"><label for="login"> Pseudo </label><input type="text" id="login" name="login"
							value="<?php echo $login; ?>" /></div><br />
					<div class="log"><label for="passe">Mot de passe </label><input type="password" id="passe" name="passe"
							value="<?php echo $passe; ?>" /></div><br />

					<div id="coco">
						<input type="submit" name="action" value="SE CONNECTER" id="compte" />
					</div>

					<div id="coco1"><input type="submit" name="action" value="INSCRIVEZ-VOUS EN CLIQUANT ICI"
							id="pascompte" /></div>
				</form>
			</div>
		</div>
	</body>


	<!-- **** F I N **** B O D Y **** -->
</html>