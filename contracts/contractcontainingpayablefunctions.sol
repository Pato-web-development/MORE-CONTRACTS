//SPDX-License-Identifier: see license in license
pragma solidity ^0.8.1;
contract payablesummary{
    //these enable the contract to be able to receive ether
    constructor() payable {}
    fallback() external payable {}
    receive() external payable {}
    function receiveether() external payable {
    }
    //this shows the balance of your contract
function showbalance() external view returns (uint){
    return address(this).balance;
}

// to make the contract send out ether
function wesendether(address payable sendether) external payable {
    (bool success,) = sendether.call{value:msg.value}("");
    require (success, "the transaction has failed");
}
}