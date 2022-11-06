// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 函数修改器
contract Modifier {
    // 状态变量
    address public owner;
    uint public x = 10;
    bool public locked;

    // 构造函数
    constructor() {
        owner = msg.sender;     // 当前合约所有者
    }

    // 修改器，用于检查调用方是否为所有者
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // 修改器，用于检查传入的地址不是零地址
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // 改变owner的值
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // 修改器，防止函数被重入
    modifier noReentrancy() {
        require(!locked, "Reentrancy");
        locked = true;
        _;
        locked = false;
    }

    // 这个函数受互斥保护，当函数运行时不能被重复调用
    function decrement(uint i) public noReentrancy {
        x -= i;
        if (i > 1) {
						decrement(i - 1);
        }
    }
}