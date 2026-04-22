// represente le type de licence à appliquer en général MIT
// SPDX-License-Identifier: GPL-3.0

// defini la version du compilateur à utiliser.
pragma solidity 0.8.1;

// nom du contrat
contract Hello {
    // definition d'une variable string
    string hello = "hello world";

    //la fonction qui va chercher le contenu de la variable hello cette fonction est publique donc directement accessible.
    // toutes les fonctions qui n'effectuent pas d'operations sont des fonctions de type view celle ci retourne un string (memory est  à ajouter si nous sommes dans le cas d'un string)
    function sayHello() public view returns (string memory) {
        //la fonction retournera donc le contenu de hello.

        return hello;
    }
}
