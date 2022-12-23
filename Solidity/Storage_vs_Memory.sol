// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Storage_vs_Memory
{
    string[] public student = ["Suraj", "Aman", "Mir", "varad", "Atharva"];

    // Memory
    // it store in the temporary memory
    // it uses the local variable
    function Memory() public view
    {
        string[] memory s1 = student;
        s1[0] = "Me";
    }

    // Storage
    // it store in the contract or blockchain
    // it uses state variable
    function Storage() public 
    {
        string[] storage st1 = student;
        st1[0] = "Me";
    }

}