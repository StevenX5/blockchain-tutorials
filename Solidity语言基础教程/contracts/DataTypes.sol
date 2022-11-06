// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 值类型
contract DataTypes {
    // 布尔类型
    bool public boo = true;
		
    // 整型
    uint8 public u8 = 123;
    uint256 public u256 = 456;
    uint public u = 789;
    
    int8 public i8 = -123;
    int256 public i256 = -456;
    int public i = -789;

    // 整型的最小值与最大值
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // 地址类型
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint public balance = addr.balance;

    // 字节类型
    bytes1 public b1 = 0x1a;
    bytes2 public b2 = 0x1a2b;
    bytes32 public b32 = 0x35c777b82e0fb4652a3562e28e1cf714ba503232888a7334e08377cb12cdd29c;

    // 字符串类型
    string public str = "this is a contract of datatypes";
  
    // 默认值
    bool public defaultBoo;         // false
    uint public defaultUint;        // 0
    int public defaultInt;          // 0
    address public defaultAddr;     // 0x0000000000000000000000000000000000000000
}