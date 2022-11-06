// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 目标合约
contract Base {
    function test(uint a, uint b) public pure returns(uint) {
        return a + b;
    }
}

// 调用者合约
contract FunctionSelector {
    // 取函数选择器
    // transfer(address,uint256) - 0xa9059cbb
    // transferFrom(address,address,uint256) - 0x23b872dd
    function getSelector(string calldata func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(func)));
    }

    // 调用目标合约的test函数
    function call_test(address addr, uint a, uint b) public returns(bool, bytes memory) {
        (bool success, bytes memory data) = addr.call(abi.encodeWithSelector(bytes4(keccak256("test(uint256,uint256)")), a, b));
				//(bool success, bytes memory data) = addr.call(abi.encodeWithSignature("test(uint256,uint256)", a, b));
        return (success, data);
    }
}