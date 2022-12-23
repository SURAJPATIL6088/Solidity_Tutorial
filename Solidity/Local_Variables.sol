// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Local_Variable
{
    uint public pid = 1202011;  // state variable

    // Local variable are use in the functions only
    function Set_Local() public pure returns(uint)
    {
        // for string uses we have to use the memory keyword
        string memory Name = "Suraj Patil";
        uint age = 21;  // Local variables

        return age;
    }
}
