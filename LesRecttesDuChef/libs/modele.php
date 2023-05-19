<?php

include_once "libs/maLibSQL.pdo.php";

/*
Dans ce fichier, on définit diverses fonctions permettant de récupérer des données utiles pour notre TP d'identification. Deux parties sont à compléter, en suivant les indications données dans le support de TP
*/


/********* PARTIE 1 : prise en main de la base de données *********/


// inclure ici la librairie faciliant les requêtes SQL


function listerUtilisateurs($classe = "both")
{
	// Cette fonction liste les utilisateurs de la base de données 
	// et renvoie un tableau d'enregistrements. 
	// Chaque enregistrement est un tableau associatif contenant les champs 
	// id,pseudo,blacklist,connecte,couleur

	// Lorsque la variable $classe vaut "both", elle renvoie tous les utilisateurs
	// Lorsqu'elle vaut "bl", elle ne renvoie que les utilisateurs blacklistés
	// Lorsqu'elle vaut "nbl", elle ne renvoie que les utilisateurs non blacklistés
  $sql = "SELECT *
          FROM users";
  if ($classe == "bl") {
    $sql = $sql . " WHERE blacklist";
  }
  if ($classe == "nbl") {
    $sql = $sql . " WHERE NOT blacklist";
  }
  return parcoursRs(SQLSelect($sql));
}


function image_recette($id_recette,$num){
	switch ($num){
		case 1:
			$sql = "SELECT lien_presentation 
				FROM ILLUSTRATIONS
				WHERE id_page_recette = '$id_recette'";
		case 2:
			$sql = "SELECT lien_photo
				FROM INGREDIENTS 
				JOIN ILLUSTRASTIONS ON INGREDIENTS.id_ingredient = ILLUSTRATIONS.id_ingredient1
				WHERE id_page_recette = '$id_recette'";
		case 3:
			$sql = "SELECT lien_photo
				FROM INGREDIENTS 
				JOIN ILLUSTRASTIONS ON INGREDIENTS.id_ingredient = ILLUSTRATIONS.id_ingredient2
				WHERE id_page_recette = '$id_recette'";
		case 4: 
			$sql = "SELECT lien_final
				FROM ILLUSTRATIONS
				WHERE id_page_recette = '$id_recette'";
		default:
			$sql = "SELECT lien_presentation 
				FROM ILLUSTRATIONS
				WHERE id_page_recette = '$id_recette'";
	}
	return SQLGetChamp($sql);
}


function titre_recette($id_recette){
  $sql = "SELECT nom
		  FROM PAGE_RECETTES
		  WHERE id_page_recette = '$id_recette'";
  return SQLGetChamp($sql);
}

function creer_compte($pseudo, $mdp, $mail){
  $sql = "INSERT INTO PERSONNE (pseudo, adresse_mail, mot_de_passe)
		  VALUES ('$pseudo', '$mail', '$mdp')";
  SQLInsert($sql);
}

 function veriflogin($pseudo){
  $sql = "SELECT pseudo
		  FROM PERSONNE
		  WHERE pseudo = '$pseudo'";
  return SQLGetChamp($sql);
 }

function verifUserBdd($login,$passe)
{
	// Vérifie l'identité d'un utilisateur 
	// dont les identifiants sont passes en paramètre
	// renvoie faux si user inconnu
	// renvoie l'id de l'utilisateur si succès

	$SQL="SELECT id_pers FROM PERSONNE WHERE pseudo='$login' AND mot_de_passe='$passe'";

	return SQLGetChamp($SQL);
	// si on avait besoin de plus d'un champ
	// on aurait du utiliser SQLSelect
}

function validateMail($email){
	return filter_var($email, FILTER_VALIDATE_EMAIL);
}

function titre_recette_fete($id_recette,$type){
	$sql = "SELECT nom
		FROM PAGE_RECETTES
		WHERE id_page_recette = '$id_recette' AND type = '$type'";
	return SQLGetChamp($sql);
}

function image_recette_fete($id_recette,$type){
	$sql = "SELECT lien_presentation 
		FROM ILLUSTRATIONS
		JOIN PAGE_RECETTES ON ILLUSTRATIONS.id_page_recette = PAGE_RECETTES.id_page_recette
		WHERE ILLUSTRATIONS.id_page_recette = '$id_recette' AND PAGE_RECETTES.type = '$type'";
	return SQLGetChamp($sql);
}

function liste_planning($id_pers){
	$sql = "SELECT num_semaine
		FROM PERSONNE JOIN LISTE_PLANNING ON PERSONNE.id_liste_planning= LISTE_PLANNING.id_liste_planning
		JOIN PLANNING ON PLANNING.id_planning = LISTE_PLANNING.id_planning
		WHERE id_pers = '$id_pers'";

	return parcoursRS(SQLSelect($sql));
}


?>

