<form action="" method="post">
  rue <input type="text" name="rue" value="<?= $adresse['rue'] ?? '' ?>"><br>
  code postal <input type="text" name="code_postal" value="<?= $adresse['code_postal'] ?? '' ?>"><br>
  numéro <input type="text" name="numero" value="<?= $adresse['numero'] ?? '' ?>"><br>
  Ville <input type="text" name="ville" value="<?= $adresse['ville'] ?? '' ?>"><br>
  <input type="submit"  name="envoyer" value="Enregister">
</form>
