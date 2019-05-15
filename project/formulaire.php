<?= 'yooo'  ?>

<form action="" method="post">
  nom <input type="text" name="nom" value="<?= $client['nom'] ?? '' ?>"><br>
  prenom <input type="text" name="prenom" value=""><br>
  genre <input type="text" name="genre" value=""><br>
  Date de naissance <input type="text" name="date_de_naissance" value=""><br>
  Email <input type="text" name="email" value=""><br>
  Téléphone <input type="telephone" name="telephone" value=""><br>
  <input type="submit"  name="envoyer" value="Enregister">
</form>
