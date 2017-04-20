<?php
/**
 * Ez az osztály felelős az egyes útvonalakért. A $_GET paraméterek alapján egy action-t és egy opcionális id-t vár, majd
 * ezeket adja vissza. Természetesen komolyabb alkalmazásoknál nem ilyen egyszerű a dolog.
 */

class Router {

    /**
     * Ez a metódus adja vissza a route nevét és a hozzá tartozó változó(ka)t.
     * Pl. /?action=list esetén egy <pre>array("route" => "list", "additionalInfo" => array())</pre>-t,
     * míg /?action=edit&id=1 esetén egy <pre>array("route" => "edit", "additionalInfo" => array("id" => 1))</pre>-t.
     */
    public function parseRequest() {

    }

}