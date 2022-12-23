// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Constractor
{
    // <mutability>
    // there are three types 
    // 1) Pure
    // 2) view
    // 3) payable

    // 1) Pure -> it don't has read only and modify permission in the contract
    function Add(uint a, uint b) public pure returns(uint)
    {
        uint addition = a + b;
        return addition;
    }

    // 2) view -> it has read only permission in the contract
    uint Num = 5;
    function Increment() public view returns(uint)
    {
        uint Ans = Num+1;
        return Ans;
    }

}