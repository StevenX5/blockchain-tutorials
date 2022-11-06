// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 按位运算符
contract OperatorsBitwise {
    // 变量初始化
    bytes1 public a = 0xff;     // 11111111
    bytes1 public b = 0x11;     // 00010001

    // 按位与
    bytes1 public and = a & b;  // 00010001 => 0x11

    // 按位或
    bytes1 public or = a | b;   // 11111111 => 0xff

    // 按位异或
    bytes1 public xor = a ^ b;  // 11101110 => 0xee

    // 按位非
    bytes1 public not1 = ~a;     // 00000000 => 0x00
    bytes1 public not2 = ~b;     // 11101110 => 0xee

    // 左移
    bytes1 public leftshift1 = a << 2;  // 11111100 => 0xfc
    bytes1 public leftshift2 = b << 2;  // 01000100 => 0x44

    // 右移
    bytes1 public rightshift1 = a >> 2; // 00111111 => 0x3f
    bytes1 public rightshift2 = b >> 2; // 00000100 => 0x04
}