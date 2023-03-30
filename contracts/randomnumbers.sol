//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
contract randomnumbers{
    uint public myrandomnum = 5;
    function makerandomnum() public {
myrandomnum = uint(keccak256(abi.encodePacked(msg.sender, block.timestamp, myrandomnum))) % 100;
    }
    function viewrandomnum() public view returns (uint){
        return myrandomnum;
    }
}
