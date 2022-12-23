// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Boolean
{
    bool public Value = true;

    // if value is greater than the 100 return false;
    function Bool(uint N) public returns(uint, bool)
    {  
        if(N > 100)
        {
            Value = false;
        }
        else
        {
            Value = true;
        }

        return (N, Value);
    }
}