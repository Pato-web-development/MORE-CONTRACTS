// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
// in delegate calls, we don't declare the variables inside the function in the contract B
// declaration inside the function happens in the contract A
contract A{
     string public car = "benz";
     string public estate;
    function thecarA (string memory _car) external {
    car = _car;
    estate = "3 Crown";
}
}