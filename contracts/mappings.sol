// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
// contract for mapping
contract themapping{
    mapping(uint => string) internal mymapping;
    function addvalues(uint _num, string memory _word) external {
        mymapping[_num] = _word;
    }
    function getvalues(uint _num) external view returns (string memory){
        return mymapping[_num];
    }
}

