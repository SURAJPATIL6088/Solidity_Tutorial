// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Modifier
{
    address public Owner;

    constructor()
    {
        Owner = msg.sender;
    }

    // function modifier
    modifier CheckOwner()
    {
        // Modifier to check that the caller is the owner of the contract.
        
        require(msg.sender == Owner, "Not Owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    function Me()public view CheckOwner returns(uint)
    {
        return 100;
    }
}
