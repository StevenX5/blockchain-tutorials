// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 值是结构的映射
contract MappingStruct {
    // 定义结构体
    struct Student {
        string name;
        uint score;
    }

    // address => struct
    mapping(address => Student) result;
    address[] student_addr;

    // 添加数据到映射
    function add(address _addr, string memory _name, uint _score) public {
        // 添加到映射
        Student memory student;
        student.name = _name;
        student.score = _score;
        result[_addr] = student;

        // 添加到数组
        student_addr.push(_addr);
    }

    // 取值
    function getResult(address _addr) public view returns(Student memory) {
        return result[_addr];
    }

    // 取长度
    function getLength() public view returns(uint) {
        return student_addr.length;
    }
}