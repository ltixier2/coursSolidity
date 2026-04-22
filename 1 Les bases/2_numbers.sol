// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Numbers {
    //definition d'un uint non signé (utilisé généralement quand on veut stocker des nombres.
    // la variable est publique donc directement accessible.
    // si la variable n'etait pas specifiquement déclarée publique nous aurions besoin d'une fonction pour l'afficher.

    uint256 public toto = 42;

    // fonction qui mettra à jours toto en prenant comme parametre _toto qui est aussi un uint (sinon erreur de cast)
    function updateToto(uint256 _toto) public {
        toto = _toto;
    }
}
