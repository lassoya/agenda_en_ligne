<?php
require_once('connect.php');

$messageErreur = null;

if(isset($_POST['envoyer'])){
  $nom = isset($_POST['nom']) ? $_POST['nom'] : '';
  $prenom = isset($_POST['prenom']) ? $_POST['prenom'] : '';
  $genre = isset($_POST['genre']) && !empty($_POST['genre']) ? $_POST['genre'] : null;
  $date_de_naissance = isset($_POST['date_de_naissance']) && !empty($_POST['date_de_naissance']) ? $_POST['date_de_naissance'] : null;
  $email = isset($_POST['email']) ? $_POST['email'] : '';
  $telephone = isset($_POST['telephone']) ? $_POST['telephone'] : '';

  $requete = $bdd->prepare('insert into client (nom, prenom, genre, date_de_naissance, email, telephone) values (:nom, :prenom, :genre, :date_de_naissance, :email, :telephone)');
  $requete->bindParam(':nom', $nom);
  $requete->bindParam(':prenom', $prenom);
  $requete->bindParam(':genre', $genre);
  $requete->bindParam(':date_de_naissance', $date_de_naissance);
  $requete->bindParam(':email', $email);
  $requete->bindParam(':telephone', $telephone);


  $succeed = $requete->execute();
    /*[
    'nom' => $nom,
    'prenom' => $prenom,
    'genre' => $genre,
    'date_de_naissance' => $date_de_naissance,
    'email' => $email,
    'telephone' => $telephone,
  ]*/
  if($succeed){
    echo "Enregistrement ok !";
  } else {
    $error = $requete->errorInfo();
    if($error[0]== 45000){
      $messageErreur = $error[2];
    } else {
      print_r($error);
    }
  }
}
if($messageErreur){
  echo '<span style="color:red;font-weight: bold">'.$messageErreur."</span><br>";
}
include('formulaire.php');
