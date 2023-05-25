<?php

include_once "libs/maLibSQL.pdo.php";

/*
Dans ce fichier, on définit diverses fonctions permettant de récupérer des données utiles pour notre TP d'identification. Deux parties sont à compléter, en suivant les indications données dans le support de TP
*/


/********* PARTIE 1 : prise en main de la base de données *********/


// inclure ici la librairie faciliant les requêtes SQL



function image_recette($id_recette,$num){
	switch ($num){
		case 1:
			$sql = "SELECT lien_presentation 
				FROM ILLUSTRATIONS
				WHERE id_page_recette = '$id_recette'";
				break;
		case 2:
			$sql = "SELECT INGREDIENTS.lien_photo
				FROM INGREDIENTS 
				JOIN ILLUSTRATIONS ON INGREDIENTS.id_ingredient = ILLUSTRATIONS.id_ingredient1
				WHERE ILLUSTRATIONS.id_page_recette = '$id_recette'";
				break;
		case 3:
			$sql = "SELECT INGREDIENTS.lien_photo
				FROM INGREDIENTS 
				JOIN ILLUSTRATIONS ON INGREDIENTS.id_ingredient = ILLUSTRATIONS.id_ingredient2
				WHERE ILLUSTRATIONS.id_page_recette = '$id_recette'";
				break;
		case 4: 
			$sql = "SELECT lien_final
				FROM ILLUSTRATIONS
				WHERE id_page_recette = '$id_recette'";
				break;
		default:
			$sql = "SELECT lien_presentation 
				FROM ILLUSTRATIONS
				WHERE id_page_recette = '$id_recette'";
				break;
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

function verifUserBdd($pseudo,$mot_de_passe)
{
	// Vérifie l'identité d'un utilisateur 
	// dont les identifiants sont passes en paramètre
	// renvoie faux si user inconnu
	// renvoie l'id de l'utilisateur si succès

	$SQL="SELECT id_pers FROM PERSONNE WHERE pseudo='$pseudo' AND mot_de_passe='$mot_de_passe'";

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

function tempsPreparation($id_recette){
	$sql="SELECT temps_prep 
	FROM PAGE_RECETTES
	WHERE id_page_recette='$id_recette' ";
	return SQLGetChamp($sql);
}

function tempsCuisson($id_recette){
	$sql="SELECT temps_cuisson 
	FROM PAGE_RECETTES
	WHERE id_page_recette='$id_recette' ";
	return SQLGetChamp($sql);
}


function note($id_recette){
	$sql="SELECT note 
	FROM PAGE_RECETTES
	WHERE id_page_recette='$id_recette' ";
	return SQLGetChamp($sql);
}

function Liste_ingredients($id_recette)
{
	$sql="SELECT I.nom, L.quantite, L.unite_universelle
	FROM INGREDIENTS AS I JOIN LISTE_INGREDIENTS AS L ON I.id_ingredient=L.id_ingredient
	JOIN PAGE_RECETTES AS P ON P.id_liste_ingredents=L.id_liste_ingredients
	WHERE P.id_page_recette='$id_recette' ";
	return parcoursRS(SQLSelect($sql));
}

function liste_etapes($id_recette)
{
	$sql="SELECT liste_etape
	FROM PAGE_RECETTES
	WHERE id_page_recette='$id_recette' ";
	return SQLGetChamp($sql) ;
}

function liste_avis($id_recette)
{
	$sql="SELECT A.titre, A.texte_avis, PERSONNE.pseudo
	FROM PAGE_RECETTES AS P JOIN LISTE_AVIS AS L ON P.id_liste_avis=L.id_liste_avis
	JOIN AVIS AS A ON A.id_avis=L.id_avis
	JOIN PERSONNE ON PERSONNE.id_pers=A.id_pers
	WHERE P.id_page_recette='$id_recette' ";
	return parcoursRS(SQLSelect($sql));
}

function liste_avis_personne($id_pers)
{
	$sql = "SELECT texte_avis FROM `AVIS` WHERE id_pers = '$id_pers'";
	return parcoursRS(SQLSelect($sql));
}

function liste_recette_fav($id_pers)
{
	$sql = "SELECT lien_presentation 
	FROM `ILLUSTRATIONS`
	JOIN  PAGE_RECETTES ON PAGE_RECETTES.id_page_recette = ILLUSTRATIONS.id_page_recette
	JOIN FAVORIS ON FAVORIS.id_page_recette = PAGE_RECETTES.id_page_recette
	WHERE id_pers = '$id_pers'";
	return parcoursRS(SQLSelect($sql));
}


function verifier_recette_bdd($id_recette,$type)
{
	$sql="SELECT id_page_recette
	FROM PAGE_RECETTES
	WHERE id_page_recette='$id_recette' AND type='$type' ";
	return SQLGetChamp($sql);
}

function posterAvis($id_pers,$id_recette,$titre,$texte_avis)
{
	$sql="INSERT INTO AVIS (titre, texte_avis, id_pers)
	VALUES ('$titre','$texte_avis','$id_pers')";
	SQLInsert($sql);
	$id_avis=SQLGetChamp("SELECT id_avis FROM AVIS WHERE id_pers='$id_pers' AND titre='$titre' AND texte_avis='$texte_avis'");
	$id_liste_avis=SQLGetChamp("SELECT id_liste_avis FROM PAGE_RECETTES WHERE id_page_recette='$id_recette'");
	SQLInsert("INSERT INTO LISTE_AVIS (id_avis, id_liste_avis) VALUES ('$id_avis','$id_liste_avis')");
}

?>

