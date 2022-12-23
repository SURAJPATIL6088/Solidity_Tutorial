// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Loop
{
    // there are three types of loops availabe in the solidity
    /*
    1. For loop
    2. While loop
    3. Do - While loop
    */

    uint[5] myArr= [1, 2, 3, 4, 5];
    uint public Sum = 0;

    // for the use of the loop we have to use in the inside in the functions
    function While_Loop() public
    {
        uint i = 0;
        while(i < myArr.length)
        {
            Sum = Sum + myArr[i];
            i++;
        }
    } 

    function For_Loop() public
    {
        for(uint i = 0; i<myArr.length; i++)
        {
            Sum = Sum + myArr[i];
        }
    } 

    function Do_While_Loop() public
    {
        uint i = 0;
        do
        {
            Sum = Sum + myArr[i];
            i++;
        }while(i < myArr.length);
    }

}