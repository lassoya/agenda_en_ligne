<form action="" method="post">
  nom <input type="text" name="nom" value="<?= $client['nom'] ?? '' ?>"><br>
  prenom <input type="text" name="prenom" value="<?= $client['prenom'] ?? '' ?>"><br>
  genre <input type="text" name="genre" value="<?= $client['genre'] ?? '' ?>"><br>
  Date de naissance <input type="text" name="date_de_naissance" value="<?= $client['date_de_naissance'] ?? '' ?>"><br>
  Email <input type="text" name="email" value="<?= $client['email'] ?? '' ?>"><br>
  Téléphone <input type="telephone" name="telephone" value="<?= $client['telephone'] ?? '' ?>"><br>
  <input type="submit"  name="envoyer" value="Enregister">
</form>
