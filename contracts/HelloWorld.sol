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

//Arrays 

contract Arrays{
  uint[] public arr;
  uint[] public arr2;
  uint[] public arr3 = [1,2,3];
  //fixed size arrays
  uint[10] public myFizedSizedArray;

  //function to return element i of array arr

  function get (uint i) public view returns (uint){
    return arr[i];
  }

  //function to return an entire array arr
  function getArr() public view returns (uint[] memory){
    return arr;
  }
  //function add element i to the end of array arr

  function push(uint _i) public{
    arr.push(_i);
  }

  //function to remove last element from array arr
  function pop() public view{
    arr.pop;
  }

  //function to delete element i from array arr
  
  function remove(uint index) public{
    delete arr[index];
  }

  //function to get the length of array arr
  function getLength() public view returns (uint){
    return arr.length;

  }
  // function create an array in memory
  function createNewArray() public{
    arr = new uint[](10);//create array of 10 elements
  }

}


//Enum help model a set of named constants called statuses
//can be declared outside a contract

contract Enum{
  //declare shipping statuses
  enum Status{
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Cancelled,
    Delivered
  }
  //Status
  Status public status;

  //return default status
  function getStatus() public view returns (Status){
    return status;
  }

  //set status to Pending
  function statusPending() public{
    status = Status.Pending;
  }

  //set status to Accepted
  function statusAccepted() public{
    status = Status.Accepted;
  }

  //set status to default
  function statusDefault()public{
    delete status;
  }

  //update status by passing uint into input
  function set(Status _status) public{
    status = _status;
  }

}

//Structs allow us to customise the data types of variables
//
contract Struct{
  //declare struct
  struct Todo{
    string text;
    bool completed;
  }

  //array of  Todo structs
  Todo [] public todos;

  //initialise array of Todo structs
  function create(string memory _text) public {
    
    //initialise empty struct
    Todo memory todo ;
    todo.text = _text;

    //key value mapping
    todos.push(Todo({text:_text, completed:false}));
    
    //calling it like a function
    todos.push(Todo(_text, false));

    //todo.completed initialized to false
    todos.push(todo);

  }

  //function get for todos 
  function get(uint i) public view returns (string memory _text, bool _completed){
    Todo storage todo = todos[i];
    return (todo.text, todo.completed);
  }
  //update text
  function update(uint i, string memory _text) public{
    Todo storage todo = todos[i];
    todo.text = _text;
  }
  //update completed
  function toggleCompleted(uint i, bool _completed) public{
    Todo storage todo = todos[i];
    todo.completed = _completed;
  }

}

//Data Locations: calldata, storage and memory
//storage is a contract's persistent memory:availble globally
//memory is a contract's volatile memory: available only in the current function
//calldata is available on external functions

contract DataLocations{
  uint [ ] public arr;
  mapping (uint => address) map;
  struct MyStruct{
    uint foo;
  }
  mapping(uint =>MyStruct) myStructs;
  function f()public{ _f(arr, map, myStructs[1]);
  
  //get a struct from a mapping
  MyStruct storage myStruct = myStructs[1];
  // create a struct in memory
  MyStruct memory myMemStruct = MyStruct(0);
  }
  function _f(uint[] storage _arr,
   mapping(uint => address) storage _map,
   MyStruct storage _myStruct) internal 
  {}

  //return memory variables 
  function g(uint [] memory _arr) public returns (uint[] memory ){
  }

  //function to return calldata
  function h(uint [] calldata _arr) external{  
  }

}

contract Functions{
  //function retun many values
  function returnMany() public pure returns(uint, bool, uint){
    return(1,true,2);
  }
  //function return named values
  function named()public pure returns(uint x, bool b, uint y){
    return(1,true, 2);
  }
  //return values asssigned to variables:return statement omitted
  function assigned()public pure returns (uint x,bool b, uint y){
    x = 1;
    b = true;
    y = 2;
  }
  //can use array as input
  function arrayInput(uint [] memory _arr ) public{

  }
  //can use array as output
  uint [] public arr;
  function arrayOutput() public view returns (uint[] memory){
    return arr;
  }
    
}

//Getter functions can be declared view or pure 
//view functions cannot be modified
//pure functions cannot be modified or or read/called by other contracts

contract ViewAndPure{
  
  uint public x = 1;

  //promise not to modify state
  function addToX(uint y) public view returns(uint){
    return x + y;
  }

  //promise not to modify or read from the state

  function addToPure(uint j, uint k) public pure returns(uint){
    return j+k;
  }
}


//errors will undo all the changes made to the state during the execution of a function
//You can throw an error by calling revert, require or assert
//Require: used to validate inputs and conditions b4 execution
//revert : same as require
//assert : used to check for code that should never be false
//failing assertion probably means a bug in your code

contract Error{
  function testRequire(uint _i) public pure{
    require (_i > 10, "input must be graeter than 10" );
  }
  function testRevert(uint _i) public pure{
    if (_i <= 10){
      revert("input must be greater than 10");
    }
  }
  uint public num;
  function testAssert() public  view{ 
  //assert should only be used to test for internal errors
  //here we assert that num is always equal to 0
  //since its impossible to update value of num
    assert(num==10);
  }

  //custom error 
  error InsuffiecientBalance(uint balance, uint withdrawAmount);
  function testCustomError(uint _withdrawAmount) public view{
    uint bal = address(this).balance;
    if (bal < _withdrawAmount){
      revert InsuffiecientBalance({balance:bal, withdrawAmount: _withdrawAmount});
    }
  }
}

contract Account{
  uint public balance ;
  uint public constant MAX_AMOUNT = 2**256 - 1;
  
  function deposit(uint _amount) public {
  uint oldBalance = balance ;
  uint newBalance = balance + _amount;
  
  //balance + _amount does not overflow if its >= balance
  require (newBalance >= oldBalance, "Overflow");

  balance = newBalance;

  assert(balance >=oldBalance);
  }

  function withdraw (uint _amount) public{

    uint oldBalance = balance;

    //balance -_amount does not underflow if balance >= _amount
    require (balance >= _amount, "underflow");

    if (balance < _amount){
      revert("underflow");
    }
    balance -= _amount;

    assert (balance <= oldBalance);
  }

}

//modifiers are codes that can be run before or after a function
//modifiers can be used to:
// 1. resist access
// 2. prevent reentrancy hack
// 3. validate inputs


contract FunctionModifiers{
  address public owner;
  uint public x = 10;
  bool public locked;

  constructor(){
    //set transaction sender to be the owner of the contract
  owner = msg.sender;
  }

  //modifier to check that caller is the owner of the contract

  modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _;
  }
  //modifier can take input
  //modifier to check that the input address is not the zero address
  modifier validAddress(address _addr){
    require (_addr != address(0), "Invalid Address!");
    _;
  }
  //function to change owner of the contract
  function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner){
    owner = _newOwner;
  }
  
  //modifiers can be called before or after a function 
  //These modifiers prevent a function from being called while executing
  modifier noReentrancy(){
    require (!locked, "No reentrancy");
    locked = true;
    _;
    locked = false;
  }

  function decrement(uint i)public noReentrancy{
    x -= i;
    if (x >1){
      decrement(i-1);
    }
  }
}

//Events allow logging into a contract: eth blockchain
//Use cases for events: listening to events and updating interfaces
//events are cheap form of storage

contract Event{
  //events declaration
  //upto 3 parameters can be indexed
  //indexed parameters can be used to filter logs by indexed parameter

  event Log(address indexed sender, string message);
  event AnotherLog();

  //function to emit an event
  function test()public{
    emit Log(msg.sender,"Hello World!");
    emit Log(msg.sender, "Hello EVM!");
    emit AnotherLog();
  }
}

//constructors
//constructor is an optional function
//how to pass arguments to a constructor

// base contract X
contract X {
  string public name;
  constructor (string memory _name ) {
    name = _name;
  }
} 

//Base contract Y
contract Y{
  string public text;
  constructor(string memory _text){
    text = _text;
  }
}

//ways to initialize parent contract with parameter
//pass parameters in inheritance list

contract B is X("Input to X"), Y("Input to Y"){

}

//pass parameters in constructor similar function modifiers
contract C is X,Y{
  constructor (string memory _name, string memory _text) X(_name) Y(_text){}
}

//parent contract are always called in order of inhertance regardless of order of inheritance list
// order of constructors called
//1. Y
//2. X
//3. D

contract D is X,Y{
  constructor()X("X was called") Y("Y was called"){}
}

//order of constructors called
//1. Y
//2. X
//3. E

contract E is X,Y{
  constructor () Y("Y was called") X("X was called"){}
}

/*Graph of inheritance

        A 
       / \
      B  C
      /\ /\
    F  D   E

    A: Base contracc

    B and C: Inherits from A
    D: Inherits from B, C
    E: Inherits from A, C
    F: Inherits from B,A
    */

/*
//contracts can inherit other contracts by using is keyword 
//fn that is going to be overidden by a child contract must must be declared virtual
//fn that is going to override a parent function must use override keyword
//order of inheritance is important
//list parent contracts in the order from "most base like " to "most derived like"
contract A{
  function foo() public pure virtual returns (string memory ){
    return "A";
  }

}

//contract B inherits from A
contract B is A {
  //override foo function
  function foo()public pure virtual override returns (string memory ){
    return "B";
  }
}

//contract C inherits from A
contract C is A {
  //overide foo function
  function foo()public pure virtual override returns (string memory){
    return "C";

  }
}
contract D is B,C{
  //D.foo() returns "C"
  //since C is the right-most parent contract with function foo()
  function foo() public pure override (B,C) returns (string memory){
    return super.foo();
  }
}

contract E is C,B{
  function foo() public pure override (C,B) returns (string memory){
    return super.foo();
  }
}

//iheritance must be ordered  from most-base-like to most-derived
//swapping order of A and B will throw a compilation error
contract F is A,B{
  function foo() public pure override(A,B) returns (string memory){
    return super.foo();
  }
}

*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}

//shadowing inherited state variables
contract A {
    string public name;
    function getName()public view returns (string memory){
      return name;
    }
}

//shadow function getName in inherited contract A
contract C is A{
  //correct way to override inherited state variables
  constructor (){
    name = "contract C";
  }
  // c.getname will return "contract C"
}
//
//calling parent contracts
//parent contracts can be called directly using the super keyword

//events can be emitted from functions and they are logged into transaction logs
//this will be useful for tracing transaction calls

contract A{
  event Log(string message);

  function foo() public virtual{
    emit Log("A.foo called");

  }
  function bar()public virtual {
    emit Log("A.bar called");
  }
  
}

contract B is A {
  function foo() public virtual override {
    emit Log("A.foo called");
    A.foo();

  }
  function bar () public virtual override {
    emit Log("B.bar called");
    super.bar();
  }
}


contract C is A {
  function foo() public virtual override {
    emit Log("A.foo cslled");
    A.foo();

  }
  function bar() public virtual override {
    emit Log("C.bar called");
    super.bar();

  }
}

contract D is B,C{
  //calling D.foo calls C then A although D inherits A, B and C
  //calling D.bar calls C, B then A. Although super was called teice (by B and C ) it only called A once
  function foo() public override (B,C) {
  super.foo();

  }
  function bar() public override (B,C) {
  super.bar();

  }

}

//visibility
//public, private, internal, exter
//public is the default visibility, visible to other functions and contracts
//private is only visible to the contract that defines it
//internal is visible to inside contract that inherits from internal function 
//external is visible to other contracts and accounts only

contract Base {
  // private function can only be called inside this contract 
  //contracts that inherit this contract cannot call this function

  function privateFunc() private pre returns(string memory) {
    return "Private Function called";

  }
  function testPrivateFunc() public pure returns(string memory){
    return privateFunc();
  }
  //internal function can be called by functions insside this contract
  //can also be called by contracts that inherit this contract

  function internalFunc() internal pure returns(string memory){
    return "Internal Function called";
  }
  //test internal function
  function testInternalFunc() public pure virtual returns (string memory){
    return internalFunc;
  }
  //public functions can be called inside this contract and inside contracts that inherit this contract
  function publicFunc() piblic pure returns(string memory){
    return "public function called";
  }
  
  //external functions can only be called by other contracts and accounts 
  function externalFunc()external pure returns (string memory){
    return "external function called";
  }
  //if we test external function it will throw an error
  //function testExternalFunc() public pure virtual returns (string memory){
  //  return externalFunc();
  //
  //State variables can be private, internal or public but they cannot be external

  string private privateVar = "my private variable";
  string internal internalVar = "my internal variable";
  string public publicVar = "my public variable";

}

contract Child is Base{
  //inherited contracts do not have access to private functions and state variables
  //internal functions can be called inside  child contracts
  function testInternalFunc() public pure override returns (string memeory){
    return internalFunc();
  }
}
//Interfaces

//you can interact with contracts using interfaces

//interfaces: can inherit from other interfaces
// all declared functions must be external
//cannot declare constructor
//cannot declare state variables
//cannot have any functions implemented 

contract Counter {
  uint public count;

  function increment () external {
    count++;
  }

}

interface ICounter {
  function count () external view returns (uint);
  
  function increment () external;

}

//contracts that implement an interface can only call functions that are declared in the interface

contract myContract {

  //external function incrementCounter taking adress variable called _counter

  function incrementCounter (address _counter) external {
  
    //get the increment at the address
    Icounter (_counter).increment ();
  }
  //external function getCount takind address variable called _counter and returning uint

  function getCount (address _counter) external view returns (uint){
  
    //returns the count variable of the contract at the address
    return ICounter(_counter).count();

  }
}

//uniswap example
interface UniswapV2Factory{
  //function getPair taking address variables tokenA and tokenB and returning address pair
  function getPair(address tokenA, address tokenB) returns (address pair);

}

interface UniswapV2Pair{

  //external view fuction getReserves returning uint112, uint112 and uint32
  function getReserves()external view returns (uint112 reserve0, uint112reserve1, uint32 blockTimestampLast);

}

contract UniswapExample{
  address private factory = 0x0;
  address private dai = 0x0;
  adress private weth = 0x0;

  //external view function getTokenReserves returning uint



  function getTokenReserves()external view returns (uint, uint){

    //get the factory address
    address pair = UniswapV2Factory(factory).getPair(dai,weth);

    //get the reserves of the pair
    (uint reserve0, uint reserve1, uint blockTimestampLast) = UniswapV2Pair(pair).getReserves();
    //return the reserves
    return (reserve0, reserve1);
  }
}

//address declared payable can receive ether into contract

contract Payable {
  //payble address
  address payable public owner;
  //payable constructor
  constructor () payable {
    owner = payable (msg.sender);
  }

  //function to deposit ether into this function
  //balance will be updated
  //payable deposit function 

  function deposit() public payable{}

  //function to withdraw all ether from this contract

  function withdraw () public{
    //get amount of ether in this contract
    uint amount = address(this).balance;
    //send all ether to owner
  

    (bool success,) = owner.call{value:amount}("");
    require (success, "Failed to send ether");
  }
  //function to transfer ether to address in the contract

  function transfer(address payable _to, uint _amout) public{
    (bool success,) = _to.call{value:_amount}("");
    require (success, "Failed to send ether");
  }
}

//receive ether
//receive () external payable {} if msg.data is empty
//fallback () external payable {} if msg.data is not empty


contract ReceiveEther{
  //function to receive ether if msg.data is empty
  receive () external payable {}
  //function to receive ether if msg.data is not empty
  fallback () external payable {}
}

  //send ether
  //by function transfer (2300 gas, throws error if failed) :function no longer recommended
  //by function send (2300 gas, returns bool) :function no longer recommended
  //by function call (forwars all gas or set gas, returns bool) :function currently recommended

  //call function with combination of reentrance guard is recommended

  //guard against reentrance by:
  //using reentrance guard modifier
  //making all state changes before calling other contracts


contract SendEther{

  function sendViaTransfer(address payable _to) public payable{
    _to.transfer(msg.value);
  }
  function sendViaSend (address payable _to) public payable{
    //returns boolean indicating success or failure
    bool sent = _to.send(msg.value);
    require (sent, "Failed to send ether");
  }

  function sendViaCall (address payable _to) public payable{
    //returns boolean indicating success or failure
    //current recommended method
    (bool sent, bytes memory data) = _to.call{value:msg.value}("");
    require (sent, "Failed to send ether");
  }



}


























