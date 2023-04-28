// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleToken is ERC20 {
    mapping(address=>bool) minters; 
    uint public supplyAvailable; 
    address owner;
    
    
    modifier onlyMinters{
        require(minters[msg.sender] == true, 'not allowed to mint'); 
        _;
    }
    modifier onlyOwner{
        require(owner == msg.sender,'not the owner');
        _;
    }

    constructor(
        string memory name,
        string memory symbol,
        uint256 totalSupply_
    ) ERC20(name, symbol) {
        //_mint(msg.sender, totalSupply_);
        supplyAvailable = totalSupply_; 
        owner = msg.sender; 

    }

// exercice ajouter une fonction mint publique qui doit être uniquement accessible qu'a un certain nombre d'utilisateurs. 
// le totalSupply doit etre de 200 ethers 
// la fonction mint ne doit pas dépasser la totalsupply 

function allowMinter(address _minter) public onlyOwner {
    minters[_minter] = true; 
}

function mint(address _reciever, uint _amount) public onlyMinters {
    require(supplyAvailable >= _amount,'no more token available');
    supplyAvailable -= _amount; 
    _mint(_reciever, _amount);
}
}