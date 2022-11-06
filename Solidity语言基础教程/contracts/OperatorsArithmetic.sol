// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 算术运算符
contract OperatorsArithmetic {
    // 变量初始化
    uint public a = 20;
    uint public b = 10;

    // 加法
    uint public sum = a + b;

    // 减法
    uint public diff = a - b;

    // 乘法
    uint public mul = a * b;

    // 除法
    uint public div = a / b;

    // 取模
    uint public mod = a % b;
		
		// 求幂
    uint public pow = a ** 2;

    // 自增
    uint public in1c = ++a;	// 前缀自增，先加1再赋值
    uint public inc2 = a++;	// 后缀自增，先赋值再加1

    // 自减
    uint public dec1 = --b;	// 前缀自减，先减1再赋值
    uint public dec2 = b--;	// 后缀自减，先赋值再减1
}
}