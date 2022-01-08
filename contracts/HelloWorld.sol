// SPDX-License-Identifier: MIT
//compiler btwn 0.8.10 and 0.9.0
pragma solidity >=0.8.10 <0.9.0;
  contract Immutable{

    //coding convention to uppercase constant variables

    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT ;


    constructor (uint _myUint){
      MY_UINT = _myUint;
      MY_ADDRESS = msg.sender;

    }

  }
