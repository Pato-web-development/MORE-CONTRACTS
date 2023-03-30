// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract thestruct{
    struct school{
        string name;
        uint age;
        string location;
    }
    school public thevariable = school("OAU", 50, "Ife");
    function viewstruct() public view returns (school memory){
    return thevariable;
    }
}