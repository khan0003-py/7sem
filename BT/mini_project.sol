// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Charity {
    address public owner;
    mapping(address => uint256) public donations;

    event Donation(address indexed donor, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than zero");
        donations[msg.sender] += msg.value;
        emit Donation(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= address(this).balance, "Insufficient balance");
        payable(owner).transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
