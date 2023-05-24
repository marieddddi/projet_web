<?php
	// Si la page est appelée directement par son adresse, on redirige en passant par la page index
	if (basename($_SERVER["PHP_SELF"]) != "index.php") {
		header("Location:../index.php");
		die("");
	}

	// Pose quelques soucis avec certains serveurs...
	echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";
?>


<!DOCTYPE html>
<html lang="fr">

	<!-- **** H E A D **** -->

	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Les recettes du chef</title>
		
	</head>

	<!-- **** F I N **** H E A D **** -->



	<!-- **** B O D Y **** -->

	<body>
        <h1>Nous contacter</h1>
        <p>
        NOUS SOMMES HEUREUX DE VOUS PROPOSER UN SITE WEB DÉDIÉ À LA CUISINE ET AUX RECETTES CRÉATIVES !
        SI VOUS AVEZ DES QUESTIONS, DES COMMENTAIRES OU DES SUGGESTIONS À PARTAGER, N'HÉSITEZ PAS À
        NOUS CONTACTER. NOUS SOMMES TOUJOURS HEUREUX D'AVOIR DE VOS NOUVELLES !
        </p>

        <h2>FORMULAIRE DE CONTACT :</h2>
        <p>
            NOUS AVONS CRÉÉ UN FORMULAIRE DE CONTACT SIMPLE ET FACILE À UTILISER POUR VOUS PERMETTRE
            DE NOUS ENVOYER UN MESSAGE.
            VOUS POUVEZ NOUS POSER DES QUESTIONS SUR
            UNE RECETTE EN PARTICULIER, NOUS PROPOSER UNE
            NOUVELLE IDÉE DE RECETTE OU SIMPLEMENT NOUS
            DONNER VOTRE AVIS SUR NOTRE SITE WEB.
            REMPLISSEZ LE FORMULAIRE CI-CONTRE ET NOUS
            VOUS RÉPONDRONS DÈS QUE POSSIBLE.
        </p>

        <h2>ADRESSE ÉLECTRONIQUE :</h2>
        <p>
            VOUS POUVEZ ÉGALEMENT NOUS ENVOYER UN E-MAIL
            DIRECTEMENT À L'ADRESSE SUIVANTE :
            LESRECETTESDUCHEF@GMAIL.COM
        </p>

        <h2>RÉSEAUX SOCIAUX :</h2>
        <p>
            NOUS SOMMES ÉGALEMENT PRÉSENTS SUR LES
            RÉSEAUX SOCIAUX, OÙ NOUS PARTAGEONS DES
            RECETTES, DES ASTUCES CULINAIRES ET DES IDÉES DE
            REPAS. VOUS POUVEZ NOUS SUIVRE SUR LES RÉSEAUX
            SOCIAUX SUIVANTS :

            INSTAGRAM : @LES_RECETTES_DU_CHEF
            TWITTER : @LES_RECETTES_DU_CHEF
            NOUS SOMMES HEUREUX DE POUVOIR ÉCHANGER AVEC NOS VISITEURS ET D'ÉCOUTER LEURS
            RETOURS ET LEURS SUGGESTIONS.

            N'HÉSITEZ PAS À NOUS CONTACTER SI VOUS AVEZ DES QUESTIONS OU DES COMMENTAIRES.
            NOUS SOMMES LÀ POUR VOUS AIDER À CUISINER DE DÉLICIEUX PLATS ET À DÉVELOPPER
            VOTRE CRÉATIVITÉ CULINAIRE !
        </p>


        <form action="controleur.php" method="GET">
            <div class="log">
                <input type="text" id="pseudo" name="pseudo" placeholder="Votre nom" />
            </div><br />
            <div class="log">
                <input type="text" id="mail" name="mail" placeholder="Votre adresse mail" />
            </div><br />
            <div class="log">
                <input type="text" id="objet" name="objet" placeholder="L'objet de votre message" />
            </div><br />
            <div class="log">
                <input type="text" id="message" name="message" placeholder="Votre message" />
            </div><br />
                            
            <input type="submit" name="action" value="ENVOYER" id="retour_client" />
        </form>


	</body>

	<!-- **** F I N **** B O D Y **** -->

</html>
