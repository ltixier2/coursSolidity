// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract BankAccount2 {
    mapping(address => uint256) balance;
    event ValueReceived(address user, uint256 amount);

    function deposit() public payable {
        emit ValueReceived(msg.sender, msg.value);
        balance[msg.sender] += msg.value;
    }

    receive() external payable {
        emit ValueReceived(msg.sender, msg.value);
        balance[msg.sender] += msg.value;
    }

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

    //fonction qui permet de retirer une partie des fonds
    //l'instruction assert permet de verifier que le montant ne dépasse pas la balance de l'utiliseur
    function withdrawPartially(uint256 _amount) public {
        assert(balance[msg.sender] >= _amount);
        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}
