<?php

try {
    $bdd = new PDO('mysql:host=127.0.0.1;dbname=agenda_en_ligne', 'root', 'root');
} catch(\Exception $error) {
  echo 'Impossible de se connecter à la BDD';
  exit;
}
