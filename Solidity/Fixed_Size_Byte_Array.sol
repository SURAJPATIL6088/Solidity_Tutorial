// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Fixed_Size_Byte_Array
{
    /* Range --> bytes1 to bytes32 */
    bytes1 public p1;
    bytes5 public p5;

    function set() public
    {
        p1 = "a";
        p5 = "abcde";
    }
}
