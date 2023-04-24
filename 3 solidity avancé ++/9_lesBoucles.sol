// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

// nom du contrat
contract Loop {
    uint256 nbrLoop = 15;

    function modifyLoop(uint256 _nbrLoop) public {
        nbrLoop = _nbrLoop;
    }

    function loopWithFor() public view returns (uint256) {
        uint256 myValue = 1;
        for (uint256 i = 1; nbrLoop > i; i++) {
            myValue = i;
        }
        return myValue + 1;

    }

    // d'autres exemples de boucles : 
    //https://www.tutorialspoint.com/solidity/solidity_loops.htm relativement standard par rapport aux autres langages. 
}
