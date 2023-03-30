// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;
//Description:
//The Ethereum Naming System maps a domain name to an ethereum address. It's a safe way of share an ethereum address in a human readable way without committing error.

//Instruction
//Read up the ENS doc
//The ENS registers a name to an address
//It looks up the registered names and returns the mapped address
//It has function that reassign an address name
//for every function implementation, an event should be emitted
//No two addresses can claim the same name
//Only the owner can reassign a new address to a name
//Extend the ENS contract you wrote to have the following
//A list of all the names registered on your platform
//Delete name from the record and update the length
/// @title ENS: Ethereum Naming System
/// @author Musa AbdulKareem (@WiseMrMusa)

contract Registry {
    /// @notice This data type holds the owner of a domain name and the mapped address
    struct ENS {
        address owner;
        address mAddress;
        string domain;
    }

    /// @notice This maps a node to the ENSRecord
    /// @dev The node is the keccak256 hash of the domain name
    mapping(bytes32 => ENS) public ENSRecord;

    bytes32[] public domainNames;
    uint32 public noOfDomains = 0;



    /// @notice This function maps a domain name to an address
    /// @param _domain this is the domain name
    /// @param _mAddress this is the address mapped to the domain name
    /// @dev the default owner is the person running the smart contract
    function addEthName(string calldata _domain, address _mAddress) public {
        ENS storage ethName = ENSRecord[node(_domain)];
        require(ethName.mAddress == address(0), "Domain is already assigned");
        ethName.owner = msg.sender;
        ethName.mAddress = _mAddress;
        ethName.domain = _domain;
        domainNames.push(node(_domain));
        noOfDomains += 1;
        emit Log(_domain,_mAddress, "ENS Address is succesfully added");
    }

    /// @notice This function transfer ownership from the current owner to another address
    /// @param _domain this is the domain name
    /// @param _newOwner this is the address of the new owner of the domain
    /// @dev Only the owner can transfer ownership
    function transferOwnership(string calldata _domain, address _newOwner) public onlyOwner(_domain){
        ENS storage ethName = ENSRecord[node(_domain)];
        ethName.owner = _newOwner; 
        emit Log(_domain, _newOwner, "Ownership successfully transfered");
    }

    /// @notice This function transfer ownership from the current owner to another address
    /// @param _domain this is the domain name
    /// @param _newAddress this is the new address the domain name is mapped to
    /// @dev Only the owner can change the mapped address
    function changeAddress(string calldata _domain, address _newAddress) public onlyOwner(_domain){
        ENS storage ethName = ENSRecord[node(_domain)];
        ethName.mAddress = _newAddress;
        emit Log(_domain, _newAddress, "ENS Address changed");
    }

    /// @notice This function queries the address assigned to a domain name
    /// @param _domain this is the domain name 
    /// @return mAddress It returns the mapped address
    function getAddress(string calldata _domain) public view returns (address) {
        return ENSRecord[node(_domain)].mAddress;
    }

    function getDomainNames() public view returns (string[] memory) {
        string[] memory domainList = new string[](noOfDomains);
        for (uint32 i = 0; i < noOfDomains; i++){
            ENS storage ethName = ENSRecord[domainNames[i]];
            domainList[i] = ethName.domain;
        }
        return domainList;
    }

    function deleteDomainName(string calldata _domain) public onlyOwner(_domain){
        bytes32 dNode = node(_domain);
        for (uint32 i = 0; i < noOfDomains; i++){
            if (dNode == domainNames[i]) {
                domainNames[i] = domainNames[noOfDomains-1];
                domainNames.pop();
                break;
            }
        }

        ENS storage ethName = ENSRecord[dNode];
        ethName.owner = address(0);
        ethName.mAddress = address(0);
        ethName.domain = "";

        noOfDomains -= 1;
    }


    /// @notice This restricts the access to a function to only owners
    /// @param _domain The domain name
    modifier onlyOwner(string calldata _domain){
        require(msg.sender == ENSRecord[node(_domain)].owner, "You are not authorized for this action");
        _;
    }

    /// @notice This function hashes the domain name
    /// @param _domain This is the domain name
    /// @return node The keccack256 hash of the domain name
    function node(string calldata _domain) public pure returns (bytes32) {
    return keccak256(bytes(_domain));
    }

    /// @notice The function emits after every function is executed
    event Log(string _domain, address indexed _mAddress, string message);
}