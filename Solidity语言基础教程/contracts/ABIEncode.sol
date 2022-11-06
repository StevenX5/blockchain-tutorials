// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// ABI编码与解码
contract ABIEncode {
    // encode 编码
    function encode(address addr, uint num) external pure returns (bytes memory) {
        return abi.encode(addr, num);
    }
		
		// encodePacked 紧打包编码
    function encodePacked(address addr, uint num) external pure returns (bytes memory) {
        return abi.encodePacked(addr, num);
    }

    // decode 解码
    function decode(bytes calldata data) external pure returns(address addr, uint num) {
        // (address addr, uint num) = ...
        (addr, num) = abi.decode(data, (address, uint));
    }
}
