// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract String
{
    string public str = "Strings in Solidity";
    uint pid = 1202011;

    function PrintString() public view returns (string memory, uint)
    {
        string memory s = "Suraj Patil Here !!";
        uint Pid = pid;

        return (s, Pid);
    }
}