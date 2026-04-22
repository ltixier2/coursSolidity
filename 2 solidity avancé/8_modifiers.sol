// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Modifiers {
    bool public unlocked;
    address public owner;
    uint256 public nbre;

    constructor() {
        unlocked = false;
        owner = msg.sender;
    }

    //un modifier permet de definir un require ou un test if utilisable dans les fonctions plus bas.

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
        //un modifier doit toujours commencer par le test et se terminer par _; 
    }
    modifier isUnlock() {
        require(unlocked == true, "the contract is locked");
        _;
    }

    function lockUnlock() public onlyOwner {
        unlocked = !unlocked;
    }

    // dans notre cas seul l'owner peut modifier le nombre que dans le cas ou le contrat est débloqué.
    //Le modifier s'ajoute a la definition de la fonction comme suit :  
    
    function updateNbre(uint256 _nbre) public onlyOwner isUnlock {
        nbre = _nbre;
    }
}
