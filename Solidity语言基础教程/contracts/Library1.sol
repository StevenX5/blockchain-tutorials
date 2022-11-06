// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 数学运算的安全库
library SafeMath {
    function add(uint x, uint y) internal pure returns(uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");
        return z;
    }
}

// 无需部署SafeMath库（因为库函数是internal）
contract TestSafeMath {
    using SafeMath for uint;

    function testAdd(uint x, uint y) public pure returns(uint) {
        return x.add(y);
    }
}
