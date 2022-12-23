// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Payable
{
    address payable public Owner = payable(msg.sender);

    function getETH() payable public
    {

    }

    function CheckBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    // transfer ETH to another account
    function Transfer(address payable NewUser, uint _x) payable public
    {
        NewUser.transfer(_x);
    }
}