---
layout: post
title: "solidity--library  ABI decode"
date: "2022-07-21"
categories: 
---
<p>&nbsp;</p>

<p>Libraries are similar to contracts, but you can&#39;t declare any state variable and you can&#39;t send ether.</p>

<p>A library is embedded into the contract if all library functions are internal.</p>

<p>Otherwise the library must be deployed and then linked before the contract is deployed.</p>

<p><font style="vertical-align:inherit">库类似于合约，但你不能声明任何状态变量和 你不能发送以太币。 </font></p>

<p><font style="vertical-align:inherit">如果所有库函数都是内部的，则将库嵌入到合约中。 </font></p>

<p><font style="vertical-align:inherit">否则，必须先部署库，然后在部署合约之前进行链接。 </font></p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>library SafeMath {<br />
&nbsp;&nbsp;&nbsp; function add(uint x, uint y) internal pure returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint z = x + y;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require(z &gt;= x, &quot;uint overflow&quot;);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return z;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>library Math {<br />
&nbsp;&nbsp;&nbsp; function sqrt(uint y) internal pure returns (uint z) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (y &gt; 3) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; z = y;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint x = y / 2 + 1;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (x &lt; z) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; z = x;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x = (y / x + x) / 2;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (y != 0) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; z = 1;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // else z = 0 (default value)<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>contract TestSafeMath {<br />
&nbsp;&nbsp;&nbsp; using SafeMath for uint;</p>

<p>&nbsp;&nbsp;&nbsp; uint public MAX_UINT = 2**256 - 1;</p>

<p>&nbsp;&nbsp;&nbsp; function testAdd(uint x, uint y) public pure returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return x.add(y);<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function testSquareRoot(uint x) public pure returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Math.sqrt(x);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>// Array function to delete element at index and re-organize the array<br />
// so that their are no gaps between the elements.<br />
library Array {<br />
&nbsp;&nbsp;&nbsp; function remove(uint[] storage arr, uint index) public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Move the last element into the place to delete<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require(arr.length &gt; 0, &quot;Can&#39;t remove from empty array&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr[index] = arr[arr.length - 1];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr.pop();<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>contract TestArray {<br />
&nbsp;&nbsp;&nbsp; using Array for uint[];</p>

<p>&nbsp;&nbsp;&nbsp; uint[] public arr;</p>

<p>&nbsp;&nbsp;&nbsp; function testArrayRemove() public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (uint i = 0; i &lt; 3; i++) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr.push(i);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr.remove(1);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr.length == 2);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[0] == 0);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(arr[1] == 2);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>{% highlight %}abi.encode{% endhighlight %} encodes data into {% highlight %}bytes{% endhighlight %}.</p>

<p>{% highlight %}abi.decode{% endhighlight %} decodes {% highlight %}bytes{% endhighlight %} back into data.</p>

<p>abi.encode 将数据编码为字节。</p>

<p>&nbsp;abi.decode 将字节解码回数据。</p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract AbiDecode {<br />
&nbsp;&nbsp;&nbsp; struct MyStruct {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string name;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint[2] nums;<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function encode(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint x,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address addr,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint[] calldata arr,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MyStruct calldata myStruct<br />
&nbsp;&nbsp;&nbsp; ) external pure returns (bytes memory) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return abi.encode(x, addr, arr, myStruct);<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function decode(bytes calldata data)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; external<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pure<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; returns (<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint x,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address addr,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint[] memory arr,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MyStruct memory myStruct<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // (uint x, address addr, uint[] memory arr, MyStruct myStruct) = ...<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>

