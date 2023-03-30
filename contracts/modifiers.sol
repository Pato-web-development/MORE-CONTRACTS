//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
contract modifiercontract {
    
    modifier modifyfunction(uint x) {
        require (x == 25, "not the expected value");
        _;
    } 
uint a = 6;
function givevalues(uint x) public modifyfunction(x) {
    a = x + 8;
}
function viewcode() public view returns (uint){
    return a;
}
}