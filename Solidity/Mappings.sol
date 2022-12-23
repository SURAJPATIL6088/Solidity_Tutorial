// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Mapping
{
    // single mapping
    // declaring the mapping
    mapping(uint=>string) public Student;

    // nested mapping
    // mapping(address => mapping(uint=>string)) public Student;

    function Input(uint rollNo, string memory Name) public
    {
        // Inserting the value in the map
        Student[rollNo] = Name;
    }

    function Update(uint rollNo, string memory Name) public
    {
        Student[rollNo] = Name;
    }

    function Delete(uint rollNo) public
    {
        delete Student[rollNo];
    }
}