// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 条件控制
contract Ifelse {
    // if-else
    function test1 (uint x) public pure returns(uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    // if-else的三元运算符用法
    function test2(uint x) public pure returns(uint) {
        // if (x < 10)
        //     return 1;
        // else
        //     return 2;
        
        // 以上代码的另一种写法
       return (x < 10) ? 1 : 2;
    }
}