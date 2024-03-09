---
layout: post
title: "solidity--function selector"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/function-selector/</p>

<p>When a function is called, the first 4 bytes of {% highlight %}calldata{% endhighlight %} specifies which function to call.</p>

<p>This 4 bytes is called a function selector.</p>

<p>Take for example, this code below. It uses {% highlight %}call{% endhighlight %} to execute {% highlight %}transfer{% endhighlight %} on a contract at the address {% highlight %}addr{% endhighlight %}.</p>

<p><font style="vertical-align:inherit">调用函数时，前 4 个字节 </font>{% highlight %}calldata{% endhighlight %}<font style="vertical-align:inherit">指定要调用的函数。 </font></p>

<p><font style="vertical-align:inherit">这 4 个字节称为函数选择器。 </font></p>

<p>The first 4 bytes returned from {% highlight %}abi.encodeWithSignature(....){% endhighlight %} is the function selector.</p>

<p>Perhaps you can save a tiny amount of gas if you precompute and inline the function selector in your code?</p>

<p>Here is how the function selector is computed.</p>

<p><font style="vertical-align:inherit">例如，下面的这段代码。 它用 </font>{% highlight %}call{% endhighlight %}<font style="vertical-align:inherit">执行 </font>{% highlight %}transfer{% endhighlight %}<font style="vertical-align:inherit">在地址的合同上 </font>{% highlight %}addr{% endhighlight %}<font style="vertical-align:inherit">. </font></p>

<p>addr.call(abi.encodeWithSignature(&quot;transfer(address,uint256)&quot;, 0xSomeAddress, 123))</p>

<p><font style="vertical-align:inherit">从返回的前 4 个字节 </font>{% highlight %}abi.encodeWithSignature(....){% endhighlight %}<font style="vertical-align:inherit">是功能选择器。 </font></p>

<p><font style="vertical-align:inherit">如果您在代码中预先计算并内联函数选择器，也许您可​​以节省少量气体？ </font></p>

<p><font style="vertical-align:inherit">以下是函数选择器的计算方式。 </font></p>

<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>

<p>contract FunctionSelector {<br />
&nbsp;&nbsp;&nbsp; /*<br />
&nbsp;&nbsp;&nbsp; &quot;transfer(address,uint256)&quot;<br />
&nbsp;&nbsp;&nbsp; 0xa9059cbb<br />
&nbsp;&nbsp;&nbsp; &quot;transferFrom(address,address,uint256)&quot;<br />
&nbsp;&nbsp;&nbsp; 0x23b872dd<br />
&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; function getSelector(string calldata _func) external pure returns (bytes4) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return bytes4(keccak256(bytes(_func)));<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>

<p>&nbsp;</p>

