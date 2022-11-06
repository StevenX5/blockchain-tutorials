// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 映射
contract Mapping {
    // address => uint
    mapping(address => uint) public map;

    // 取值
    function get(address _addr) public view returns(uint) {
        // 如果值未设置，则返回默认值
        return map[_addr];
    }

    // 设置
    function set(address _addr, uint _i) public {
        map[_addr] = _i;
    }

    // 删除
    function remove(address _addr) public {
        delete map[_addr];
    }
}
