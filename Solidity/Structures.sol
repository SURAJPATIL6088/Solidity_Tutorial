// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

// create the structure
struct Student
{
    uint RollNo;
    string Name;
}

contract Structure
{
    // initialization of the structure
    Student public S1;

    // we are using the constructor for accessing the constructor
    constructor(uint roll, string memory stu_name)
    {
        S1.RollNo = roll;
        S1.Name = stu_name;
    }

    // updating the values of the student structure
    function Update(uint stu_roll1, string memory stu_name1) public
    {
        Student memory New_Student = Student({
            RollNo : stu_roll1,
            Name : stu_name1
        });

        S1 = New_Student;
    }
}
