// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 函数和状态可变性
contract Base {
    uint private data;
		uint internal x;
    uint public y;

    function foo(uint a) private pure returns(uint) { return a + 1; }
    function setData(uint a) public { data = a; }
    function getData() public view returns(uint) { return data; }
    function sum(uint a, uint b) internal pure returns (uint) { return a + b; }
    function product(uint a, uint b) external pure returns (uint) { return a * b; }
}

// 外部合约
contract Caller1 {
    function test() public returns(uint) {
        Base c = new Base();
        uint v;
				// v = c.y();
        // v = c.foo(7);     // foo函数不可见
        c.setData(3);
        v = c.getData();
        // v = c.sum(3, 5);    // sum函数不可见
        v = c.product(3, 5);
        return v;
    }
}

// 派生合约
contract Caller2 is Base {
    function test() public pure returns(uint) {
        uint v = sum(3, 5);   // 派生合约可以访问
        return v;
    }
}