// SPDX-License-Identifier: MIT
//compiler 
pragma solidity >=0.8.10 <0.9.0;

contract Varibales{
  //state variables are savedto the blockchain

  string public text = "Hello World!";
  uint public num = 12345;

  function doSomething()public {
    //local variables are not saved to the blockchain
    uint i = 125;

    //some global saved to the blockchain
    
    uint timestamp = block.timestamp; //current block timestamp
    address sender = msg.sender;//current caller address

  }


  
}