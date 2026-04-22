// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract Structures {
    struct User {
        string name;
        uint8 age;
    }

    //definition d'un tableau de structs
    User[] public users;

    //on ajoute un utilisateur dans le tableau de structs.

    function addUser(string memory _name, uint8 _age) public {
        User memory user;
        user.name = _name;
        user.age = _age;

        users.push(user);
    }

    // lecture du structs par l'index du tableau

    function showUsers(uint256 _index)
        public
        view
        returns (string memory, uint8)
    {
        User storage user = users[_index];
        return (user.name, user.age);
    }

    // get length pour avoir le nombre d'entrées.
    function getLength() public view returns (uint256) {
        return users.length;
    }
}
