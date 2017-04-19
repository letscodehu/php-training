<?php

$config = require "config.php";
require_once "User.php";
require_once "UserRepository.php";

// a $config alapján hozzatok létre egy mysqli-t, 
// itt kell használni a UserRepository-t a mysqli segítségével

// ez lesz a "view", amiben a html tartalom van, itt látni fogod a lekérdezés eredményét és meg kell jelenítsd azt
require_once "list.php";
