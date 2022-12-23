// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Parent
{
    function Parent_() public pure returns(string memory)
    {
        return "Parent Contract";
    }

    function fun1() public pure virtual returns(string memory)
    {
        return "This Function from the Parent Class !!";
    }

    function fun2() public pure virtual returns(string memory)
    {
        return "This Another Function from the Parent Class !!";
    }
}

contract Child is Parent
{
    function Child_() public pure returns(string memory)
    {
        return "Child Contract !!";
    }

    function fun1() public pure override returns(string memory)
    {
        return "This Function from the Child Class !!";
    }

    // this can be again modified
    function fun2() public pure virtual override returns(string memory)
    {
        return "This Another Function from the Child Class !!";
    }
}

contract NewChild is Child
{
    function New_Child() public pure returns(string memory)
    {
        return "New Child Contract !!";
    }

    function fun2() public pure override returns(string memory)
    {
        return "This Another Function from the NewChild Class !!";
    }
}
