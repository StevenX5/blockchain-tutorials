// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 验证签名
contract VerifySignature {
    /*
        生成签名（链下，如 web3.js, web3j）
        1. 生成数据的哈希值
        2. 对哈希值进行签名
    */
    // account: 0x0283aBc2ea9f4145978e914826374FFe41915CaB
    // signature: 0x6452378da03e57542137cfc232ca7c4a9c20f3898b4ff0eb4bfa8a5abb6b82c94340b3f084ac640834cd7f633934046b00cab29069538e0b0b4d8bdc1a1e8f2c01

    // 用于签名的数据
    string message = "hello";

    // 计算哈希值
    function getMessageHash(string memory _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    // 计算签名哈希值
    function getSignedMessageHash(bytes32 _messageHash) public pure returns(bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }

     /*
        验证签名
        1. 生成数据的哈希值
        2. 从签名中恢复账号
        3. 比较账号是否一致
     */
    function verify(bytes memory signature) public view returns(address) {
        // hash
        bytes32 msgHash = keccak256(abi.encodePacked(message));
        // signed hash
        bytes32 signMsgHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", msgHash));

        (bytes32 r, bytes32 s, uint8 v) = splitSignature(signature);

        // v must be 27 or 28
        if (v < 27) {
            v += 27;
        }

        address addr = ecrecover(signMsgHash, v, r, s);
        return addr;
    }

    // 从签名中分离 r,s,v
    function splitSignature(bytes memory sig) public pure returns (bytes32 r, bytes32 s, uint8 v)
    {
        require(sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
    }
}