<?php

$config = require "config.php";
require_once "User.php";
require_once "UserRepository.php";

// a videoportal.sql-t a phpmyadmin segítségével importáld
// a $config alapján hozzatok létre egy mysqli-t, 
// itt kell használni a UserRepository-t a mysqli segítségével

$mysqli = new mysqli($config["host"], $config["username"], $config["password"], $config["dbname"]);
// az első parancs mindig ez legyen, kivéve ha más kódolást használunk,hogy az ékezetek megfelelően jelenjenek meg
$mysqli->set_charset("utf8");

$userRepository = new UserRepository($mysqli);

$users = $userRepository->fetchAll(); 

$updatableUser = $users[0]; // lekérjük a tömbb első elemét, update miatt

$updatableUser->setPassword("42");

// updateljük a usert és az visszaadja az updatelt változatot
$updatedUser = $userRepository->update($updatableUser);
// var_dump($updatedUser);

// létrehozunk egy felhasználót insertre
$user = new User();
// besetteljük rajta az értékeket, mert privát változókat egyébként nem érünk el
$user->setName("name");
$user->setPassword("password");
$user->setEmail("email@addre.ss");

$insertedUser = $userRepository->create($user);
// var_dump($insertedUser);
// ez lesz a "view", amiben a html tartalom van, itt látni fogod a lekérdezés eredményét és meg kell jelenítsd azt
require_once "list.php";
