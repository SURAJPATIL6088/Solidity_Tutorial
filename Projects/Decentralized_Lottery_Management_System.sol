// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Lottery
{
    address public Manager;
    address payable[] public Participants;

    constructor()
    {
        Manager = msg.sender;
    }

    receive() external payable
    {
        require(msg.value == 2 ether, "You Transfer Less Amount !!");
        Participants.push(payable(msg.sender));
    }

    // to check the balance is permission valid for only Manager 
    function getBalance() public view returns(uint)
    {
        require(msg.sender == Manager, "Balance check Permission Only For Manager !!");
        return address(this).balance;
    }

    // how to select random participants
    function Random() public view returns(uint)
    {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, Participants.length)));
    }

    // select the winner
    function selectWinner() public
    {
        require(msg.sender == Manager, "You are Not a Manager !!");
        require(Participants.length >= 3, "Insufficient Amount of People Present in Lottery !!");

        // convert random function address into 
        uint r = Random();

        address payable Winner;
        
        uint Index = r % Participants.length;
        Winner = Participants[Index];
             
        // then the value should be transfer in the Winner Account
        Winner.transfer(getBalance());

        // then reset the Dynamic Size Array 
        Participants = new address payable[](0);
    }


}