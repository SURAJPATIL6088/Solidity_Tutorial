// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Functions
{
    uint public N = 10;  // stete variable

    //function
    function Increment() public
    {
        N = N + 1;
    }

    function Setter(uint newN)public
    {
        N = newN;
    }

// make a add function whose add the two integers and return the addition
    function Add(uint x1, uint y1) public pure returns(uint)
    {
        return (x1+y1);
    }

// make a sub function whose subtract the two integers and return the subtraction result;
    function Sub(uint a, uint b) public pure returns(uint)
    {
        return (a-b);
    }
}