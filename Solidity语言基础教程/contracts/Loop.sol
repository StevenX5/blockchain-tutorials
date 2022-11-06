// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 循环控制
contract Loop {
    // for循环
    function test1() public pure returns(uint) {
        // 计算1-10范围内奇数的和（遇6时中断循环）
        uint sum = 0;
        for (uint i = 1; i <= 10; i++) {
            if (i == 6)
                break;
            if (i % 2 == 0)
               continue;
            sum += i;
        }
        return sum;
    }

    // while循环
    function test2() public pure returns(uint) {
        // 计算1-10范围内的和
        uint sum = 0;
        uint i = 1;
        while (i <= 10) {
            sum += i;
            i++;
        }
        return sum;
    }

    // do-while循环
    function test3() public pure returns(uint) {
        // 计算1-10范围内的和
        uint sum = 0;
        uint i = 1;
        do {
            sum += i;
            i++;
        } while (i <= 10);
        return sum;
    }
}