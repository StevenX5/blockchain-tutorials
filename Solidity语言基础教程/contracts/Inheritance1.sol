// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 继承示例
contract Owned {
		constructor() public { owner = payable(msg.sender); }
		address payable owner;
}

// 使用 is 从另一个合约派生
// 派生合约可以访问所有非私有成员，包括内部（internal）函数和状态变量
contract Destructible is Owned {
		// 关键字"virtual"表示该函数可以在派生类中"override"
		function destroy() virtual public {
				if (msg.sender == owner) selfdestruct(owner);
		}
}
