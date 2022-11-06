// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 帐号存取款异常处理
contract ErrorsAccount {
    uint public balance;
    uint public constant MAX_UINT = 2**256 - 1;

    // 存入以太币到合约
    function deposit(uint _amount) public payable {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        // 检查溢出
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;
        assert(balance >= oldBalance);
    }

    // 从合约提取以太币
    function withdraw(uint _amount) public payable {
        uint oldBalance = balance;

        // 检查溢出
        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;
        assert(balance <= oldBalance);
    }
}