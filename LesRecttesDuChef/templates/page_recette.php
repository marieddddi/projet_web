<?php

	include_once("libs/modele.php");
	//C'est la propriété php_self qui nous l'indique : 
	// Quand on vient de index : 
	// [PHP_SELF] => /chatISIG/index.php 
	// Quand on vient directement par le répertoire templates
	// [PHP_SELF] => /chatISIG/templates/accueil.php

	// Si la page est appelée directement par son adresse, on redirige en passant pas la page index
	// Pas de soucis de bufferisation, puisque c'est dans le cas où on appelle directement la page sans son contexte
	if (basename($_SERVER["PHP_SELF"]) != "index.php")
	{
		header("Location:../index.php?view=accueil");
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
			
			<h1 id="pres"></h1>

			<div id="corps">                      
				<?php
				$idRecette = valider("id_page_recette");
				if (!$idRecette)
				{
					// pas d'identifiant ! On redirige vers la page de choix de la conversation
				
					// NB : pose quelques soucis car on a déjà envoyé la bannière... 
					// Il y a opportunité d'écrire cette bannière plus tard si on la place en absolu
					header("Location:index.php?view=accueil"); 
					die("idpage_recette manquant");
				}
				
                //changer pour chaque recette la que test !!!
                $titre=titre_recette($idRecette);
                echo $titre;
                $photopres=image_recette($idRecette,1);
                echo "<div class='image'> <img src=".$photopres."></div>";
                $tempsPrep=tempsPreparation($idRecette);
                if (substr($tempsPrep, 0, 3) === "00:") {
                    $tempsPrep = substr($tempsPrep, 3);
                }
                echo "<div class='tempsPrep'> Préparation ".$tempsPrep." minutes </div>";
                $tempsCuis=tempsCuisson($idRecette);
                if (substr($tempsCuis, 0, 3) === "00:") {
                    $tempsCuis = substr($tempsCuis, 3);
                }
                echo "<div class='tempsCuisson'> Cuisson ".$tempsCuis." minutes </div>";
                $note=note($idRecette);
                echo "<div class='note'> Laisse ton avis ! ".$note."/5 </div>";
				$listeIngredients=Liste_ingredients($idRecette);
				echo "LES INGRÉDIENTS :";

				foreach($listeIngredients as $val) echo "<div class='ingredient'>" . $val['quantite'] . " ". $val['unite_universelle']." ".$val['nom']. "</div>";
                $photoingr1=image_recette($idRecette,2);
				$photoingr2=image_recette($idRecette,3);
                echo "<div class='imageIngredients'> <img src=".$photoingr1."> <img src=".$photoingr2."></div>";

				$liste_etape=liste_etapes($idRecette);
				echo "LES ETAPES :".$liste_etape;

				$photofinal=image_recette($idRecette,4);
				echo "<div class='imageFinal'> <img src=".$photofinal."></div>";
				$avis=liste_avis($idRecette);
				foreach($avis as $val) echo "<div class='avis'>" . $val['titre'] . " ". $val['texte_avis']." ".$val['pseudo']. "</div>";
               

				

				



				

				
                
				?>
			</div>
		</body>
	<!-- **** F I N **** B O D Y **** -->

</html>
