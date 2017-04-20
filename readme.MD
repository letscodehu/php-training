A feladatban el kell érni, hogy a `/?action=list` URL esetében a `list.php` tartalma jelenjen meg a `UserRepository::fetchAll` (nem statikus!) hívásának az eredményével. Ehhez implementálni kell egy egyszerű `Router` logikát, a `Controller`-ben a `Router` által visszaadott válasz alapján ki kell választani a szükséges template-et és le kell kérni az adatokat az adatbázisból. Ezután ezt a megadott szerkezetben át kell adni a HtmlRenderernek, ami ezek alapján kicsomagolja a tömb adatait és beincludolja a már korábban is használt template-et.

A fájlok, amikben dolgozni kell:
    
 - Application.php
 - Controller.php
 - HtmlRenderer.php
 - Router.php
 - config.php (szükség szerint)
 - templates/ (az extrák alapján)
    
Extra:

 - Egészítsd ki a `list.php`-t. Helyezz el egy `Hozzáadás` feliratú linket, ami a `/?action=add` URL-re mutat.
 - Érd el, hogy a `/?action=add` URL esetében egy általad létrehozott template jelenjen meg, ami a felhasználó hozzáadására szolgál, egy POST űrlappal,
  ami ugyanerre az URL-re mutat.
 - Érd el, hogy a `/?action=add` URL esetében, amennyiben az POST kérés, mentse le a felhasználót az adatbázisba és ezután header() segítségével irányítson át a `/?action=list` oldalra.
 - A mellékelt `list.php`-t egészítsd ki, minden felhasználóhoz tartozzon egy `Töröl` gomb, ami a `?action=delete&id=<userid>` és egy `Szerkeszt` gomb, ami a `?action=edit&id=<userid>` URL-re mutat a táblázat soraiban.
 - Érd el, hogy a `?action=delete&id=<userid>` URL-re érkezve törölje a felhasználót és irányítson át a `/?action=list` oldalra.
  - Érd el, hogy a `?action=edit&id=<userid>` URL esetében egy általad létrehozott template jelenjen meg, feltöltve a UserRepository::findUserById által visszaadott adatokkal, ami a felhasználó szerkesztésére szolgál, egy POST űrlappal, ami ugyanerre az URL-re mutat.
  - Érd el, hogy a `?action=edit&id=<userid>` URL esetében, amennyiben az POST kérés, mentse le a felhasználó változásait az adatbázisba és ezután header() segítségével irányítson át a `/?action=list` oldalra.