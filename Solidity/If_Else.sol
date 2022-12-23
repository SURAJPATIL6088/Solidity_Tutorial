// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract IF_ELSE
{
    // Simple if  else statement
    /*
    function Check(int N) public pure returns(string memory)
    {
        string memory str;

        if(N < 0)
        {
            str = "Value is Lesser than 0 !!";
        }
        else if(N == 0)
        {
            str = "Value is Equal to 0 !!";
        }
        else
        {
            str = "Value is Greater than the 0 !!";
        }

        return str;
    }
    */

    // WAP for checking the Number is Even Or Odd
    function EvenOdd(uint N) public pure returns(uint, string memory)
    {
        string memory S;

        if(N % 2 == 0)
        {
            S = "Number is Even !!";
        }
        else
        {
            S = "Number is Odd !!";
        }

        return (N, S);
    }
}