// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract nombre {

    uint public nbre1 = 1; 
    uint public nbre2 = 2;
    uint public nbr3 = 3; 
    address owner; 
    address permNbr1; 
    address permNbr2; 
    address permNbr3; 

    constructor() {
        owner = msg.sender; 
    }

    function changeNbr1(uint _nbr1) public {

        require(msg.sender == permNbr1, 'not allowed');
        nbre1 = _nbr1;  
    }

    function changeOwnerNbr1(address _newOnwer) public {
        require(owner == msg.sender,'not the owner');
        permNbr1 = _newOnwer; 


    }
}