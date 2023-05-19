<?php
// Ce fichier permet de tester les fonctions développées dans le fichier malibforms.php

// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) == "conversations.php")
{
	header("Location:../index.php?view=conversations");
	die("");
}

include_once("libs/modele.php"); // listes
include_once("libs/maLibUtils.php");// tprint
include_once("libs/maLibForms.php");// mkTable, mkLiens, mkSelect ...



?>

<h1>Conversations du site</h1>

<h2>Liste des conversations actives</h2>

<?php
// lister les conversations actives sous forme de liens 
$convs = listerConversations("actives");
mkLiens($convs, "theme", "id", "index.php?view=chat", "idConv");
?>

<h2>Liste des conversations inactives</h2>

<?php
// lister les conversations inactives sous forme de liens 
$convs = listerConversations("inactives");
mkLiens($convs, "theme", "id", "index.php?view=chat", "idConv");
?>

<hr />
<h2>Gestion des conversations</h2>

<?php

//proposer des formulaires de gestion de conversations
$convs = listerConversations("toutes");
$idConv = valider("idConv", "GET");
mkForm("controleur.php");
  mkSelect("idConv", $convs, "id", "theme",
           $idConv, "active");
  mkInput("submit", "action", "Archiver");
  mkInput("submit", "action", "Reactiver");
  mkInput("submit", "action", "Supprimer");
  mkInput("hidden", "view", "conversations");
endForm();

mkForm("controleur.php");
  mkInput("text", "theme", "");
  mkInput("submit", "action", "Nouvelle conversation");
  mkInput("hidden", "view", "conversations");
endForm();

?>















