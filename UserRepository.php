<?php

/**
* A userekért felelős data access object. Minden egyes rekord a users táblában egy User objektumot jelent.
*/
class UserRepository {

    /**
    * $this->mysqli-ként érjük el, a mysqli példányát tároljuk benne
    */
    private $mysqli;

    /**
    * Konstruktoron át átadjuk az osztálynak a mysqli-t és eltároljuk azt a példány mysqli tagváltozójában.
    */
    public function __construct($mysqli) {
        $this->mysqli = $mysqli;
    }

    /**
    * updateli a usert a db-ben, amit kapott és visszatér a már updatelt user objektummal
    */
    public function update(User $user)  {
        // a mysqli-t használva updateljük a felhasználót, ami az adott ID-n van
        $this->mysqli->query("UPDATE users SET name='".$user->getName()."',
        email='".$user->getEmail()."',
        password='".$user->getPassword()."' WHERE id = '".$user->getId()."'");
        // ezután a usertől lekérjük az ID-ját és visszaadjuk azt.
        return $this->fetchUserById($user->getId());
    }

    /**
    *   törli a usert az id alapján és true/false-al tér vissza az alapján, hogy sikerült-e vagy sem
    *   hint: ha nem törölt semmit, akkor az affected rows száma 0
    */
    public function deleteById($userId) {
        $this->mysqli->query("DELETE FROM users WHERE id= '".$userId."'");
        // ha az affected rows nagyobb, mint 0, akkor sikeres volt a törlés, egyébként nem volt már ilyen ID-jú felhasználó
        return $this->mysqli->affected_rows > 0;
    }

    /**
    *   létrehozza a usert a kapott objektum alapján, ezután lekérdezi az ID-t, amivel létre lett hozva
    *   és az alapján visszatölti azt http://php.net/manual/en/mysqli.insert-id.php
    */
    public function create(User $user) {
        // beillesztjük a felhasználót, getterekkel kérjük le a fieldek nevét
        $this->mysqli->query("INSERT INTO users (name, email, password) VALUES (
        '".$user->getName(). "','".
        $user->getEmail()."','"
        .$user->getPassword()."')");
        // lekérjük a legutóbb beillesztett ID-t, ami a userünké és utána azzal kérjük le a db-ből a felhasználót
        // a $this->fetchUserById áthív a lentebb definiált metódusra és az visszatér egy felhasználóval
        // azért kérjük le külön, mert az SQL feltölthet bizonyos mezőket helyettünk, amiket csak így egy újboli lekéréssel
        // tudunk meg.
        return $this->fetchUserById($this->mysqli->insert_id);
    }

    /**
    *  lekéri az adott usert User objektum formájában az ID alapján
    */
    public function fetchUserById($userId) {
        $results = $this->mysqli->query("SELECT * FROM users WHERE id = '". $userId. "'");
        // mivel itt csak egy user objektumot kérünk le, ezért nem kell a while loop
        return $results->fetch_object("User");
    }

    /**
    *   lekéri az összes usert egy tömbben.
    */
    public function fetchAll() {
        // a $results visszaadja a nyers választ a mysqltől
        $results = $this->mysqli->query("select * from users");
        // létrehozzuk a tömböt, amibe a user objektumokat fogjuk tárolni
        $users = array();
        // a fetch_object metódus User objektumokkal fog visszatérni, amíg el nem fogynak a válaszból
        // ha elfogy, false értéket ad vissza, ami értéket a $userhez rendeli, így a while nem fut tovább
        while($user = $results->fetch_object("User")) {
            // belerakjuk a korábban létrehozott tömbbe a user objektumot
            $users[] = $user;
        }
        // visszatérünk a usereket tartalmazó tömbbel
        return $users;
    }

}