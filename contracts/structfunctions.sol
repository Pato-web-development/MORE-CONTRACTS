// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract structfunctions{
    struct politics {
        string party;
        uint states;
        string leader;
    }
    politics public thepoliticsvariable = politics ("APC", 36, "Tinubu");
    //to write to a struct function, we use parameters and arguments
    function changeleader(string memory _leader) public {
        thepoliticsvariable.leader = _leader;
    }
    function showdetails() public view returns(politics memory){
        return thepoliticsvariable;
    }
    function showleader() public view returns(string memory){
        return thepoliticsvariable.leader;
    }
     function showparty() public view returns(string memory){
        return thepoliticsvariable.party;
    }
}