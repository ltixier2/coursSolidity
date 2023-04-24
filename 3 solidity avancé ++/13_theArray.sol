// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Array {
    uint256[] arr; // taille variable
    uint256[5] arr2; //taille fixe 

    function populateArray(uint256 _nbreDeValeurs) public {
        for (uint256 i = 0; i < _nbreDeValeurs; i++) {
            uint256 nbr = i + 3 + i;
            arr.push(nbr);
        }
    }

    function viewArray() public view returns (uint256[] memory) {
        return arr;
    }

    function getArrayLength() public view returns (uint256) {
        return arr.length;
    }

    function popArray() public {
        arr.pop();
    }

    function deleteByIndex(uint256 _index) public {
        // il n'y a pas de fonction pour detruire un element par son index la solution est de déplacer le derniere element et de le copier a l'index de celui que l'on veut remplacer :
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function deleteIndex(uint256 _index) public {
        delete arr[_index];
        // cette fonction mettra a 0 la valeur de l'index mais ne supprimera pas le nombre d'entrées dans le tableau.
    }
}
