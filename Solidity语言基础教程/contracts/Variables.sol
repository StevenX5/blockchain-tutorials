// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 变量
contract Variables {
    // 状态变量
    uint public num = 123;
    string public txt = "hello";

    address public sender;
    uint public timestamp;

    // 构造函数
    constructor() {
        // 全局变量
        sender = msg.sender;
        timestamp = block.timestamp;
    }

    // 函数
    function getResult() public pure returns(uint) {
        // 局部变量
        uint a = 2;
        uint b = 3;
        uint c = a * b;
        return c;
    }
}