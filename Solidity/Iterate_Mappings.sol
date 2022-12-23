// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Iterate_Mapping
{
    // declaring the mapping
    mapping(address=>uint) public Balances;
    mapping(address=>bool) public Inserted;
    address[] public Keys;

    function Insert(address _key, uint _val) public
    {
        Balances[_key] = _val;

        if(!Inserted[_key])
        {
            Inserted[_key] = true;
            Keys.push(_key);
        }
    }

    function Get_Size()public view returns(uint)
    {
        return Keys.length;
    }

    function First_Element() public view returns(uint)
    {
        return Balances[Keys[0]];
    }

    function Last_Element() public view returns(uint)
    {
        return Balances[Keys[Keys.length - 1]];
    }

    function Get(uint _i) public view returns(uint)
    {
        return Balances[Keys[_i]];
    }
}