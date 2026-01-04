// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingsBank {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "Must send some ETH");
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw(uint _amount) public onlyOwner {
        require(_amount <= address(this).balance, "Insufficient contract balance");
        (bool success, ) = payable(owner).call{value: _amount}("");
        require(success, "ETH transfer failed");
    }
}
