// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 变量存储位置和作用域
contract DataStorages {
    // 状态变量强制为 storage
    string public str;
    bytes public bs;
    uint[] public arr;
    mapping(address => uint) map;
    struct Student {
        string name;
        uint score;
    }
    Student[] public students;

    // 公共函数(public)和外部函数(external)中，存储位置可以声明成 meomory 和 calldata
    // 私有函数(private)和内部函数(internal)中，存储位置还可以声明成 storage

    // 字符串的存储位置
    function setString(string memory _str) public {
        str = _str;
    }

    // 字节的存储位置
    function setBytes(bytes memory _bs) public {
        bs = _bs;
    }

    // 数组的存储位置
    function setArray(uint[] memory _arr) public {
         for(uint i = 0; i < _arr.length; i++) {
            arr.push(_arr[i]);
        }
    }
    
    // 结构体的存储位置
    function setStruct(Student calldata _student) public {
        students.push(_student);
    }

    // 在内部函数(internal)中，变量可以声明成 storage
    function getLength(uint[] storage _arr) internal view returns(uint) {
        return(_arr.length);
    }

    // 调用内部函数
    function test() public view returns(uint) {
        return getLength(arr);
    }
}