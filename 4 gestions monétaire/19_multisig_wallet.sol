// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract MultisigWallet {
    struct txs {
        uint8 txId;
        uint8 nbValidators;
        uint256 amount;
        bool executed;
    }

    uint256 balance;
    mapping(address => uint256) deposited;

    event ValueReceived(address user, uint256 amount);

    //mapping pour definir qui peut signer les transactions
    mapping(address => bool) signers;

    //nombre minimal de validation pour signer une transaction
    uint256 minValidators = 3;

    address vendor;
    address walletOwner;
    uint256 amount;
    address owner;

    constructor() {
        owner = msg.sender;
        vendor = msg.sender;
    }

    function setOwner(address _owner) external {
        assert(vendor == msg.sender);
        owner = _owner;
    }

    function setVendor(address _vendor) external {
        assert(owner == msg.sender);
        vendor = _vendor;
    }

    function getOwner() external view returns (address) {
        return owner;
    }

    function getVendor() external view returns (address) {
        return vendor;
    }

    function getDepositedByAddress(address _depositor)
        external
        view
        returns (uint256)
    {
        return deposited[_depositor];
    }

    function updateMinValidators(uint8 _minVal) external {
        assert(vendor == msg.sender);
        minValidators = _minVal;
    }

    function deposit() public payable {
        emit ValueReceived(msg.sender, msg.value);
        deposited[msg.sender] += msg.value;
        balance += msg.value;
    }

    receive() external payable {
        emit ValueReceived(msg.sender, msg.value);
        deposited[msg.sender] += msg.value;
        balance += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    //fonction withdraw permetde retirer l'integralité
    // attention msg.sender n'est pas déclaré comme payable par defaut nous devons le déclarer comme payable comme indiqué.

    function withdraw() public {
        uint256 userBalance = balance;
        balance = 0;
        payable(owner).transfer(userBalance);
    }

    //fonction qui permet de retirer une partie des fonds
    //l'instruction assert permet de verifier que le montant ne dépasse pas la balance de l'utiliseur
    function withdrawPartially(uint256 _amount) public {
        assert(balance >= _amount);
        balance -= _amount;
        payable(owner).transfer(_amount);
    }
}
