// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 枚举类型
contract Enum {
    // 定义一个枚举类型
    enum Action { Up, Down, Left, Right }

    // 定义变量，默认值为第一个元素，即"Up"的值
    Action public action;
		
		// 默认值
    Action constant defaultValue = Action.Left;

    // 设置默认值
    function setDefault() public {
        action = Action.Left;
    }

    // 设置，传递一个uint值（0-3）
    function set(Action _action) public {
        action = _action;
    }

    // 取值，返回一个uint值
    function get() public view returns(Action) {
        return action;
    }

    // 取最小值
    function getMinValue() public pure returns(Action) {
        return type(Action).min;
    }

    // 取最大值
    function getMaxValue() public pure returns(Action) {
        return type(Action).max;
    }
}