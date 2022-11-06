// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 结构类型
contract StructCheck {
    // 定义结构体
    struct Student {
        string name;
        uint score;
    }

    // 定义变量
    Student[] public students;

    // 添加数据
    function add(string memory _name, uint _score) public {
				// _name为空检查
        require(bytes(_name).length > 0, 'name is null');
				// _name去重
				require(bytes(students[name].name).length == 0, "name is existed");

        // 1 - 类似于函数调用
        //students.push(Student(_name, _score));

        // 2 - 先初始化一个空结构再赋值
        Student memory student;
        student.name = _name;
        student.score = _score;
        students.push(student);
    }

    // 获取数据（返回结构）
    function get(uint idx) public view returns(Student memory) {
        Student memory student = students[idx];
        return student;
    }

    // 获取数据（返回元素）
    function getDetails(uint idx) public view returns(string memory, uint) {
        Student memory student = students[idx];
        return(student.name, student.score);
    }

    // 更新数据
    function set(uint idx, uint _score) public {
        students[idx].score = _score;
    }
}