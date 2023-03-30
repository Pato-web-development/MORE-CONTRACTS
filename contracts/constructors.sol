//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
contract testconstructor{

constructor(uint num){
 a = num;
}
uint public a = 5;
function viewcontract() public view returns (uint){
    return a + 56;
}

}