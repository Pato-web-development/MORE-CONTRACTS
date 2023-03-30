// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./virtualandoverrideA.sol";
//state of contract B changes
//contract B is only making use of contract A and will apply the implementation here and add to the implementation.
//contract A contains the implementation and we change only the implementation from here
//we bring only the contract and functions here
contract B is A {
    function firstfunction(uint num) external override {
     mynumber = num + 6;
    }

}