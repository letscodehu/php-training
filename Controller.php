<?php

/**
* Ez az osztály felelős azért, hogy a router által adott route string alapján lekérje az adatokat a user repositoryból és visszaadjon egy 
* tömböt, aminek első eleme a view neve, a második pedig egy tömb a változókkal, amiket a view-ban fogunk használni.
*/
class Controller {

    private $userRepository;

    /**
    *
    */
    public function __construct(UserRepository $userRepository) {
        $this->userRepository = $userRepository;
    }

    /**
    *   Ez a metódus kapja meg az információkat a routertől, ami alapján eldönti, hogy a userRepository-ból milyen adatokat kérjen le
    *   és mi legyen a template neve, amit a renderer használ.
    */
    public function handleRequest($routeName, $additionalInfo = null) {

    }

}