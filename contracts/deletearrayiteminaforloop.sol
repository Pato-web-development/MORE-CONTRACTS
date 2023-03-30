// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract forloop2{
    //deleting items from an array in a for loop
    uint[] public myarray;
    uint public i;

    function addtoarray() public {
        for (i=0; i < 10; i++){myarray.push(i);}
    }
    function removevalue() public {
        delete myarray[5];
    }
    function getarray() public view returns (uint[] memory){
        return myarray;
    }
}