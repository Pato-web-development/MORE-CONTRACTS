// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract newmapping{
    //at first create the mapping function
    mapping (uint => string) internal themapping;
    // write to the mapping function using a write function and parameters and variables
    function addvalues(uint _number, string memory _word) external {
        themapping[_number] = _word;
    }
    // write a view function to view the variables
    function getvalues(uint _number) external view returns (string memory){
        return themapping[_number];
    }
}