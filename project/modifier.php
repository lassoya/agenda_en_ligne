<?php
require_once('connect.php');

if(isset($_GET['id'])) {
  $requete = $bdd->prepare("select * from client where id=:id");
  $requete->execute([
    'id' => $_GET['id']
  ]);
  $client = $requete->fetch();

  include('formulaire.php');
}
