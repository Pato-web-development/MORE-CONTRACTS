//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
contract interfaceandimport{
    string public word = "oau";
    function changeword() public {
        word = "unilag";
    }
    function showword() public view returns(string memory){
        return word;
    }
}