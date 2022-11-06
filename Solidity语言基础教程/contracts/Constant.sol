// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 常量和不可变量
contract Constant {
    // constant 遵循大写命名规则
    uint public constant MY_UINT1 = 123;
    address public constant MY_ADDRESS1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // immutable 遵循大写命名规则
    uint public immutable MY_UINT2;
    address public immutable MY_ADDRESS2;

    // 构造函数
    constructor(uint _myUint) {
        MY_UINT2 = _myUint;
        MY_ADDRESS2 = msg.sender;
    }
}