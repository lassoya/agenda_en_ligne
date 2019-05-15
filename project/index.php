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
?>
<table border="1">
  <tr>
    <th>NOM</th>
    <th>PRENOM</th>
    <th>MODIFIER</th>
    <th>SUPPRIMER</th>
  </tr>
<?php
while($client = $requete->fetch()){
  echo "<tr><td>".$client['nom'] . '</td><td>' . $client['prenom'].'</td>';
  echo '<td><a href="modifier.php?id='.$client['id'].'">ici</a></td>';
  echo '<td><a href="supprimer.php?id='.$client['id'].'">ici</a></td></tr>';
}

?>
</table>
<?php

/*
$client = $requete->fetch();
$client = $requete->fetch();
$client = $requete->fetch();

echo $client['nom'].'<br>';
*/
