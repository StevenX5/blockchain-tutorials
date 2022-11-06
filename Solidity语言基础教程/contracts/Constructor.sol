// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 构造函数
contract Simple {
    string str;
             
    // 声明构造函数，并初始化状态变量
    constructor() {                 
        str = "hello simple";
    }
    
    // 定义一个函数返回状态变量的值
    function getValue() public view returns(string memory) {
        return str;
    }
}