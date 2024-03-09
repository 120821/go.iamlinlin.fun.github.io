---
layout: post
title: "solidity--fallback"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/fallback/</p>

<p>fallback is a function that takes no arguments and returns nothing.</p>

<p>&nbsp;It executes when a function that does not exist or ether is sent directly to the contract, but receive() does not exist or msg.data is not empty fallback is called with a limit of 2300 gas when transfer or send is called.</p>

<p>{% highlight %}fallback{% endhighlight %}<font style="vertical-align:inherit">是一个不接受任何参数且不返回任何内容的函数。 </font></p>

<p><font style="vertical-align:inherit">它在何时执行 </font></p>

<ul>
	<li>
	<p><font style="vertical-align:inherit">调用不存在的函数或 </font></p>
	</li>
	<li>
	<p><font style="vertical-align:inherit">以太币直接发送到合约，但 </font>{% highlight %}receive(){% endhighlight %}<font style="vertical-align:inherit">不存在或 </font>{% highlight %}msg.data{% endhighlight %}<font style="vertical-align:inherit">不为空 </font></p>
	</li>
</ul>

<p>{% highlight %}fallback{% endhighlight %}<font style="vertical-align:inherit">被调用时有 2300 气体限制 </font>{% highlight %}transfer{% endhighlight %}<font style="vertical-align:inherit">或者 </font>{% highlight %}send{% endhighlight %}<font style="vertical-align:inherit">. </font></p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract Fallback {<br />
&nbsp;&nbsp;&nbsp; event Log(uint gas);</p>

<p>&nbsp;&nbsp;&nbsp; // Fallback function must be declared as external.<br />
&nbsp;&nbsp;&nbsp; fallback() external payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // send / transfer (forwards 2300 gas to this fallback function)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // call (forwards all of the gas)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; emit Log(gasleft());<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; // Helper function to check the balance of this contract<br />
&nbsp;&nbsp;&nbsp; function getBalance() public view returns (uint) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return address(this).balance;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>contract SendToFallback {<br />
&nbsp;&nbsp;&nbsp; function transferToFallback(address payable _to) public payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _to.transfer(msg.value);<br />
&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; function callFallback(address payable _to) public payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (bool sent, ) = _to.call{value: msg.value}(&quot;&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require(sent, &quot;Failed to send Ether&quot;);<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>

