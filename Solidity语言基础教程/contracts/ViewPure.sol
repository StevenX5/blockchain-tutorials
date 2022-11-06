// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// view和pure函数
contract ViewPure {
    uint public x = 10;

    // view函数
    function test1(uint a) public view returns(uint) {
        return x + a;
    }

    // pure函数
    function test2(uint a, uint b) public pure returns(uint) {
        return a + b;
    }
		
		// 读取msg.data
    function test3() public pure returns(bytes memory) {
        return msg.data;
    }

    // 读取balance
    function test4() public view returns(uint) {
        return address(this).balance;
    }
}