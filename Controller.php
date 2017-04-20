<?php

/**
* Ez az osztály felelős azért, hogy a router által adott route string alapján lekérje az adatokat a user repositoryból és visszaadjon egy 
* tömböt, aminek első eleme a view neve, a második pedig egy tömb a változókkal, amiket a view-ban fogunk használni.
*/
class Controller {

    private $userRepository;

    /**
    *   Mivel a kontroller kéri le a repositoryból az adatokat, ezért neki kell átadjuk azt.
    */
    public function __construct(UserRepository $userRepository) {
        $this->userRepository = $userRepository;
    }

    /**
    *   Ez a metódus kapja meg az információkat a routertől, ami alapján eldönti, hogy a userRepository-ból milyen adatokat kérjen le
    *   és mi legyen a template neve, amit a renderer használ.
     *  Lekéri az adatokat a user repositoryból, ezután visszaadja a template nevével együtt az alábbi formában:
     *  array( "templateName" => "template-neve", "data" => array("kulcs" => $ertek)).
    */
    public function handleRequest($routeName, $additionalInfo = null) {

    }

}