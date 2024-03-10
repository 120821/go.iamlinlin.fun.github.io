---
layout: post
title: "solidity--call"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/call/</p>
<p>call is a low level function to interact with other contracts.</p>
<p>This is the recommended method to use when you&#39;re just sending Ether via calling the fallback function.</p>
<p>However it is not the recommend way to call existing functions.</p>
<p>call 是与其他合约交互的低级函数。</p>
<p>&nbsp;当您只是通过调用回退函数发送以太币时，这是推荐的方法。</p>
<p>&nbsp;但是，这不是调用现有函数的推荐方法。</p>
<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>
<p>contract Receiver {<br />
&nbsp;&nbsp;&nbsp; event Received(address caller, uint amount, string message);</p>
<p>&nbsp;&nbsp;&nbsp; fallback() external payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Received(msg.sender, msg.value, &quot;Fallback was called&quot;);<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; function foo(string memory _message, uint _x) public payable returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Received(msg.sender, msg.value, _message);</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return _x + 1;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>contract Caller {<br />
&nbsp;&nbsp;&nbsp; event Response(bool success, bytes data);</p>
<p>&nbsp;&nbsp;&nbsp; // Let&#39;s imagine that contract B does not have the source code for<br />
&nbsp;&nbsp;&nbsp; // contract A, but we do know the address of A and the function to call.<br />
&nbsp;&nbsp;&nbsp; function testCallFoo(address payable _addr) public payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // You can send ether and specify a custom gas amount<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abi.encodeWithSignature(&quot;foo(string,uint256)&quot;, &quot;call foo&quot;, 123)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Response(success, data);<br />
&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; // Calling a function that does not exist triggers the fallback function.<br />
&nbsp;&nbsp;&nbsp; function testCallDoesNotExist(address _addr) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (bool success, bytes memory data) = _addr.call(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abi.encodeWithSignature(&quot;doesNotExist()&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Response(success, data);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>&nbsp;</p>
