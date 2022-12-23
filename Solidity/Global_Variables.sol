// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract Global_Variable
{
    function Global_Var() external view returns(address, uint, uint, uint)
    {
        address sender = msg.sender;
        uint gasLimit = block.gaslimit;
        uint timestamp = block.timestamp;
        uint blockNumber = block.number;

        return (sender, gasLimit, timestamp, blockNumber);
    }
}