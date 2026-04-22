// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

/*
public - Toutes les adresses et contrats peuvent lire
private - lisible uniquement depuis l'interrieur du contrat
internal- seulement visible depuis le contrat et les contrats dependants
external - seuls les contrats externes et adresses peuvent lire. (consomme moins de gas que public) 
l'ajout de view permet la visibilité du return. 

*/
// nom du contrat
contract FunctionVisibility {
    uint256 public publicVisible = 42;
    uint256 notVisible = 10;

    //fonction visible que dans le contrat
    function getInternalNotVisible() internal view returns (uint256) {
        return notVisible;
    }

    // function visible en externe qui appelle une function dans le contrat.
    function getViewExternalNotVisible() external view returns (uint256) {
        return notVisible;
    }

    //fonction qui modifie la variable qui n'est pas visible a l'exterieur du contrat.

    function setNotVisible(uint256 _notVisible) internal {
        notVisible = _notVisible;
    }

    // function qui s'appelle a l'exterieur du contrat qui appelle une fonction interne de modification au contrat.
    function setNotVisibleExternal(uint256 _notVisible) external {
        setNotVisible(_notVisible);
    }

    function getViewNotVisible() public view returns (uint256) {
        return notVisible;
    }

    // fonction pure (qui ne modifie rien en général des calculs uniquement visible dans le contrat.

    function getInternalView(uint256 _someValue)
        internal
        pure
        returns (uint256)
    {
        return _someValue + 2;
    }

    // fonction qui est appellable de l'exterieur qui recupere des valeures internes au contrat fonctions ou variables.

    function getInternalValue() external view returns (uint256) {
        uint256 myValue = getInternalView(200 + notVisible);
        return myValue;
    }
}
