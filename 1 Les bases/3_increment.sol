// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Increment {
    uint256 public toto = 42;

    function incToto() public {
        toto += 1;
    }

    function decToto() public {
        toto -= 1;
    }
}
