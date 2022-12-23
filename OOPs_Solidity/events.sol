// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Event {
    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    event Register(address indexed Orgnizer, string Name, string Company_Position);

    // empty event
    event AnotherEvent();

    function TestEvent() public
    {
        // Logs calling
        emit Register(msg.sender, "Bhushan Patil", "CTO");

        // empty event calling
        emit AnotherEvent();
    }
}