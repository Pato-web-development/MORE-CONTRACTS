//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
//another code to test the constructor
contract theconstructor{
    constructor(){
        num = 10;
    }
    uint public num = 5;
    function viewcode() public view returns (uint){
        return 44 + num;
    }
}