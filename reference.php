<?php
function calcul(&$a){
  $a = $a + 10;
}

$a = 5;


calcul($a);
calcul($a);

echo $a;
