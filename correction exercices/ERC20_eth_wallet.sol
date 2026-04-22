// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract BankAccount {
    // le mapping permet d'ajuster la balance de l'utiisateur
    mapping(address => uint256) balance;
    address[] accounts; 
    address owner; 
    event ValueReceived(address user, uint256 amount);

        modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
        //un modifier doit toujours commencer par le test et se terminer par _; 
    }

    constructor() {
        owner = msg.sender;
    }
    // la fonction deposit incremente la valeur de la balance pour l'adresse de l'utilisateur
    function deposit() public payable {
        if (balance[msg.sender] ==0) {
        accounts.push(msg.sender);
            }
        balance[msg.sender] += msg.value;

    }

    receive() external payable {
        emit ValueReceived(msg.sender, msg.value);
        if (balance[msg.sender] ==0) {
        accounts.push(msg.sender);
        }
        balance[msg.sender] += msg.value;
    }

    // getBalance permet de connaitre la balance de l'utilisateur
    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }

    //fonction withdraw permetde retirer l'integralité
    // attention msg.sender n'est pas déclaré comme payable par defaut nous devons le déclarer comme payable comme indiqué.

    function withdraw() public {
        uint256 userBalance = balance[msg.sender];
        balance[msg.sender] = 0;
        payable(msg.sender).transfer(userBalance);
    }

    function withdrawPartially(uint256 _amount) public {
        uint256 userBalance = balance[msg.sender];
        assert(userBalance >= _amount);
        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function rescue() public onlyOwner{
        for(uint i =0; i<accounts.length; i++){
            uint256 userBalance  = balance[accounts[i]];
            balance[accounts[i]] = 0;
            payable(accounts[i]).transfer(userBalance);

        }
    }
}
// exercice : créer une fonction qui permet de retirer un certain montant et qui mets à jours la balance de l'utilisateur

// exercie 2 : à l'aide de vos connaissances modifier le contrat pour que l'administrateur banacaire puisse enclancher uen fonction rescue.
// la fonction rescue devra restituer l'integralité des fonds de tous les utilisteurs. Toutes les balances devront etre mises à 0.
