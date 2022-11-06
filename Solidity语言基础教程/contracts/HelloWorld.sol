// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 第一个合约
contract HelloWorld {
    // 状态变量
    string public greet = "Hello World!";

    // set 函数
    function set(string memory s) public {
        greet = s;
    }

    // get 函数
    function get() public view returns(string memory) {
        return greet;
    }
}