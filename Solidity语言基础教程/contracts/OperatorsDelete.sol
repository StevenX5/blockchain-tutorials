// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// delete操作符
contract OperatorsDelete {
    uint data;
    uint[] dataArray;

    function f() public {
        uint x = data;
        delete x;       // 将 x 设为 0，并不影响数据
        delete data;    // 将 data 设为 0，并不影响 x，因为它仍然有个副本
        uint[] memory y = dataArray;
        delete dataArray;
        // 将 dataArray.length 设为 0，但由于 uint[] 是一个复杂的对象，y 也将受到影响，
        // 因为它是一个存储位置是 storage 的对象的别名。
        // 另一方面："delete y" 是非法的，引用了 storage 对象的局部变量只能由已有的 storage 对象赋值。
        assert(y.length == 0);
    }
}