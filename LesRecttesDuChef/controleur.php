
<?php

	session_start();

	include_once "libs/maLibUtils.php";
	include_once "libs/maLibSQL.pdo.php";
	include_once "libs/maLibSecurisation.php"; 
	include_once "libs/modele.php"; 

	//faire avec post ?????
	$qs = $_GET;
		
	if ($action = valider("action"))
	{
		ob_start ();
		echo "Action = '$action' <br />";
		// ATTENTION : le codage des caractères peut poser PB si on utilise des actions comportant des accents... 
		// A EVITER si on ne maitrise pas ce type de problématiques

		/* TODO: A REVOIR !!
		// Dans tous les cas, il faut etre logue... 
		// Sauf si on veut se connecter (action == Connexion)

		if ($action != "Connexion") 
			securiser("login");
		*/

		// Un paramètre action a été soumis, on fait le boulot...
		switch($action)
		{
			// Connexion //////////////////////////////////////////////////
			case 'SE CONNECTER' :
				$qs = array("view" => "accueil");
				// On verifie la presence des champs login et passe
				if ($login = valider("login"))
				if ($passe = valider("passe"))
				{
					// On verifie l'utilisateur, 
					// et on crée des variables de session si tout est OK
					// Cf. maLibSecurisation
					if (verifUser($login,$passe)) 
					{
						// tout s'est bien passé, doit-on se souvenir de la personne ? 
						if (valider("remember")) 
						{
							setcookie("login",$login , time()+60*60*24*30);
							setcookie("passe",$password, time()+60*60*24*30);
							setcookie("remember",true, time()+60*60*24*30);
						} 
						else {
							setcookie("login","", time()-3600);
							setcookie("passe","", time()-3600);
							setcookie("remember",false, time()-3600);
						}
					}
				} 
			// On affiche deconnexion?>
		
<?php
			break;

		

			case 'Logout' :
				// traitement métier
				session_destroy();
				$qs = array("msg" => "Déconnexion réussie","view" => "accueil");
			break;
      

			case 'INSCRIVEZ-VOUS EN CLIQUANT ICI':
				$qs = array("view" => "creer_compte");
			break;
	  

			case "S INSCRIRE" :
				
				$qs = array("msg" => "Compte créé avec succès","view" => "accueil");

				$pseudo = valider("pseudo");
				$passe = valider("passe");
				$passe2 = valider("passe2");
				$email = valider("mail");

				
				// Valider l'email
				if(!validateMail($email)){
					echo "L'adresse e-mail est invalide";
					$qs = array("msg" => " adresse email non valide","view" => "creer_compte");
					break;
				}

				if ($passe != $passe2) 
				{
					$qs = array("msg" => " Les mots de passe ne correspondent pas","view" => "creer_compte");
					break;

				//afficher le message sur la page creer_compte

				} 
				if (veriflogin($pseudo)) 
				{
					$qs = array("msg" => " Ce login est déjà utilisé","view" => "creer_compte");
					//mettre un texte qui affiche que ca marche pas
				}
				else {
					creer_compte($pseudo, $passe, $email);
					$qs = array("view" => "accueil");

				}
			break;
	  

			case "Mon compte" :
				$qs = array("view" => "mon_compte");
			break;
	  

			case "ValiderModificationCompte" :
				$qs = array("view" => "accueil");
				$qs["msg"] = "Compte modifié avec succès";
				$qs["msgType"] = "success";
				$qs["msgTitle"] = "Succès";
				$qs["msgIcon"] = "check";

				$login = valider("login");
				$passe = valider("passe");
				$passe2 = valider("passe2");
				$nom = valider("nom");
			break;


			case "generateur" :
				$qs = array("view" => "generateur");
			break;


			case "galerie" :
				$qs = array("view" => "galerie");
			break;


			case "surprise" :
				$qs = array("view" => "surprise");
			break;


			case "MENU DE FETE" :
				$qs = array("view" => "menu_de_fete");
				
			break;


			case "propos":
				$qs = array("view" => "propos");
			break;

			case "contact":
				$qs = array("view" => "contact");
			break;

			case "equipe":
				$qs = array("view" => "equipe");
			break;

			case "sevices":
				$qs = array("view" => "sevices");
			break;
			
		}
		
	}

	// On redirige toujours vers la page index, mais on ne connait pas le répertoire de base
	// On l'extrait donc du chemin du script courant : $_SERVER["PHP_SELF"]
	// Par exemple, si $_SERVER["PHP_SELF"] vaut /chat/data.php, dirname($_SERVER["PHP_SELF"]) contient /chat

	$urlBase = dirname($_SERVER["PHP_SELF"]) . "/index.php";
	// On redirige vers la page index avec les bons arguments

	//header("Location:" . $urlBase . $qs);
	rediriger($urlBase, $qs);

	// On écrit seulement après cette entête
	ob_end_flush();

?>




