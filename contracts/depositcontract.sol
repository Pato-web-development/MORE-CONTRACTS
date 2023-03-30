// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
//Write a contract that deposit fund into a contract.
//And also keep track of funds transferred into the contract.
//Add a function to the balance of address that have deposited into the contract.
//Submit Github gist
/// @title Contract Depositor
contract Deposit {
    
    mapping(address => uint256) Balance;

    function DepositFund() external payable {
        Balance[msg.sender] += msg.value;
    }

    function getBalance() external view returns (uint256) {
        return Balance[msg.sender];
    }

    receive() external payable{}
    fallback() external payable{}
}