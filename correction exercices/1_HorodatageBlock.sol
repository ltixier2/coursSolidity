// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
 
contract Time {

	uint public monbLock = block.timestamp; 
	function getTime() public view returns(uint){
		return block.timestamp;
	}



}