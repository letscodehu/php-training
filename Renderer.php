<?php

/**
*   Ez az osztály felelős azért, hogy megkeresse a megfelelő template fájlt és kiírja annak a tartalmát. Más objektum nem 
*   include-olhat vagy írhat ki semmit a kész kódban.
*/
class Renderer {
    
    /**
    * Ez a metódus felelős azért, hogy a kapott view name és adatok alapján kiírja a HTML tartalmat.
    * a $data tömb adatait az extract segítségével tudod "kicsomagolni", ezután include segítségével pedig a template-et
    * behúzni.
    */
    public function render($viewName, $data) {

    }

}