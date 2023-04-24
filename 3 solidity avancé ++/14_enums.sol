// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Enums {
    enum TransactionStatus {
        notStarted,
        approuved,
        validating,
        done
    }
    /*
        notStarted =>0
        approuved =>1
        mining=>2
        done =>3
    */

    // un enum est un type à part on ne peut agir  que sur son alias le type de variable sera le nom déclaré de l'enum. plus d'infos ici : https://solidity-by-example.org/enum/

    TransactionStatus transactionStatus;

    // Le type enum a une valeur en int et ne peut dépasser le nombre de la liste des enums défini !!

    function getStatus() public view returns (TransactionStatus) {
        return transactionStatus;
    }

    // comme dit plus haut le type de variable ne sera pas enum mais son nom déclaré.
    function setStatus(TransactionStatus _transactionStatus) public {
        transactionStatus = _transactionStatus;
    }
}

//exercice créer un contrat ou seul un membre d'une whitelist peut modifier le status. /!\ faire en sorte que l'on ne puisse mettre à jours le status de 1 en 1!
