<?php

/**
*   Ez az osztály az applikációnk magja. Beleinjektáltuk minden szükséges objektumot a konstruktoron át.
*/

class Application {

    private $renderer;
    private $router;
    private $controller;

    public function __construct(HtmlRenderer $renderer, Router $router, Controller $controller) {
        $this->controller = $controller;
        $this->renderer = $renderer;
        $this->router = $router;
    }

    /**
    *   Ez a metódus indítja el az egész alkalmazást és itt is fejeződik be.
    */
    public function start() {
        // a routertől kikérjük az adott route nevét és a hozzá tartozó paramétert (ha van)
        // ezt a route és paraméter párost adjuk át a controllernek, ami alapján az visszad egy view nevet és egy tömböt
        // a tömbben lesznek azok az adatok, amiket meg akarunk jeleníteni, a view neve pedig a template neve lesz.
        // a renderer ezután a tömböt extractolja és beincludeolja a templatet.
        // az alkalmazás futása ezután leáll.
        die();
    }

}