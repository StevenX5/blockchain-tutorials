// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 目标合约，先部署好
contract Base {
    address public temp1;
    uint256 public temp2;
    bytes public x;

    // 回退函数
    fallback () external {
        x = msg.data;
    }

    function test(uint a, uint b) public returns(uint) {
        temp1 = msg.sender;
        temp2 = 200 + a * b;
				return a + b;
    }
}

// 调用合约
contract Caller {
    address public temp1;
    uint256 public temp2;

    // 未找到指定函数的调用，调用回退函数
    function call_fail(address addr) public returns(bool success, bytes memory data) {
        (success, data) = addr.call(abi.encodeWithSelector(bytes4(keccak256("abc")), 1, 2));
    }

    // 调用指定的函数，函数参数之间不能有空格
    function call_test(address addr, uint a, uint b) public returns(bool success, bytes memory data) {
        temp1 = msg.sender;
        temp2 = 100;

        // call 函数签名的前4个字节，以及每个参数的ABI编码数据（32个字节）的拼接
        (success, data) = addr.call(abi.encodeWithSelector(bytes4(keccak256("test(uint256,uint256)")), a, b));
        //(success, data) = addr.call(abi.encodeWithSignature("test(uint256,uint256)", a, b));

        // delegatecall
        //(success, data) = addr.delegatecall(abi.encodeWithSelector(bytes4(keccak256("test(uint256,uint256)")), a, b));
    }
}