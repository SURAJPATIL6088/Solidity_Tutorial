// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Revert
{
    address public Owner = msg.sender;
    uint public Age = 25;

    
    // special type of function
    error throwError(string, address);
    // this error method takes the minimum amount of gas
    
    function CheckRevert(uint x) public
    {
        Age = Age - 5;

        if(x < 20)
        {
            revert throwError("x is Under 20 !!", msg.sender);
        }
    }
}