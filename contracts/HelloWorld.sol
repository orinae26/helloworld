// SPDX-License-Identifier: MIT
//compiler btwn 0.8.10 and 0.9.0
pragma solidity >=0.8.10 <0.9.0;
// gas for transaction = gas price* gas spent
//gas spent: total amount of gas spent in transaction
//gas price: price of gas per unit of gas 

contract Gas{
  uint public i = 0;

  //using up all gas in a transaction causes the transaction to fail
  //state changes are not reverted
  //gas is not refunded
  function forever () public {
    while(true) {
      i++;
    }
  }  
}

contract ifElse {
  function foo(uint x) public pure returns (uint){
    if (x<10){
      return 0;
    }
    else if(x<20){
      return 1;
    }
    else {
      return 2;
    }
  }
  //ternary operator
  function ternary(uint _x)public pure returns(uint){
    return _x<10 ? 0 : _x<20 ? 1 : 2;
  }
}
//for loop and while loop
contract Loop{
  function loop() public pure {
    //for loop

    for(uint i = 0; i<10; i++){

      if(i==3){
        //skip to next iteration with continue
        continue;
      }
      if(i==5){
        //exit loop with break
        break;
      }
    }
    //while loop
    uint j;
    while(j<10){
      j++;
    }
  }
}

//mapping syntax : mapping(keytyype => valuetype) identifier
//keytype are such as address, uint, bytes32, string, etc
//valuetype are any type: uint, address,maps, arrays
//maps are used to store key-value pairs
//maps are not iterable


contract Mapping{
  //mapping 
  mapping (address => uint ) public myMap;

  function get(address _addr) public view returns(uint){

    //mapping always returns a values 
    // if value was not set it returns the default value
    return myMap[_addr];
  }
// update value at key
  function set (address _addr1, uint _i) public {
    myMap[_addr1] = _i;

  }

  //reset value to default

  function reset(address _addr) public{
    delete myMap[_addr];
  }
}

contract Nested {
  mapping(address => mapping(uint => bool)) public nested;

  function get(address _addr1, uint _i) public view returns(bool){
    return nested[_addr1][_i];
  }

  function set(address _addr1, uint _i, bool _boo) public {
    nested [_addr1][_i] = _boo;

  }

  function remove(address _addr1, uint _i) public{
    delete nested [_addr1][_i];
  }
  
}