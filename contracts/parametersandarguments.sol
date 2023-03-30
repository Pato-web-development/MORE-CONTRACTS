// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
//we are writing parameters and arguments
contract theparameters {
    string public sport= "football";
    function ourparameters(string memory _sport) public {
   sport = _sport;
    }
    function viewparametersandarguments() public view returns (string memory) {
        return sport;
    }
}
