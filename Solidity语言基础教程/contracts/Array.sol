// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 数组声明及基本操作
contract Array {
    // 定长数组
    uint[] public arr1 = [1, 2, 3];
    uint[10] public arr2;

    // 动态数组
    uint[] public arr;

    // 取数组元素
    function get(uint i) public view returns(uint) {
        return arr[i];
    }

    // 取数组长度
    function getLength() public view returns(uint) {
        return arr.length;
    }

    // 添加一个元素到数组
    function push(uint i) public {
        arr.push(i);
    }

    // 移除数组中最后一个元素
    function pop() public {
        arr.pop();
    }

    /*
        删除数组中某个元素
        删除元素不改变数组的长度，指定索引的元素值被重置为默认值(0)
    */
    function remove(uint idx) public {
        delete arr[idx];
    }

    // 创建一个内存数组
    function memoryArray() public pure returns(uint[] memory){
        uint[] memory a = new uint[](10);
        // 给元素赋值
        for (uint i = 0; i < a.length; i++)
            a[i] = i;
        return a;
    }
}