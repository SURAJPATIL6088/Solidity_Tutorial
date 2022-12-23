// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Fixed_Size_Array
{
    // array declaration
    // <data-type> [n] <visibility> Array_name = [1, 2, ..., n];

    uint [5] public myArr = [10, 20, 30, 40, 50];

    // if we have to set new values to the array elements
    function Setter(uint Index, uint Value) public
    {
        myArr[Index] = Value;
    }

    // In-built function in the fixed size array

    // length function
    function len() public view returns(uint)
    {
        return myArr.length;
    }
    
}