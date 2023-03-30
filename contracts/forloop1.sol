// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract forloop{
    uint[] public myarray;
    uint public i;
function addtoarray() public {
    for (i = 0; i < 30; i++ ){myarray.push(i);}
}
function getvalue() public view returns (uint[] memory){
    return myarray;
}
}