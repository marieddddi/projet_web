<?php

// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php")
{
	header("Location:../index.php?view=chat&" . $_SERVER["QUERY_STRING"]);
	// Il faut renvoyer le reste de la chaine de requete... 
	// A SUIVRE : ne marche que pour requetes GET
	// Un appel à http://localhost/chatISIG/templates/chat.php?idConv=2
	// renvoie vers http://localhost/chatISIG/index.php?view=chat&idConv=2
	
	die("");
}

include_once("libs/modele.php");
include_once("libs/maLibUtils.php");
include_once("libs/maLibForms.php");


// On récupère l'id de la conversation à afficher, dans idConv
$idConv = valider("idConv");
if (!$idConv)
{
	// pas d'identifiant ! On redirige vers la page de choix de la conversation

	// NB : pose quelques soucis car on a déjà envoyé la bannière... 
	// Il y a opportunité d'écrire cette bannière plus tard si on la place en absolu
	header("Location:index.php?view=conversations"); 
	die("idConv manquant");
}

// On récupère les paramètres de la conversation
$idConv = valider("idConv", "GET");
$infosConvs = getConversation($idConv);

// Si aucune conversation n'a cet id
// Note : pas satisfaisant car on devrait faire la
//        redirection avant d'avoir envoyé des
//        données HTML...
if (count($infosConvs) === 0) {
  rediriger("index.php", array(
    "view" => "conversations",
    "msg" => "Aucune conversation avec cet identifiant"
  ));
}
$infos = $infosConvs[0];

// Afficher le thème de la conversation courante
echo "<h2 class=\"theme\">$infos[theme]</h2>\n";

echo "<div id=\"messages\">";

/*
// afficher les messages 
$messages = listerMessages($idConv);
foreach ($messages as $m) {
  echo ("<p class=\"message\" style=\"color: " .
    $m["couleur"] . "\">" .
    "[" . $m["auteur"] . "] " .
    $m["contenu"] . "</p>\n");
}
*/

echo "</div>\n";

// Si conversation active
// Si l'utilisateur connecté
if ($infos["active"] &&
    valider("connecte", "SESSION")) {
  // Afficher un formulaire permettant de poster un nouveau message 
  mkForm("controleur.php");
    mkInput("text", "contenu", "");
    mkInput("submit", "", "✉️");
    mkInput("hidden", "action", "Poster");
    mkInput("hidden", "view", "chat");
    mkInput("hidden", "idConv", $idConv);
  endForm();
}
?>














