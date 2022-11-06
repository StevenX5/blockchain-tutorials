// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 可支付的地址和函数
contract Payable {
    // 可支付地址
    address payable public owner;
    
    // 合约地址及地址余额映射
    address public contract_address;
    mapping(address => uint) public balance;

    // 构造函数
    constructor() {
        owner = payable(msg.sender);
        contract_address = address(this);
    }

    // 存入以太币到合约
    function deposit() public payable {
        balance[contract_address] = msg.value;
    }

    // 取合约地址余额
    function getBalance() public view returns(uint) {
        return balance[contract_address];
    }

    // 从合约提取以太币
    function withdraw(address payable to) public {
        require(balance[contract_address] > 1, "no enough ether");
        balance[contract_address] -= 1 ether;
        to.transfer(1 ether);
        // owner.transfer(1 ether);
    }
}