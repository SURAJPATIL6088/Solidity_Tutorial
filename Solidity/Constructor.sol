// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Constructor
{
    address public Owner;
    uint public Num;

    // without parameter constructer 
    // Example 1
    /*
    constructor()
    {
        Num = 100;
    }
    */

    // with parameter constructer
    // Example 2
    // it prints the address of the owner
    constructor(uint new_Num) 
    {
        Owner = msg.sender;
        Num = new_Num;
    } 

}

/*  NOTE:
        1. Constructor executes only once
        2. no more than one constructor defined

*/