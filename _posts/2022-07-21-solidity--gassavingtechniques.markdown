---
layout: post
title: "solidity--Gas Saving Techniques"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/gas-golf/</p>

<p><font style="vertical-align:inherit">一些节气技术。 </font></p>

<ul>
	<li><font style="vertical-align:inherit">更换 </font><code>memory</code><font style="vertical-align:inherit">和 </font><code>calldata</code></li>
	<li><font style="vertical-align:inherit">将状态变量加载到内存 </font></li>
	<li><font style="vertical-align:inherit">替换 for 循环 </font><code>i++</code><font style="vertical-align:inherit">和 </font><code>++i</code></li>
	<li><font style="vertical-align:inherit">缓存数组元素 </font></li>
	<li><font style="vertical-align:inherit">短路 </font></li>
</ul>

<p>Some gas saving techniques.</p>

<ul>
	<li>Replacing <code>memory</code> with <code>calldata</code></li>
	<li>Loading state variable to memory</li>
	<li>Replace for loop <code>i++</code> with <code>++i</code></li>
	<li>Caching array elements</li>
	<li>Short circuit</li>
</ul>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>// gas golf<br />
contract GasGolf {<br />
&nbsp;&nbsp;&nbsp; // start - 50908 gas<br />
&nbsp;&nbsp;&nbsp; // use calldata - 49163 gas<br />
&nbsp;&nbsp;&nbsp; // load state variables to memory - 48952 gas<br />
&nbsp;&nbsp;&nbsp; // short circuit - 48634 gas<br />
&nbsp;&nbsp;&nbsp; // loop increments - 48244 gas<br />
&nbsp;&nbsp;&nbsp; // cache array length - 48209 gas<br />
&nbsp;&nbsp;&nbsp; // load array elements to memory - 48047 gas<br />
&nbsp;&nbsp;&nbsp; // uncheck i overflow/underflow - 47309 gas</p>

<p>&nbsp;&nbsp;&nbsp; uint public total;</p>

<p>&nbsp;&nbsp;&nbsp; // start - not gas optimized<br />
&nbsp;&nbsp;&nbsp; // function sumIfEvenAndLessThan99(uint[] memory nums) external {<br />
&nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp;&nbsp; for (uint i = 0; i &lt; nums.length; i += 1) {<br />
&nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool isEven = nums[i] % 2 == 0;<br />
&nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool isLessThan99 = nums[i] &lt; 99;<br />
&nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (isEven &amp;&amp; isLessThan99) {<br />
&nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total += nums[i];<br />
&nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; // }</p>

<p>&nbsp;&nbsp;&nbsp; // gas optimized<br />
&nbsp;&nbsp;&nbsp; // [1, 2, 3, 4, 5, 100]<br />
&nbsp;&nbsp;&nbsp; function sumIfEvenAndLessThan99(uint[] calldata nums) external {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint _total = total;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint len = nums.length;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (uint i = 0; i &lt; len; ) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint num = nums[i];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num % 2 == 0 &amp;&amp; num &lt; 99) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _total += num;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unchecked {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++i;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total = _total;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>

