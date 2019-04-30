<?php
require_once('connect.php');

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
