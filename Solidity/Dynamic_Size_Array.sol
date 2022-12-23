// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract Dynamic_Size_Array
{
    // push function
    uint [] public NewArr;
    function Push_Element(uint Val) public
    {
        NewArr.push(Val);   // Inserting in the array
    }

    // pop function 
    function Pop_Element() public
    {
        NewArr.pop();   // Removing in the array
    }
    
    // get the length of the array
    function Length() public view returns(uint)
    {
        return NewArr.length;
    }
    
}