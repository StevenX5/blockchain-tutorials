// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 移除动态数组中的元素(元素从右向左移动)
contract ArrayRemove {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5] -- remove(2) --> [1, 2, 4, 5, 5] --> [1, 2, 4, 5]
    // [1] -- remove(0) --> [1] --> []
    uint[] public arr;

    // 移除数组元素
    function remove(uint idx) public {
        require(idx < arr.length, "index out of range");

        // 指定索引右边的元素从右向左移动
        for (uint i = idx; i < arr.length - 1; i++)
            arr[i] = arr[i + 1];
        arr.pop();
    }

    // test1
    function test1() public {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }

    // test2
    function test2() public {
        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}