<?php
require_once('connect.php');

if(isset($_GET['id_client']) && $_POST){
  $requete = $bdd->prepare("insert into adresse ".
  " (rue, code_postal, numero, ville, id_client) ".
  " values (:rue, :code_postal, :numero, :ville, :id_client)");

  $reponse = $requete->execute([
    'rue' => $_POST['rue'] ?? '',
    'code_postal' => $_POST['code_postal'] ?? '',
    'numero' => $_POST['numero'] ?? '',
    'ville' => $_POST['ville'] ?? '',
    'id_client' => $_GET['id_client'],
  ]);

  if($reponse){
    header('location: modifier.php?id='. $_GET['id_client']);
    exit;
  } else {
    print_r($requete->errorInfo());
  }

}


include('formulaire_adresse.php');
