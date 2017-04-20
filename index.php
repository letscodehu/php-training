<?php

$config = require "config.php";
require_once "User.php";
require_once "Controller.php";
require_once "UserRepository.php";
require_once "Application.php";
require_once "Renderer.php";
require_once "Router.php";

// az application három paramétert vár, renderert, routert és controllert.
$app = new Application(
    new Renderer(), 
    new Router(), 
    // a controller megkapja konstruktoron keresztül a user repository-t
    new Controller(
        // a user repository megkapja konstruktoron keresztül a példányt
        new UserRepository(
            // példányosítjuk a mysqli-t
            new mysqli($config["host"], $config["username"], $config["password"], $config["dbname"])
        )
    )
);

$app->start();

// ebbe a fájlba már nem kerülhet más kód