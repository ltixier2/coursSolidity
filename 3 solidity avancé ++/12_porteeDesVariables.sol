// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

/*
local
declared inside a function
not stored on the blockchain
state
declared outside a function
stored on the blockchain
global (provides information about the blockchain)
*/
// nom du contrat
contract VariablesVisibility {
    //variables d'etat  stockées dans la blockchain.
    uint256 public visible = 0;
    uint256 notVisible = 10;

    function getViewNotVisible() public view returns (uint256) {
        return notVisible;
    }

    function calcul(uint256 _number1, uint256 _number2)
        public
        pure
        returns (uint256)
    {
        //variables locales non stockées dans la blockchain
        return _number1 + _number2;
    }

    function storeData(uint256 _mynumber) public pure returns (uint256) {
        //varible locale non stockée dans la blockchain
        return _mynumber;
    }

    function getTimeStamp() public view returns (uint256) {
        //variables de la blockchain ne sont pas stockées dans la bc car doublons.
        uint256 timeStamp = block.timestamp;
        return timeStamp;
    }

    function getAddress() public view returns (address) {
        address myAddress = msg.sender;
        return myAddress;
    }
}
