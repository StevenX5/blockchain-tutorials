// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 接收以太币
contract ReceiveEther {
    // receive 函数
    receive() external payable {}

    // fallback 函数
    fallback() external payable {}

    // 取合约余额
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

// 发送以太币
contract SendEther {
    // 合约地址及地址余额映射
    address public contract_address;
    mapping(address => uint) public balances;

    // 构造函数
    constructor() payable {
        contract_address = address(this);
        balances[contract_address] = msg.value;
    }

    // 取合约余额
    function getBalance() public view returns(uint) {
        return balances[contract_address];
    }

     // transfer 函数
    function useTransfer(address payable to, uint amount) public payable {
        require(balances[contract_address] > amount, "No enough ether");
        balances[contract_address] -= amount;
        to.transfer(amount);
    }

    // send 函数
    function useSend(address payable to, uint amount) public payable returns(bool) {
        require(balances[contract_address] > amount, "No enough ether");
        balances[contract_address] -= amount;
        bool success = to.send(amount);
        return success;
    }

    // call 函数
    function useCall(address payable to, uint amount) public payable returns(bool, bytes memory) {
        require(balances[contract_address] > amount, "No enough ether");
        balances[contract_address] -= amount;
        (bool success, bytes memory data) = to.call{value: amount}("");
        return (success, data);
    }
}