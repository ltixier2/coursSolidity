// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    address public minter; 
    constructor() ERC20("MyToken", "MTK") {

        minter = msg.sender; 
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        
    }

    function setMinter(address _minter) public onlyOwner {
        minter = _minter;
    }

    function mintFromMinter(address _to, uint _amount) public payable {
        require(msg.sender == minter); 
        _mint(_to, _amount);
    }

    
}