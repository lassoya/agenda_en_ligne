<?php
require_once('connect.php');

if(isset($_GET['id'])){
  $requete = $bdd->prepare("DELETE FROM client where id= :id");
  $requete->execute([
    'id' => $_GET['id']
  ]);
  header('location: index.php');
  exit;
}
