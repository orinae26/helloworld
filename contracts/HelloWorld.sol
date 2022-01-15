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

//fallback contract 
//fallback function does not take any arguments nor return any values
//its executed when a function called does not exist
//or ether sent to a contract whose receive function does not exist or whose msg.data is not empty

contract Fallback{

  event Log (uint gas);
  fallback () external payable {
    emit Log(gasleft());
  }

  //check balance of this contract
  function getBalance()public view retuns (uint){
    return address(this).balance;
  }
}
contract sendToFallback{
  //transfer ether to fallback contract  
  function transferTOFallback(address payable _to)public payable{
    _to.transfer(msg.value);
  }
 //send ether to fallback contract
  function sendToFallback(address payable _to)public payable{
    _to.send(msg.value);
  }
  //send  ether to fallback contract with call
  function callFallback(address payable _to)public payable{
    (bool sent, ) = _to.call{value:msg.value}("");
    require (sent, "Failed to send ether");
  }
}

//call is a low level function to interact with other contracts
//used when you are sending ether with a fallback function
//however not the recommended way to interact with other functions

contract Receiver{
  event Received (address caller, uint amount, string message);

  fallback ()external payable{
    emit Received(msg.sender, msg.value, "Fallback was called");
    
  }
  function foo(string memory _message, uint _x) public payable returns(uint){
    emit Received(msg.sender, msg.value, _message);

    return _x +1;
  }

}

contract Caller{
  event Response (bool success, bytes data);
  //we imagine contract B does not have source code for contract A but we know address of A and function to call
  function testCallFoo(address payable _addr) public payable{
    //send ether and specify custom amount of gas
    (bool success, bytes memory data) = _addr.call{value:msg.value,gas:5005}(
      abi.encodeWithSignature("foo(string,uint256)", "Call foo",123));
    //check if call was successful

    emit Response (success, data);

  }
  //calling a function taht do not exist triggers fallback function

  function testCallDoesNotExist(address _addr) public{
    (bool success,bytes memory data) = _addr.call{value:msg.value}(abi.encodeWithSignature("doesNotExist()"));
  //check if call was successful
    emit Response (success, data);
  }
}

//delegatecall is a low level function to interact with other contracts similar to call
//When contract A executes delegate call to contract B, contract B is executed with the same arguments as contract A

//for contract A to call contract B, contract B be deployed first

contract B {
  uint public num;
  address public sender;
  uint public value;
  //function to be called by contract A
  function setVars(uint _num) public payable{
    num = _num;
    sender = msg.sender;
    value = msg.value;
  }
}

contract A {
  uint public num;
  address public sender;
  uint public value;

  //delegatecall to contract B
  function setVars(address _contract, uint _num) public payable {
    (bool success, bytes memory data) = _contract.delegatecall(abi.encodewithSignature("setVars(uint256)", _num));
  }
}
//function selectors
//function selector is a 4 byte string that uniquely identifies a function
//function selector is used to call a function
// when a function is called,the first 4 the first 4 bytes of calldat specifies which function to call
contract FunctionSelector {
  function getSelector(string calldata _func) external pure returns (bytes4){
    return bytes4 (keccak256(bytes(_func)));
  } 
}

//calling other contracts
//easiest way to call a contract is to call it like A.foo(x,y,z)
//anothereway is to use the low-level call though not recommended

contract Callee{
  uint public x;
  uint public value;
  //function to set x and value
  function setX(uint _x) public returns (uint){
    x = _x;
    return x;
  }

  //function to set x and value and return value and x
  function setXandSendEther (uint _x) public payable returns (uint,uint){
    x = _x;

    value = msg.value;

    return (x,value);
  }
}
//contract to call contract Callee
contract Caller {
  function setX(Callee _callee, uint _x) public{
    //call callee contract
    uint x = _callee.setX(_x);
  }
  function setXFromAddress(address _addr, uint _x) public{
    //call callee contract
    Callee callee = Callee(_addr);
    
    uint x = callee.setX(_x);
  }
  function setXandsendEther(Callee _callee, uint _x) public payable{
    //call callee contract
    (uint x, uint value) = _callee.setXandSendEther{value:msg.value}(_x);
  }
}
//contract to write other contracts
//contract can create new contracts by using new keyword

contract Car{
  address public owner;
  string public model;
  address public carAddr;

  constructor{
    owner = _owner;
    model = _model;
    carAddr = address(this);
  }
}

contract Carfactory{

  //public array of cars

  Car [] public cars;
  //function to create new car
  function create(address _owner, string memory _model) public{
    Car car = new Car(_owner, _model);
    cars.push(car);
  }
  //function create car and send ether
  function createAndSendEther (address _owner, string memory _model) public payable{
    Car car = new car {value:msg.value}(_owner, _model);
    cars.push(car);
  }
  //function to create car and send ether to fallback function
  function create2(address owner, string memory _model,bytes32 salt) public{

    //create new car
    Car car = (new car){salt:_salt}(owner, _model);
    //push car to array
    cars.push(car);
  }

  function create2AndSendEther(address _owner,string memory _model, bytes32 salt) public payable{
    //create new car
    Car car = (new car){value:msg.value, salt : _salt}(owner, _model);
    //push car to array
    cars.push(car);
  }
//function to get car by index
  function getCar (uint _index) public view returns (address owner,string memory owner,address carAddr,uint balance ){
    //get car by index
    Car car = cars[_index];
    //get properties of car
    return (car.owner(), car.model(),carcarAdrr(),address(car).balance);
  }
}

//try catch
//try catch is used to catch errors from external function calls and contract creation

contract Foo{
  address public owner;
  //constructor
  constructor (address _owner){
    owner = _owner;
  require (owner != address(0)_"Invalid address");
  assert (owner != 0x0000000000000000000000000000000000000001);
  owner = _owner;
  }
  //function to call external function
  function myFunc(uint x)public pure returns (string memory){
    require (x != 0, "require failed");
    return "my function was called";
  }
}
contract Bar{
  //function to call external function
  event Log(string message);
  event LogBytes(bytes, data)
  Foo public foo;

  //constructor
  constructor{
    //this Foo contract is used for testing try catch with an external function call
    foo = new Foo(msg.sender);
  }
  //try/catch 
  //example of try/catch with external function 
  // tryCatchExternalCall(0) => Log("external call failed")
  // tryCatchExternalCall(1) => Log("my func was called")

  function tryCatchExternalCall(uint _i) public{
    try foo.myFunc(_i) returns (string memory result) {
      emit Log(result);
    }
    catch {
      emit Log("External call Failed");
    }
  }
  //example of try/catch with contract creation
  // Example of try / catch with contract creation
  // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address")
  // tryCatchNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
  // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo created")
  
  function tryCatchNewContract (address _owner) public{
    try new Foo(_owner) returns (Foo foo){
      emit Log ("Foo created");
    } catch Error (string memory reason) {
      //catch failing revert() and require()
      emit Log(reason);
    } catch(bytes memory reason) {
      //catch failing assert()
      emit LogBytes (reason);
    }
  }
}

//importing file from same directory

contract Foo{
  string public name = "Foo";
}

//import contract foo saved "Foo.sol" in same directory

import "./Foo.sol";

contract Import{
  //initialize Foo.sol

  Foo public foo = new Foo();
  //test foo by getting its name
  function getFooName() public view returns (string memory){
    return Foo.name();
  }
}
//libraries
//libraries are similiar to contracts but you cannot declare any state variables nor send ether
//they are embeded into a contract if all library functions are internal 
//otherwise they must be deployed and then linked b4 contract is deployed

Library safeMath{

  function add(uint x, uint y) internal pure returns (uint){

    uint z = x+y;

    require (z>=x, "uint overflow");

    return z;
  }
}
Library Math{
  function sqrt (uint y ) internal pure returns (uint z){
    if (y>3){
      z=y;
      uint x = y/ 2+1;

      while(x<z){
        z=x;
        x= (y/x+x)/2;
      }
    }
    else if(y != 0){
      z=1;

    }
    //else
    else {
      z = 0;
    }
  }
}


contract TestSafeMath{
  using SafeMath for uint;

  uint public MAX_UINT = 2**256 - 1;

  function testAdd (uint x, uint y) public pure returns (uint){
    return x.add(y);
  }

  function testSquareRoot(uint x) public pure returns (uint) {
    return Math.sqrt(x);
  }
}

Library Array{
  // Array function to delete element at index and reorganize the array so that there are no gaps beteewn array elements
  function remove (uint[]storage arr, uint index) public {
  //move last element into place to be removed
  require (arr.length > 0, "array is empty");
  //indexof array is length of array -1
  arr[index] =  arr[arr.length - 1];
  //remove last element
  arr.pop();
  }
}
contract TestArray{
  using Array for uint[];

  uint public arr; 

  function testArrayRemove () public {

    for (uint i = 0; i < 3; i++){
      arr.push(i);
    }
    arr.remove(1);

    assert (arr.length ==2);
    assert(arr[0]==0);
    assert(arr[1]==2);
  }
}

//keccak256 hashing
//keccak256 is a hash function that takes in a string and returns a 32 byte hash
//keccak256 is used to hash the contract's code
//used in commit-reveal scheme
//used in merkle tree
//used to compact cryptographic signatures
// used to create a deterministic unique id for a contract

contract HashFunction{
  fuction hash(string memory _text, uint _num, address _addr) public pure retuns(bytes32){

    return keccak256(abi.encodePacked(_text,_num,_addr));
  }

  //hash collision happens when you pass more than one dynamic datatype to abi.encodePacked
  //this is because abi.encodePacked will encode the dynamic datatype as a 32 byte array
  //so if you pass more than one dynamic datatype to abi.encodePacked it will create a hash collision
  //instead you can use abi.encode

  //hash collision function
  function collision (string memory _text, string memory _anothertext) public pure returns(bytes32){
    return keccak256(abi.encode(_text,_anothertext));
  }
}

contract GuessTheMagicWord{
  bytes32 public answer = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

  function guess(string memory _word) public view returns{
    return keccak256(_word) == answer;
  }
}

//verifying a signature
//verifying a signature is used to verify that a transaction was signed by the sender
//messages can be signed off-chain using a contract

//creating a signature
//1. create a message to sign
//2. hash the message
//3. sign the hash(off chain, keep private key a secret)

//verifying a signature

//1.recreate hash from original message
//2.recover signer from signature and hash
//3.compare recovered signer with claimed signer

contract VerifySignature{
  /* 1. Unlock MetaMask account ethereum.enable()

    2. Get message hash to sign
    getMessageHash(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C,123,"coffee and donuts", 1 )hash = "0xcf36ac4f97dc10d91fc2cbb20d718e94a8cbfe0f82eaedc6a4aa38946fb797cd"
  */
  function getmessageHash(address _to, uint _amount, string memory _message, uint _nonce)
    public pure returns(bytes32 ){
    return keccak256(abi.encodePacked(_to,_amount,_message,_nonce));
  }
  /* 3. Sign message hash
    # using browser
    account = "copy paste account of signer here"
    ethereum.request({ method: "personal_sign", params: [account, hash]}).then(console.log)

    # using web3
    web3.personal.sign(hash, web3.eth.defaultAccount, console.log)

    Signature will be different for different accounts
    0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    */

  function getSignedMessageHash(bytes32 _message) public pure returns(bytes32){
     /*
        Signature is produced by signing a keccak256 hash with the following format:
        "\x19Ethereum Signed Message\n" + len(msg) + msg
        */
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",_message));
  } 
  /* 4. Verify signature
      signer = 0xB273216C05A8c0D4F0a4Dd0d7Bae1D2EfFE636dd
      to = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C
      amount = 123
      message = "coffee and donuts"
      nonce = 1
      signature =
          0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
      */

  function verify(address _signer, address _to uint _amount, string memory _message, uint _nonce, bytes memory signature)
    public pure returns(bool){
      bytes32 messageHash = getMessageHash (_to, _amount, _message, _nonce);
      bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
      return recoverSigner(ethSignedMessageHash,signature) == _signer;
    }
  //function recover signer
  function recoverSigner(bytes32 _ethSignedMessageHash,bytes32 memory _signature)
    public pure returns(address){
      (bytes32 r, bytes32 s, uint8 v) = splitSignature (_signature);
      return ecrecover (_ethSignedMessageHash , v ,r, s);
    }

  //function split signature
  function splitSignature(bytes memory sig) public pure returns(bytes32 r, bytes32 s, uint8 v){
    return (sig.length ==65 , "Invalid signature length");

    assembly{
      /*
            First 32 bytes stores the length of the signature

            add(sig, 32) = pointer of sig + 32
            effectively, skips first 32 bytes of signature

            mload(p) loads next 32 bytes starting at the memory address p into memory
            */

            // first 32 bytes, after the length prefix


       // first 32 bytes, after the length prefix
      r := mload (add(sig,32))
      // next 32 bytes
      s := mload (add(sig,64))
      //final 32 bytes
      v := byte(0,mload (add (sig,96)))
    }
    //implicitly returns r,s,v

  }
}


//contract to mint and send coins

contract Coin{
  address public minter
  mapping(address =>uint) public balances;

  
  event Sent(address from, address to, uint amount);

  constructor (){
    minter = msg.sender;
  }

  //minting coins
  function mint(address receiver, uint amount) public{

    //check if sender is minter
    require(msg.sender == minter, "Only the minter can mint");
    
    //add to balances
    balances[receiver] +=amount;

  }

  //errors
  error InsufficientBalance(uint requested, uint available);

  //send coins

  function send(address receiver, uint amount) public{
    //check if sender has sufficient balance
    if(amount>balance [msg.sender]){
      //throw error if sender has insufficient balance
      revert InsuffientBalance({
        requested :amount,
        available :balance [msg.sender]
      });
    }
    
    //else transfer coins

    balance [msg.sender] -= amount;
    balance [receiver] +=amount;
    //emit event
    emit Sent(msg.sender, receiver,amount);
    
  }



}












