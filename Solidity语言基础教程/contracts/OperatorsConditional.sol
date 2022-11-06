// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 条件运算符
contract OperatorsConditional {
    // 函数
    function test(uint a, uint b) public pure returns(uint) {
        uint result = a > b ? a - b : b - a;
        return result;
    }
}