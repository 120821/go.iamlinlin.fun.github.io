---
layout: post
title: "solidity--Verifying Signature"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/signature/</p>
<p>Messages can be signed off chain and then verified on chain using a smart contract.消息可以在链下签名，然后使用智能合约在链上进行验证。</p>
<p>使用 ethers.js 的示例: https://github.com/t4sk/hello-erc20-permit/blob/main/test/verify-signature.js</p>
<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>
<p>/* Signature Verification</p>
<p>How to Sign and Verify<br />
# Signing<br />
1. Create message to sign<br />
2. Hash the message<br />
3. Sign the hash (off chain, keep your private key secret)</p>
<p># Verify<br />
1. Recreate hash from the original message<br />
2. Recover signer from signature and hash<br />
3. Compare recovered signer to claimed signer<br />
*/</p>
<p>contract VerifySignature {<br />
&nbsp;&nbsp;&nbsp; /* 1. Unlock MetaMask account<br />
&nbsp;&nbsp;&nbsp; ethereum.enable()<br />
&nbsp;&nbsp;&nbsp; */</p>
<p>&nbsp;&nbsp;&nbsp; /* 2. Get message hash to sign<br />
&nbsp;&nbsp;&nbsp; getMessageHash(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 123,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;coffee and donuts&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br />
&nbsp;&nbsp;&nbsp; )</p>
<p>&nbsp;&nbsp;&nbsp; hash = &quot;0xcf36ac4f97dc10d91fc2cbb20d718e94a8cbfe0f82eaedc6a4aa38946fb797cd&quot;<br />
&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; function getMessageHash(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address _to,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint _amount,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string memory _message,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint _nonce<br />
&nbsp;&nbsp;&nbsp; ) public pure returns (bytes32) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; /* 3. Sign message hash<br />
&nbsp;&nbsp;&nbsp; # using browser<br />
&nbsp;&nbsp;&nbsp; account = &quot;copy paste account of signer here&quot;<br />
&nbsp;&nbsp;&nbsp; ethereum.request({ method: &quot;personal_sign&quot;, params: [account, hash]}).then(console.log)</p>
<p>&nbsp;&nbsp;&nbsp; # using web3<br />
&nbsp;&nbsp;&nbsp; web3.personal.sign(hash, web3.eth.defaultAccount, console.log)</p>
<p>&nbsp;&nbsp;&nbsp; Signature will be different for different accounts<br />
&nbsp;&nbsp;&nbsp; 0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b<br />
&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; function getEthSignedMessageHash(bytes32 _messageHash)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pure<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; returns (bytes32)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Signature is produced by signing a keccak256 hash with the following format:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;\x19Ethereum Signed Message\n&quot; + len(msg) + msg<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; keccak256(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abi.encodePacked(&quot;\x19Ethereum Signed Message:\n32&quot;, _messageHash)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; /* 4. Verify signature<br />
&nbsp;&nbsp;&nbsp; signer = 0xB273216C05A8c0D4F0a4Dd0d7Bae1D2EfFE636dd<br />
&nbsp;&nbsp;&nbsp; to = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C<br />
&nbsp;&nbsp;&nbsp; amount = 123<br />
&nbsp;&nbsp;&nbsp; message = &quot;coffee and donuts&quot;<br />
&nbsp;&nbsp;&nbsp; nonce = 1<br />
&nbsp;&nbsp;&nbsp; signature =<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b<br />
&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; function verify(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address _signer,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address _to,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint _amount,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string memory _message,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint _nonce,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes memory signature<br />
&nbsp;&nbsp;&nbsp; ) public pure returns (bool) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return recoverSigner(ethSignedMessageHash, signature) == _signer;<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; function recoverSigner(bytes32 _ethSignedMessageHash, bytes memory _signature)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pure<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; returns (address)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ecrecover(_ethSignedMessageHash, v, r, s);<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; function splitSignature(bytes memory sig)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pure<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; returns (<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes32 r,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes32 s,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8 v<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require(sig.length == 65, &quot;invalid signature length&quot;);</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assembly {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First 32 bytes stores the length of the signature</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add(sig, 32) = pointer of sig + 32<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; effectively, skips first 32 bytes of signature</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mload(p) loads next 32 bytes starting at the memory address p into memory<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // first 32 bytes, after the length prefix<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r := mload(add(sig, 32))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // second 32 bytes<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s := mload(add(sig, 64))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // final byte (first byte of the next 32 bytes)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v := byte(0, mload(add(sig, 96)))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // implicitly return (r, s, v)<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>&nbsp;</p>
