<?php 

// ha egy fájlban csak egy return van, akkor azt includeolva az include visszatérési értéke a returnben szereplő érték,
// mintha a fájlban egy függvény lenne.

return array(
    // ide kerül a konfigurációja a mysql-nek egy asszociatív tömbben
    "username" => "root",
    "password" => "",
    "dbname" => "videoportal",
    "host" => "localhost"
);