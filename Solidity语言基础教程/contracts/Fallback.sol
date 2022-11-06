// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 回退函数调用合约
contract Test {
    uint public x;

    // 发送到这个合约的所有消息都会调用此函数（因为该合约没有其它函数）。
    // 向这个合约发送以太币会导致异常，因为 fallback 函数没有 `payable` 修饰符
    fallback () external { x = 1; }
}

// 这个合约会保留所有发给他的以太币，无法返还
contract TestPayable {
    uint public x;
    uint public y;

    // receive函数
    // 纯转账调用这个函数
    receive () external payable { x = 1; y = msg.value; }

    // fallback函数
    // 除纯转账外所有调用都调用这个函数
    fallback () external payable { x = 2; y = msg.value; }

    // 取合约余额
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

// 调用合约
contract Caller {
    // call Test
    function callTest(Test test) public {
        // 函数调用
        (bool success, ) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);

        // 以太币转账（交易会失败）
        payable(address(test)).transfer(1 ether);
    }

    // call TestPayable
    function callTestPayable(TestPayable test) public payable {
        bool success;
        // 以太币转账 test.x = 1, test.y = 1
        (success, ) = payable(address(test)).call{value: msg.value}("");
        require(success);

        // 函数调用 test.x = 2, test.y = 0
        (success, ) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);

        // 以太币转账+函数调用 test.x = 2, test.y = 1
        (success, ) = address(test).call{value: msg.value}(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
    }
}