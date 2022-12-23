// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;


contract state_Variable
{
    // declaration methods
    // 1) 
    uint public age = 21;
    

    // 2) Using constructor
    uint public Number;
    constructor()
    {
        Number = 6088;
    }

    // 3) Using Functions
    uint public pid;
    function set() public
    {
        pid = 1202011;
    }

}
