// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract faucet {
    address owner;
    uint256 public amountAvailable;
    uint256 timeBeforeRequestMore = 10 seconds;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint256) lastRequest;

    function deposit() public payable {
        require(msg.sender == owner);
        amountAvailable += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return amountAvailable;
    }

    function getMoney() public {
        require(
            lastRequest[msg.sender] + timeBeforeRequestMore < block.timestamp
        );
        payable(msg.sender).transfer(1 ether);
        amountAvailable -= 1 ether;
        lastRequest[msg.sender] = block.timestamp;
    }

    function whenCanIGetMoney() public view returns (uint256) {
        return lastRequest[msg.sender] + timeBeforeRequestMore;
    }

    function sendMoney(address _user) external {
        require(owner == msg.sender);
        payable(_user).transfer(1 ether);
        amountAvailable -= 1 ether;
    }
}
