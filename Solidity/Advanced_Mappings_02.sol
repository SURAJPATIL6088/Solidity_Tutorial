// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

// Mapping using the struct

// define the struct
struct Donor
{
    string Name;
    uint Age;
    string Address;
    uint Amount;
}

contract Advanced_Mapping
{
    // declaring the mapping and connceting with the struct
    mapping(address => Donor) public Acc_Info;

    function Insert(string memory _name, uint _age, string memory _add, uint _amt) public
    {
        //                                         ...| this we are adding the previous value and new value of donation |                           
        Acc_Info[msg.sender] = Donor(_name, _age, _add, Acc_Info[msg.sender].Amount + _amt);
    }

    // deleting the info
    function Delete() public
    {
        delete Acc_Info[msg.sender];
    }
}