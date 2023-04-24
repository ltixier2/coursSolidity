// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.1;
// utiliser une interface permet d'utiliser les fonctions d'un contrat que l'on va appeller. 
interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

contract Bank {
    address owner;
    mapping(address => bool) allowedErc20;
    address[] tokenAddresses;
    uint256 balance; // for eth
    event ValueReceived(address user, uint256 amount); // for eth

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
    }

   
    // Pour Eth la fonction deposit incremente la valeur de la balance pour l'adresse de l'utilisateur
    function deposit() public payable {
        balance += msg.value;
    }

    receive() external payable {
        emit ValueReceived(msg.sender, msg.value);
        balance += msg.value;
    }

    function getBalanceEther() public view returns (uint256) {
        return balance;
    }

    function withdraw() external onlyOwner {
        uint256 userBalance = balance;
        balance = 0;
        payable(msg.sender).transfer(userBalance);
    }

    function withdrawPartially(uint256 _amount) external onlyOwner {
        assert(balance >= _amount);
        balance -= _amount;
        payable(owner).transfer(_amount);
    }

    // section ERC20
    function getBalanceERC20(address _erc20Address)
        external
        view
        returns (uint256)
    {
        uint256 myBalance = IERC20(_erc20Address).balanceOf(address(this));
        return myBalance;
    }

    function transfertToken(
        address _myToken,
        address _dest,
        uint256 _amount
    ) external onlyOwner {
        IERC20 myToken = IERC20(_myToken);
        //myToken.approve(address(this),_amount);
        myToken.transfer(_dest, _amount);
    }

    function getTokenName(address _myToken)
        external
        view
        returns (string memory)
    {
        IERC20 myToken = IERC20(_myToken);
        return myToken.name();
    }

    function getTokenSymbol(address _myToken)
        external
        view
        returns (string memory)
    {
        IERC20 myToken = IERC20(_myToken);
        return myToken.symbol();
    }

    function addErc20Token(address _myToken) external {
        tokenAddresses.push(_myToken);
    }

    function listErc20Tokens() external view returns (address[] memory) {
        return tokenAddresses;
    }
}
