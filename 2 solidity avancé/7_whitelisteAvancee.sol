// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract WhitelistAvancee {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    uint256 public nombre = 42;

    //un struct est une structure de données. qui permet de saisir des données. chaque struct est appellé comme un type de variable exemple dans le mapping plus bas. 
    struct Whitelister {
        bool isRegistered;
        uint256 nbre;
    }


    mapping(address => Whitelister) whitelister;
    //ici un mapping du whitelister avec son addresse 
    event Authorized(address _address); // Event

    function authorize(address _address) public {
        //exercice seul l'owner peut autoriser le whitelister pour cela utiliser le contrat ownable de openzepplin. (droit a google ou chatgpt) 
        whitelister[_address].isRegistered = true;
        emit Authorized(_address); // Triggering event
    }
    // Ici qui veut venir tenter d'expliquer les fonctions restantes ? :) 
    function updateNombre(uint256 _nombre) public {
        //le require s'assure que la personne est enregistrée. 
        require(
            whitelister[msg.sender].isRegistered == true,
            "only the whitelisted user can modify"
        );

        //mise à jours du nombre 
        whitelister[msg.sender].nbre = _nombre;
        nombre = _nombre;
    }

    function getNombreWhitelisted(address _user) public view returns (uint256) {
        return whitelister[_user].nbre;
    }

    function updateWhiteListedNbreOnly(uint256 _nbre, address _user) public {
        require(msg.sender == owner, "not the owner");
        whitelister[_user].nbre = _nbre;
    }

    function getMyNumber() public view returns (uint256) {
        return whitelister[msg.sender].nbre;
    }
}
