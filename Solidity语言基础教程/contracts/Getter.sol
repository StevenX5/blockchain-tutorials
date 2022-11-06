// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Getter函数
contract Base {
    uint public data = 42;

    // 内部访问
    function test1() public {
    	data = 5;
    }

    // 外部访问
    function test2() public view returns(uint) {
    	uint v = this.data();
        return v;
    }
}

// 外部调用
contract Caller {
    Base c = new Base();

    // getter调用
    function test() public view returns (uint) {
        return c.data();
    }
}