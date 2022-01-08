// SPDX-License-Identifier: MIT
//compiler btwn 0.8.10 and 0.9.0
pragma solidity >=0.8.10 <0.9.0;

  contract EtherUnits{

    uint public oneWei = 1 wei;

    bool public isOneWei = 1 wei ==1;

    uint public oneEther = 1 ether;

    // 1 ether is equal to 10^18 wei

    bool public isOneEther = 1 ether == 1^18;

  }