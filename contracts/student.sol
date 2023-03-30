// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
//Build a contract  that stores students’ records (name, age, gender).

//Your contract should have a storage variable admin_address that stores/changes an admin address.
//It should have a constructor that takes in an address argument and initialises it as the admin.
//It should have an external function store_details that takes in name, age, and gender as arguments to be stored in the student_details storage variable.
//It should have a view function get_name that returns the student’s info.
//It should have a view function get_names that returns the students struct details.
//Allow for deletion of a particular student from the records


contract StudentDetails{
    struct Data{
        string name;
        uint Id;
        uint age;       
        string gender;
        bool status;
    }
    mapping (address => Data) public data;
    Data[] public lists;
    address[] _studentState;

    address Admin;
    uint ID;



    constructor(){
        Admin = msg.sender;

    }

    modifier onlyOwner(){
        require(msg.sender == Admin, "Not Admin");
        _;

    }


    function registerStudent(string calldata _name, address student, uint _age, string calldata _gender) external onlyOwner{
        ID++;
        Data storage _data = data[student];
        require(_data.status == false, "Student already exist");
        _data.name = _name;
        _data.age = _age;
        _data.gender = _gender;
        _data.Id = ID;
        _data.status = true;
        _studentState.push(student);

       


    }


    function getStudent(address student) public view returns(Data memory _data){
        _data = data[student];
    }

    



    function studentsDetails() external view returns(Data[] memory list){
        uint size = _studentState.length;
        address[] memory  studentMemory = new address[](size);
        list = new Data[](size);
        studentMemory = _studentState;
        for(uint i =0; i < size; i++){
            Data storage _data = data[studentMemory[i]];
            list[i] = _data;
            list[i] =  data[studentMemory[i]]; 
        }

    }


    function DeleteStudent(address student) external onlyOwner{
        Data storage _data = data[student];
        require(_data.status == true, "Not student");
        _data.name = "";
        _data.age = 0;
        _data.Id =  0;
        _data.gender = "";
        _data.status = false;
        uint size = _studentState.length;
        address[] memory  studentMemory = new address[](size);
        studentMemory = _studentState;

        for (uint i = 0; i < size; i++){
            if(student == studentMemory[i]){
                studentMemory[i] = studentMemory[size - 1];
                _studentState = studentMemory;
                break;

            }
        }
        _studentState.pop();

    }


    function changeAdmin(address _newAdmin) external onlyOwner{
        Admin = _newAdmin;


    }




}