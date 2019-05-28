<?php
require_once('connect.php');
if(isset($_GET['id']) && $_POST){
  $requeteSave = $bdd->prepare('update client set '.
  'nom = :nom, prenom = :prenom, genre = :genre, date_de_naissance  = :date_de_naissance, '.
  ' email = :email, telephone = :telephone where id =:id');

  $response = $requeteSave->execute([
    'nom' => $_POST['nom'] ?? '',
    'prenom' => $_POST['prenom'] ?? '',
    'genre' => $_POST['genre'] ?? null,
    'date_de_naissance' => $_POST['date_de_naissance'] ?? null,
    'email' => $_POST['email'] ?? '',
    'telephone' => $_POST['telephone'] ?? '',
    'id' => $_GET['id'],
  ]);
  if($response){
    header('location: index.php');
    exit;
  } else {
    print_r($requeteSave->errorInfo());
  }
}


if(isset($_GET['id'])) {
  $requete = $bdd->prepare("select * from client where id=:id");
  $requete->execute([
    'id' => $_GET['id']
  ]);
  $client = $requete->fetch();

  include('formulaire.php');

echo "<a href='creation_adresse.php?id_client=" . $client['id']. "'>Ajouter une adresse</a>";
}
