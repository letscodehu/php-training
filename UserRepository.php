<?php

class UserRepository {

    /**
    * updateli a usert a db-ben, amit kapott és visszatér a már updatelt user objektummal
    */
    public function update(User $user)  {

    }

    /**
    *   törli a usert az id alapján és true/false-al tér vissza az alapján, hogy sikerült-e vagy sem
    *   hint: ha nem törölt semmit, akkor az affected rows száma 0
    */
    public function deleteById($userId) {

    }

    /**
    *   létrehozza a usert a kapott objektum alapján, ezután lekérdezi az ID-t, amivel létre lett hozva
    *   és az alapján visszatölti azt
    */
    public function create(User $user) {

    }

    /**
    *  lekéri az adott usert User objektum formájában az ID alapján
    */
    public function fetchUserById($userId) {

    }

    /**
    *   lekéri az összes usert egy tömbben.
    */
    public function fetchAll() {

    }


}