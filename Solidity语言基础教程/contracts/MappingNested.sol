// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 嵌套映射
contract MappingNested {
    // address => uint
    mapping(address => mapping(uint => bool)) public map;

    // 取值
    function get(address _addr, uint _i) public view returns(bool) {
        // 如果值未设置，则返回默认值
        return map[_addr][_i];
    }

    // 设置
    function set(address _addr, uint _i, bool _boo) public {
        map[_addr][_i] = _boo;
    }

    // 删除
    function remove(address _addr, uint _i) public {
        delete map[_addr][_i];
    }
}
