// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
contract mappings{
mapping (string => int) public mymapping;
function addvalue(string memory _words, int _anynumber) public {
    mymapping[_words] = _anynumber;
}
function getvalues(string memory _words) public view returns (int){
    return mymapping[_words];
}
}