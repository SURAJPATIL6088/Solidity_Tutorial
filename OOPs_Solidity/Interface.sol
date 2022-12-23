// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

interface InterFace_Example
{
    // we are passing the function, when is defined as external in the interfeces
    function InterFace(string memory str) external;
}

contract Parent is InterFace_Example
{
    function InterFace(string memory str) public override
    {
        //return "Interface in Solidity !!";
    }
}