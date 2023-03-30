// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
// in delegate calls, we don't declare the variables inside the function in the contract B
// declaration inside the function happens in the contract A
//the contract B is using the logic of contract A to work with
//contract B {
 //   string public car;
  //  string public estate;
  //  function thecarB (address contractAaddress, string memory _car) external {
   //  (bool success, bytes memory data) = contractAaddress.delegatecall(abi.encodeWithSignature("thecarA(string)", _car));
   //   require (success, "transaction failed");
   // }
//}
