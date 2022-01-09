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

    //todo.completed inotialized to false
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