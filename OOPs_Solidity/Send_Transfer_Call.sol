// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract SEND_TRANSFER_CALL
{
    event Log(uint value);
    
    receive() payable external
    {

    }

    function checkBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    // send
    function SEND(address payable Getter) public payable
    {
        emit Log(msg.value);

        bool Send = Getter.send(msg.value);
        require(Send, "Transaction is Failed !!");
    }

    // transfer
    function TRANSFER(address payable Getter) public payable
    {
        emit Log(msg.value);
        Getter.transfer(msg.value);
    } 

    // call 
    // getter function.call{key_value: no_of_wei, gas:Limit of gas 
    function CALL(address payable Getter) public payable
    {
        emit Log(msg.value);
        (bool Send, bytes memory data) = Getter.call{value:msg.value}("hi i am suraj");

        require(Send, "Transaction is Failed !!");
    }
}