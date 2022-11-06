// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 继承与重写
contract A {
    uint public u;
    function foo() public virtual { u = 1; }
}

// 合约B继承自合约A
contract B is A {
    // 重写A.foo()
    function foo() public virtual override { u = 2; }
}

// 合约C继承自合约A
contract C is A {
    // 重写A.foo()
    function foo() public virtual override { u = 3; }
}

// 合约继承自多个父合约
// 当在不同合约中多次定义的函数被调用时
// 父合约从右到左做被搜索（深度优先方式）
contract D is B, C {
    // u = 3
    // 因为C是函数foo()最右边的父合约
    function foo() public override(B, C) {
        return super.foo();
    }
}

contract E is C, B {
    // u = 2
    // 因为B是函数foo()最右边的父合约
    function foo() public override(C, B) {
        return super.foo();
    }
}

// 继承必须按"最基本的"到"最派生的"排序
// 交换A和B的顺序将引发编译错误
contract F is A, B {
    // u = 2
    function foo() public override(A, B) {
        return super.foo();
    }
}