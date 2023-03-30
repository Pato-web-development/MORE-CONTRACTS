//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
//assignment by Mr Kelvin
//Write a contract that allows deposit of funds into the contract.
//And also keep track of funds transferred into the contract.
//Add a function to the balance of the address that has deposited into the contract.
contract deposit{
    // this function allows funds to be deposited into the contract
    function receiveether() external payable{}
    // this view function keeps track of funds transferred into the contract
    function showbalance() external view returns (uint){
        return address(this).balance;
    }
    // this view function returns the ether balance of the sender
    function showsenderbalance() external view returns (uint){
        return msg.sender.balance;
    }
    //In addition, we can add a mapping and function to show the number of ether in the address of the sender
   // mapping (address => uint) balance;
   // function senderbalance() external view returns (uint){
    //    return balance[msg.sender];
   // } 
}