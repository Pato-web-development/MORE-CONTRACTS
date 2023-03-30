// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
//state of contract B changes
//contract B is only making use of contract A and will apply the implementation here and add to the implementation.
//contract A contains the implementation and we change it from here
contract A {
   uint public mynumber = 5;
    function firstfunction(uint num) external virtual {
     mynumber = num;
    }

}