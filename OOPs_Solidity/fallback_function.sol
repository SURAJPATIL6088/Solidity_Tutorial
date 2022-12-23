// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;


    /* Properties of Fallback

    1. They are unnamed functions.
    2. They cannot accept arguments.
    3. They cannot return anything.
    4. There can be only one fallback function in a smart contract.
    5. It is compulsory to mark it external.
    6. It should be marked as payable. If not, the contract will throw an exception if it receives ether without any data.
    7. It is limited to 2300 gas if invoked by other functions.
    
    */

contract Fallback_Receive
{
    event Check(string fun, address _sender, uint _val);

    // it can process DATA + ETHER
    fallback() external payable
    {
        emit Check("Fallback", msg.sender, msg.value);
    }

    // it can process only ETHER
    receive() external payable
    {
        emit Check("Receive", msg.sender, msg.value);
    }
    // after adding value in the Initial then we have to transact it then the updated values are shown

    // to check whether the balance get updated or not 
    // 1 ETH = 10^18 Wei will be transfered

    function checkBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}