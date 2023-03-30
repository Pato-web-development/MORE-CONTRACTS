//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
//create the interface and write the functions from the other contract down
interface Iinterfaceandimport{
 function word() external view returns (string memory);
 function changeword() external;
 function showword() external view returns (string memory);
}
// create contract with functions to call the functions in the other contract
contract interfaceandimport3 {
    function callfunction1(address othercontractaddress) external view returns (string memory){
     return Iinterfaceandimport(othercontractaddress).word();
    }
    function callfunction2(address othercontractaddress) external{
     Iinterfaceandimport(othercontractaddress).changeword();
    }
    function callfunction3(address othercontractaddress) external view returns (string memory){
     return Iinterfaceandimport(othercontractaddress).showword();
    }
}