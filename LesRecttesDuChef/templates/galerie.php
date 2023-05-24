<?php
// Si la page est appelée directement par son adresse, on redirige en passant par la page index
if (basename($_SERVER["PHP_SELF"]) != "index.php") {
    header("Location:../index.php");
    die("");
}

// Pose quelques soucis avec certains serveurs...
echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";
include_once("libs/maLibForms.php");
?>


<!DOCTYPE html>
<html lang="fr">

<!-- **** H E A D **** -->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Les recettes du chef</title>
    <link rel="stylesheet" type="text/css" href="css/galerie.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<!-- **** F I N **** H E A D **** -->



<!-- **** B O D Y **** -->

    <body>
        <h1>Galerie</h1>
        <div id="filtre">

            <h1 id="Duree">Durée</h1>
            <?php

            //a refaire car moche
            $optionsDuree = array(
                array("champValue"=>"00:05:00", "champLabel"=>"00:05:00"),
                array("champValue"=>"00:10:00", "champLabel"=>"00:10:00"),
                array("champValue"=>"00:15:00", "champLabel"=>"00:15:00"),
                array("champValue"=>"00:20:00", "champLabel"=>"00:20:00"),
                array("champValue"=>"00:25:00", "champLabel"=>"00:25:00"),
                array("champValue"=>"00:30:00", "champLabel"=>"00:30:00"),
                array("champValue"=>"00:35:00", "champLabel"=>"00:35:00"),
                array("champValue"=>"00:40:00", "champLabel"=>"00:40:00"),
                array("champValue"=>"00:45:00", "champLabel"=>"00:45:00"),
                array("champValue"=>"00:50:00", "champLabel"=>"00:50:00"),
                array("champValue"=>"00:55:00", "champLabel"=>"00:55:00"),
                array("champValue"=>"01:00:00", "champLabel"=>"01:00:00"),
                array("champValue"=>"01:15:00", "champLabel"=>"01:15:00"),
                array("champValue"=>"01:30:00", "champLabel"=>"01:30:00")
              );

              $optionsNote = array(
                array("champValue"=>"0", "champLabel"=>"0"),
                array("champValue"=>"1", "champLabel"=>"1"),
                array("champValue"=>"2", "champLabel"=>"2"),
                array("champValue"=>"3", "champLabel"=>"3"),
                array("champValue"=>"4", "champLabel"=>"4"),
                array("champValue"=>"5", "champLabel"=>"5")
              );

            mkForm("controleur.php");
            mkSelect("multiple", $optionsDuree, "champValue", "champLabel");
          

            echo "<h1 id='couverts'> Couverts</h1>";
//verif si nb de couverts est un entier
            mkInput("text", "couverts", "");

             echo "<h1 id='Note'> note</h1>";
             mkSelect("multiple", $optionsNote, "champValue", "champLabel");
          
            ?>
           
            <label for="Note">Note</label>
            <?php
            mkSelect("Note", $optionsNote, "note", "label");
            ?>

            <label for="Difficulte">Difficulté</label>
            <?php
            mkSelect("Difficulte", $optionsDifficulte, "difficulte", "label");
            ?>

            <?php
            mkInput("submit", "", "Filtrer");
            mkInput("hidden", "view", "galerie");
            endForm();
            ?>
        </div>


        <div id="plats">

        </div>

    </body>

<!-- **** F I N **** B O D Y **** -->

</html>