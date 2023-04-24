// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Whitelist {
    // un mapping est un lien clé valeur.
    // il permet donc de stocker dans notre cas si une adresse est a true ou false.

    mapping(address => bool) whitelist;

    event Authorized(address _address);

    // Event permet  de definir quels types de messages pourront etre envoyés aux dapps abonnées a nos messages.

    function authorize(address _address) public {
        whitelist[_address] = true;
        //changement de l'adresse de l'utilisateur dans le mapping a true
        emit Authorized(_address); // Triggering event
        // envoi du message comme qui l'adresse a été autorisée.
    }

    // exercice seul le owner peut ajouter dans la whitelist
}
