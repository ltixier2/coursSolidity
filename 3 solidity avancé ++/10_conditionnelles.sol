// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

// nom du contrat
contract TestIt {
    uint256 valeur = 0;

    function getValeur() public view returns (uint256) {
        return valeur;
    }

    function setValeur(uint256 _valeur) public {
        valeur = _valeur;
    }

    function test() public view returns (uint256) {
        if (valeur < 5) {
            return 0;
        } else if (valeur < 10) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternaire() public view returns (uint256) {
        return valeur < 10 ? 1 : 2;
    }
}
