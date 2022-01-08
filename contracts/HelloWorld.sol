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