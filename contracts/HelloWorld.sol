// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10 <0.9.0;

contract Primitive{
  bool public b = true;
  //uint type cannnot take -ve value
  uint public u = 1;
  uint8 public u8 = 1;
  uint128 public u128 = 25;
  uint256 public u256 = 299;

  //int type can take a +value
  int public i = -1;
  int8 public i8 = 8;
  int128 public i128 = 25;
  int256 public i256 = 255;

  address public addr = 0x1234567890123456789012345678901234567890;

    //min and max of int

  int public minInt = type(int).min;
  int public maxInt = type(int).max;

  //bytes:shorthand of byte[]
  bytes1 a = 0xb5; //[10110101]
  
  //default values
  address public defaultAddr = 0x0000000000000000000000000000000000000000;
  int public defaultInt = 0;
  uint public defaultUint = 0;

  //mapping
  mapping(address => uint) public balances;
  mapping(address => mapping(address => uint)) public nestedBalances;


  //array
  uint8[2] public a8 = [1,2];

  //struct
  struct S{
    uint8 a;
    uint8 b;
  }
  S public s = S(1,2); //set value

  //event
  event E(address indexed a, uint indexed b);
  event E2(address indexed a, uint indexed b, uint indexed c);


  //modifier
  modifier mod1{
    if(msg.sender == 0x1234567890123456789012345678901234567890){
      _;
    }







  }

  





}