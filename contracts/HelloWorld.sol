// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10 <0.9.0;

contract Count{

  uint public count;

  //function to get the current count

  function get() public view returns (uint){

    return count;
  }

  //function to increment the count

  function inc() public{

    count ++;
  }
  //function to decrement the count

  function dec() public{

    count --;
  
  }
  
}