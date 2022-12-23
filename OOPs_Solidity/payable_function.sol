// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Payable
{
    address public Owner = msg.sender;

    function getETH() payable public 
    {

    }

    // to check the balance of 
    function CheckBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}