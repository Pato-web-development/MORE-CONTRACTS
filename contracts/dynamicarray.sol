// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract dynamicarray{
    string[] public stringarray = ["pato", "emma", "daniel"];
    function names() public view returns(string[] memory){
        return stringarray;
    }
    string[] schools;
    function theschools() public {
        schools = ["oau", "abuad", "uniben", "unilag", "aau"];
    }
    function viewtheschools() public view returns (string[] memory){
        return schools;
    }
    function replaceaschool() external {
        schools[3] = "unilorin";
    }

}