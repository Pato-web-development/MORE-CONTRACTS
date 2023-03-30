// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;
//Build a program that stores students’ records (name, age, gender).
//Your contract should have a storage variable admin_address that stores an admin address.
//It should have a constructor that takes in an address argument and initialises it as the admin.
//It should have an external function store_details that takes in name, age, and gender as arguments to be stored in the student_details storage variable.
//It should have a view function get_name that returns the student’s info.
//It should have a view function get_names that returns the students struct details.
//Allow for deletion of a particular student from the records


contract Record {

    struct STRecord {
        string name;
        uint32 age;
        string gender;
    }
    
    mapping(uint32 => STRecord) public STDRecord;

    address adminAddress;

    uint32 public noOfStudents = 0;

    constructor(address _adminAddress){
        adminAddress = _adminAddress;
    }

    function storeDetails(string calldata _name, uint32 _age, string calldata _gender) external onlyOwner{
        STRecord storage myRecord = STDRecord[noOfStudents];
        myRecord.name = _name;
        myRecord.age = _age;
        myRecord.gender = _gender;
        noOfStudents += 1;
    }

    function getName(uint32 _id) external view returns (STRecord memory) {
        return STDRecord[_id];
    }

    function getNames() external view returns (STRecord[] memory) {
        STRecord[] memory studentList = new STRecord[](noOfStudents);
        for (uint32 i = 0; i < noOfStudents; i++){
            studentList[i] = STDRecord[i];
        }
        return studentList;
    }

    function deleteStudent(uint32 _id) external onlyOwner{
        STRecord storage myRecord = STDRecord[_id];
        myRecord.name = STDRecord[noOfStudents - 1].name;
        myRecord.age = STDRecord[noOfStudents - 1].age;
        myRecord.gender = STDRecord[noOfStudents - 1].gender;

        STRecord storage myRecordL = STDRecord[noOfStudents-1];
        myRecordL.name = "";
        myRecordL.age = 0;
        myRecordL.gender = "";

        noOfStudents -= 1;
    }

    modifier onlyOwner() {
        require( msg.sender == adminAddress, "Only the Admin can access this");
        _;
    }
}