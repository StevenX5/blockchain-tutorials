// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 事件示例
contract Event {
    // 声明事件
    event Log(address indexed sender, string message);
    event Deposit(address indexed from, address indexed to, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    // 取合约余额
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // 事件测试
    function test() public {
        emit Log(msg.sender, "Hello World");
    }

    // 存入以太币到合约
    function deposit() public payable {
        emit Deposit(msg.sender, address(this), msg.value);
    }

    // 提取合约中以太币
    function withdraw(address to) public payable {
        uint value = address(this).balance;
        payable(to).transfer(address(this).balance);
        emit Transfer(address(this), to, value);
    }
}