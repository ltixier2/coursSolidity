// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract SecureOwner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function changeOwner(address _newOwner) public {
        // un require permet de forcer l'usage de quelque chose dans notre cas l'adresse qui communique avec le contrat doit etre le owner.
        // le format : require(quelque chose test quelque chose , le message si la condition n'est pas verifiée.
        // dans tous les autres cas l'execution continue.

        require(msg.sender == owner, "not the owner");
        owner = _newOwner;
    }
}
