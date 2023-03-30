// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract ourarrays {
uint[4] public thearray = [5,6,7,8];
uint[5] array2 = [2];
function getourarray() public view returns (uint[4] memory){
    return thearray;
}
function secondarray() public{
    array2=[2,7,9,45,5];
}

}