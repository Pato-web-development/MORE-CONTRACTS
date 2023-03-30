// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
//we are writing a bytes array
contract bytesarray {
bytes32[] thebytesarray;
function ourbytesarray() public {
thebytesarray = [bytes32("14"), bytes32("food"), bytes32("10")];
}
function addtothearray() public view returns (bytes32[] memory){
    return thebytesarray;
}
}