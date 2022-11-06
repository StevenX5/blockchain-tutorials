// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 错误处理及异常
contract Errors {
   // Require测试
    function testRequire(uint i) public pure {
        require(i > 10, "Input must be greater than 10");
    }

    // Revert测试
    function testRevert(uint i) public pure {
        if (i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    // Assert测试
    uint public num;
    function testAssert() public view {
        assert(num == 0);
    }

    // 自定义错误
    error InsufficientBalance(uint balance, uint amount);
    function testCustomError(uint _amount) public view {
        uint bal = address(this).balance;
        if (bal < _amount) {
            revert InsufficientBalance({balance: bal, amount: _amount});
        }
    }
}