// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // dans le constructeur du contrat on crée une variable owner qui sera populée a l'implementation du contrat.
    // dans le cas du constructeur, msg.sender est l'adresse de l'utilisateur qui crée le contrat.
    // dans les autres cas msg.sender est l'utilisateur qui appelle le contrat.

    function getOwner() public view returns (address) {
        return owner;
        // fonction qui permet d'afficher la variable owner.
        // toutes les fonctions retournant une valeure doivent speicifier le type qu'elles retournent dans la déclaration de la fonction
        // si la fonction ne fait rien d'autre que de retourner une valeur (un getter) nous devons specifier que la fonction est view. 
    }

    function changeOwner(address _newOwner) public {
        owner = _newOwner;
        // fonction qui permettra de définir un nouvel owner au contrat en le modifiant.
    }
}
