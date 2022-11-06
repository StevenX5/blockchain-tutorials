// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 合约创建与操作方法
contract Base {
    // Creator 为创建此合约的合约
    Creator public creator;
    string public name;

    // 构造函数，设置 creator 和 name
    constructor(string memory _name) {
        creator = Creator(msg.sender);
        name = _name;
    }

    // 更改 name，只有合约的创建者可以更改
    function changeName(string memory newName) public {
        if (msg.sender == address(creator))
            name = newName;
    }
}

// 合约创建者
contract Creator {
    // 声明被创建合约
    Base public base;

    // 创建合约，返回合约地址
    function createBase(string memory name) public {
        base = new Base(name);
    }
		
		// 引用已创建的合约
    function referBase(address baseAddress) public {
        base = Base(baseAddress);
    }

    // 更改被创建合约的 name
    function changeName(string memory name) public {
        base.changeName(name);
    }

    // 取被创建合约的 name
    function getName() public view returns(string memory) {
        return base.name();
    }
}