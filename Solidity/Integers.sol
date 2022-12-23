// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract Interger
{
    // TypeError: Type int_const 128 is not implicitly convertible to expected type int8. Literal is too large to fit in int8.
    // --> Integers.sol:6:23:

    // it gives the above error
    //  int8 public Num = 128;
    int8 public Num = 127;
    uint8 public N = 255;

    int public Number1 = 1502001;
    uint public Number = 1202011;
}