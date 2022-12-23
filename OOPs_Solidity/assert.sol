// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Assert
{
    address public Owner = msg.sender;

    function CheckOwnerShip() public view
    {
        assert(Owner == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }
}