// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 条件运算符
contract OperatorsAssignment {
    // 变量
    uint public a = 10;
    uint public b = 20;
    uint public c = 30;
    uint public d = 40;
    uint public e = 50;
    bytes1 public h1 = 0xa0;    // 10100000
    bytes1 public h2 = 0xb0;    // 10110000
    bytes1 public h3 = 0xc0;    // 11000000
    bytes1 public h4 = 0xd0;    // 11010000
    bytes1 public h5 = 0xe0;    // 11100000

    // 函数
    function getResult() public {
        // 加、减、乘、除、取模
        a += 10;    // 20
        b -= 10;    // 10
        c *= 10;    // 300
        d /= 10;    // 4
        e %= 10;    // 0

        // 按位与、或、异或
        h1 &= 0x10; // 10100000 & 00010000 => 00000000 => 0x00
        h2 |= 0x10; // 10110000 | 00010000 => 10110000 => 0xb0
        h3 ^= 0x10; // 11000000 ^ 00010000 => 11010000 => 0xd0

        // 左移、右移
        h4 <<= 2;   // 01000000 => 0x40
        h5 >>= 2;   // 00111000 => 0x38
    }
}