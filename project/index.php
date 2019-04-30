<?php

try {
    $bdd = new PDO('mysql:host=127.0.0.1;dbname=agenda_en_ligne', 'root', 'root');
} catch(\Exception $error) {

  echo 'Impossible de se connecter à la BDD';
  exit;
}

$requete = $bdd->prepare('select * from client');

$requete->execute();

// 1 ere solution pour récupérer des resultats
//$clients = $requete->fetchAll(PDO::FETCH_ASSOC);

//foreach($clients as $client){
  //echo $client['nom'] . ' ' . $client['prenom'].'<br />';
//}

// 2 eme solution pour récupérer des resultats
while($client = $requete->fetch()){
  echo $client['nom'] . ' ' . $client['prenom'].'<br />';
}

/*
$client = $requete->fetch();
$client = $requete->fetch();
$client = $requete->fetch();

echo $client['nom'].'<br>';
*/
