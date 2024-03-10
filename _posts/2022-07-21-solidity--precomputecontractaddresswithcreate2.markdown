---
layout: post
title: "solidity--Precompute Contract Address with Create2"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/app/create2/</p>
<p>Contract address can be precomputed, before the contract is deployed, using {% highlight html %}create2{% endhighlight %}</p>
<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>
<p>contract Factory {<br />
&nbsp;&nbsp;&nbsp; // Returns the address of the newly deployed contract<br />
&nbsp;&nbsp;&nbsp; function deploy(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address _owner,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint _foo,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes32 _salt<br />
&nbsp;&nbsp;&nbsp; ) public payable returns (address) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // This syntax is a newer way to invoke create2 without assembly, you just need to pass salt<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // https://docs.soliditylang.org/en/latest/control-structures.html#salted-contract-creations-create2<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return address(new TestContract{salt: _salt}(_owner, _foo));<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>// This is the older way of doing it using assembly<br />
contract FactoryAssembly {<br />
&nbsp;&nbsp;&nbsp; event Deployed(address addr, uint salt);</p>
<p>&nbsp;&nbsp;&nbsp; // 1. Get bytecode of contract to be deployed<br />
&nbsp;&nbsp;&nbsp; // NOTE: _owner and _foo are arguments of the TestContract&#39;s constructor<br />
&nbsp;&nbsp;&nbsp; function getBytecode(address _owner, uint _foo) public pure returns (bytes memory) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes memory bytecode = type(TestContract).creationCode;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return abi.encodePacked(bytecode, abi.encode(_owner, _foo));<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; // 2. Compute the address of the contract to be deployed<br />
&nbsp;&nbsp;&nbsp; // NOTE: _salt is a random number used to create an address<br />
&nbsp;&nbsp;&nbsp; function getAddress(bytes memory bytecode, uint _salt)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; view<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; returns (address)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bytes32 hash = keccak256(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abi.encodePacked(bytes1(0xff), address(this), _salt, keccak256(bytecode))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // NOTE: cast last 20 bytes of hash to address<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return address(uint160(uint(hash)));<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; // 3. Deploy the contract<br />
&nbsp;&nbsp;&nbsp; // NOTE:<br />
&nbsp;&nbsp;&nbsp; // Check the event log Deployed which contains the address of the deployed TestContract.<br />
&nbsp;&nbsp;&nbsp; // The address in the log should equal the address computed from above.<br />
&nbsp;&nbsp;&nbsp; function deploy(bytes memory bytecode, uint _salt) public payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address addr;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOTE: How to call create2</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create2(v, p, n, s)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create new contract with code at memory p to p + n<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and send v wei<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and return the new address<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; where new address = first 20 bytes of keccak256(0xff + address(this) + s + keccak256(mem[p&hellip;(p+n)))<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s = big-endian 256-bit value<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assembly {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr := create2(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; callvalue(), // wei sent with current call<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Actual code starts after skipping the first 32 bytes<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add(bytecode, 0x20),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mload(bytecode), // Load the size of code contained in the first 32 bytes<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _salt // Salt from function arguments<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if iszero(extcodesize(addr)) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; revert(0, 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Deployed(addr, _salt);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>contract TestContract {<br />
&nbsp;&nbsp;&nbsp; address public owner;<br />
&nbsp;&nbsp;&nbsp; uint public foo;</p>
<p>&nbsp;&nbsp;&nbsp; constructor(address _owner, uint _foo) payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; owner = _owner;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foo = _foo;<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; function getBalance() public view returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return address(this).balance;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>&nbsp;</p>
