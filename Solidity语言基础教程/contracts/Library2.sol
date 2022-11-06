// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 删除数组中元素的库
library Array {
    // 删除后将最后一个元素移到删除位置
    function remove(uint[] storage arr, uint idx) public {
        require(arr.length > 0, "cant remove from a empty array");
        arr[idx] = arr[arr.length - 1];
        arr.pop();
    }
}

// 需要先部署Array库（因为库函数是public）
contract TestArray {
    using Array for uint[];
    uint[] public arr;

    function testRemove() public {
        for (uint i = 0; i < 3; i++)
            arr.push(i);
        arr.remove(1);
        assert(arr.length == 2);
    }
}