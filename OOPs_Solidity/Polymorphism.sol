// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Polymorphism_
{
    function Sum(uint a, uint b) public pure returns(uint)
    {
        return a+b;
    }

    function Sum(uint a, uint b, uint c) public pure returns(uint)
    {
        return a+b+c; 
    }

    function Sum(string memory a, string memory b) public pure returns(string memory)
    {
        b = "Hello";
        return a;
    }

}