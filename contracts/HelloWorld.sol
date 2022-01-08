// SPDX-License-Identifier: MIT
//compiler btwn 0.8.10 and 0.9.0
pragma solidity >=0.8.10 <0.9.0;

//to write or read state variable you need to send a transaction
//you can read state variable without sending a transaction
  contract SimpleStorage{
    //state variable to store a number
    uint public num;

    //function to send transaction to to write to a state variable
    function set(uint _num)public{
      num = _num;
    }

    //function to read from state variable without sending a transaction
    function get()public view returns (uint){
      return num;
    }
  }