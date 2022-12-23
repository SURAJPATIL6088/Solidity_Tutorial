// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Dynamic_Size_Byte_Array
{
    bytes public p1 = "abc";

    function PushElement() public
    {
        p1.push("d");
    }

    function GetElement(uint i) public view returns(bytes1)
    {
        return p1[i];
    }

    function GetLength() public view returns(uint)
    {
        return p1.length;
    }
}