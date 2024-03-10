---
layout: post
title: "solidity--delegatecall"
date: "2022-07-21"
categories: 
---
<p>https://solidity-by-example.org/delegatecall/</p>
<p>{% highlight html %}delegatecall{% endhighlight %} is a low level function similar to {% highlight html %}call{% endhighlight %}.</p>
<p>When contract {% highlight html %}A{% endhighlight %} executes {% highlight html %}delegatecall{% endhighlight %} to contract {% highlight html %}B{% endhighlight %}, {% highlight html %}B{% endhighlight %}&#39;s code is executed</p>
<p>with contract {% highlight html %}A{% endhighlight %}&#39;s storage, {% highlight html %}msg.sender{% endhighlight %} and {% highlight html %}msg.value{% endhighlight %}.</p>
<p>{% highlight html %}delegatecall{% endhighlight %}<font style="vertical-align:inherit">是一个低级函数，类似于 </font>{% highlight html %}call{% endhighlight %}<font style="vertical-align:inherit">. </font></p>
<p><font style="vertical-align:inherit">签约时 </font>{% highlight html %}A{% endhighlight %}<font style="vertical-align:inherit">执行 </font>{% highlight html %}delegatecall{% endhighlight %}<font style="vertical-align:inherit">合同 </font>{% highlight html %}B{% endhighlight %}<font style="vertical-align:inherit">, </font>{% highlight html %}B{% endhighlight %}<font style="vertical-align:inherit">的代码被执行 </font></p>
<p><font style="vertical-align:inherit">有合同 </font>{% highlight html %}A{% endhighlight %}<font style="vertical-align:inherit">的存储， </font>{% highlight html %}msg.sender{% endhighlight %}<font style="vertical-align:inherit">和 </font>{% highlight html %}msg.value{% endhighlight %}<font style="vertical-align:inherit">. </font></p>
<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>
<p>// NOTE: Deploy this contract first<br />
contract B {<br />
&nbsp;&nbsp;&nbsp; // NOTE: storage layout must be the same as contract A<br />
&nbsp;&nbsp;&nbsp; uint public num;<br />
&nbsp;&nbsp;&nbsp; address public sender;<br />
&nbsp;&nbsp;&nbsp; uint public value;</p>
<p>&nbsp;&nbsp;&nbsp; function setVars(uint _num) public payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num = _num;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sender = msg.sender;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value = msg.value;<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>contract A {<br />
&nbsp;&nbsp;&nbsp; uint public num;<br />
&nbsp;&nbsp;&nbsp; address public sender;<br />
&nbsp;&nbsp;&nbsp; uint public value;</p>
<p>&nbsp;&nbsp;&nbsp; function setVars(address _contract, uint _num) public payable {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // A&#39;s storage is set, B is not modified.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (bool success, bytes memory data) = _contract.delegatecall(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abi.encodeWithSignature(&quot;setVars(uint256)&quot;, _num)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>&nbsp;</p>
