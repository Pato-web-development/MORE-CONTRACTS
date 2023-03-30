// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
//first way to do array in array
contract arrayinarray{
    string[][] public mainarray;
    string[] public array1 = ["pato", "daniel", "emma"];
string[] public array2 = ["she", "he", "they"];
function addtomainarray() public {
    mainarray.push(array1); mainarray.push(array2);
}
function viewarray() public view returns (string[][] memory){
    return mainarray;
}

}