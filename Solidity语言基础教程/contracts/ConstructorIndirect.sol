// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 基类
contract Base {
    string str;
             
    // 构造函数
    constructor(string memory _str) {
        str = _str;  
    }
}

// 继承合约（间接初始化）
contract Derived is Base {
    // 构造函数
    constructor(string memory _info) Base(_info) {}

    // 定义一个函数访问父合约的状态变量
    function getStr() external view returns(string memory) {
        return str;
    }
}

// 调用合约
contract Caller {
    // 创建子合约对象
    Derived c = new Derived("Hello Constructor");

    // 通过子合约对象访问父合约和子合约的函数
    function getResult() public view returns(string memory) {
        return c.getStr();
    }
}