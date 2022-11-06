// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 接口示例
// 把两个合约都部署到链上，MyContract接收Counter合约的地址作为参数
contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}