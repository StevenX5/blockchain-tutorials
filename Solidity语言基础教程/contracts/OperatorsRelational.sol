// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 关系运算符
contract OperatorsRelational {
    // 变量初始化
    uint public a = 20;
    uint public b = 10;

    // 等于
    bool public eq = a == b;

    // 不等于
    bool public noteq = a != b;

    // 大于
    bool public gtr = a > b;
    
    // 小于
    bool public les = a < b;

    // 大于等于
    bool public gtreq = a >= b;

    // 小于等于
    bool public leseq = a <= b;
}