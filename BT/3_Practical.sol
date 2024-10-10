// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {
    address public owner;
    uint256 private balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= balance, "Insufficient balance");
        payable(msg.sender).transfer(amount);
        balance -= amount;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
