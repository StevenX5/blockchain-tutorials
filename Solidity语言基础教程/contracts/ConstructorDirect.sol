// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 基类
contract Base {
    uint data;
             
    // 构造函数
    constructor(uint _data) {
        data = _data;  
    }
}

// 继承合约（直接初始化）
contract Derived is Base(2) {
    // 构造函数
    // constructor() {}

    // 定义一个函数访问父合约的状态变量
    function getData() external view returns(uint) {
        uint result = data ** 2;
        return result;
    }
}

// 调用合约
contract Caller {
    // 创建子合约对象
    Derived c = new Derived();

    // 通过子合约对象访问父合约和子合约的函数
    function getResult() public view returns(uint) {
        return c.getData();
    }
}