// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint256) public balances;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0.");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than 0.");
        require(amount <= balances[msg.sender], "Insufficient balance.");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function transfer(address recipient, uint256 amount) public {
        require(amount > 0, "Transfer amount must be greater than 0.");
        require(amount <= balances[msg.sender], "Insufficient balance.");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }

    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }
}