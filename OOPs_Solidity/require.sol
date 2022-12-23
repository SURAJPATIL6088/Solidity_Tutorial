// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Require
{
    address Owner;

    // We are creating the Mapping for the Adding & Trasfer Amount in Account
    mapping(address=>uint)Balance;

    // constructor for the address of the Owner
    constructor()
    {
        Owner = msg.sender;
    }

    // function for adding the Ethereum in Account
    function addBalance(uint amount) public returns(uint)
    {
        // first we have to check the is it Owners Account or Not
        require(msg.sender == Owner, "Yes it is Owner Account !!");
        Balance[msg.sender] = Balance[msg.sender] + amount;

        return Balance[msg.sender];
    }

    // function for Get the Balance from an Account
    function getBalance() public view returns(uint)
    {
        return Balance[msg.sender];
    }
}