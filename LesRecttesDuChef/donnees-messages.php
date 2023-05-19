<?php
	// Couche de fourniture de données qui se contente
	// d'envoyer les données des messages d'une conversation
	// au format JSON
	
	include_once "libs/maLibUtils.php";
	include_once "libs/maLibSQL.pdo.php";
	include_once "libs/maLibSecurisation.php"; 
	include_once "libs/modele.php"; 
			
  if ($idConv = valider("idConv", "GET")) {
	  echo listerMessages($idConv, "JSON");
  }
?>
