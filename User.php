<?php

/**
*   Ez lesz az egyes rekordok reprezentációja a users táblában. Minden rekord egy usert jelent.
*/
class User {

    private $id, $email, $name, $password;

    /**
    *   Alább a getterek az egyes fieldekre, ezeket meghívva tudjuk elérni őket kívülről.
    */

    public function getName() {
        return $this->name;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getPassword() {
        return $this->password;
    }

    public function getId() {
        return $this->id;
    }

    // alább a setterek találhatóak, ezekkel tudjuk őket kívülről beállítani
    // az ID-nak nincs settere, mert azt a UserRepository-n belül a mysqli csinálja

    public function setName($name) {
        $this->name = $name;
    }

    public function setEmail($email) {
        $this->email = $email;
    }

    public function setPassword($password) {
        $this->password = sha1($password);
    }

}