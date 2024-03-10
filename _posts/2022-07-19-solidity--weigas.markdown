---
layout: post
title: "solidity 语法--以太和wei Gas"
date: "2022-07-19"
categories: 
---
<p>交易是用以太币支付的。 类似于 1 美元等于 100 美分，1 以太币等于 10的18次方 wei。</p>
<p>Transactions are paid with {% highlight html %}ether{% endhighlight %}.</p>
<p>Similar to how one dollar is equal to 100 cent, one {% highlight html %}ether{% endhighlight %} is equal to 10<sup>18</sup> {% highlight html %}wei{% endhighlight %}.</p>
<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>
<p>contract EtherUnits {<br />
&nbsp;&nbsp;&nbsp; uint public oneWei = 1 wei;<br />
&nbsp;&nbsp;&nbsp; // 1 wei is equal to 1<br />
&nbsp;&nbsp;&nbsp; bool public isOneWei = 1 wei == 1;</p>
<p>&nbsp;&nbsp;&nbsp; uint public oneEther = 1 ether;<br />
&nbsp;&nbsp;&nbsp; // 1 ether is equal to 10^18 wei<br />
&nbsp;&nbsp;&nbsp; bool public isOneEther = 1 ether == 1e18;<br />
}</p>
<p>Gas:你需要为一笔交易支付多少以太币？ 你支付的 gas 花费 * gas price 的以太币数量，其中 气体是计算单位 消耗的气体是交易中使用的气体总量 汽油价格是您愿意为每种汽油支付多少以太币 具有较高gas价格的交易具有更高的优先级被包含在一个块中。</p>
<ul>
<li>{% highlight html %}gas{% endhighlight %} is a unit of computation</li>
<li>{% highlight html %}gas spent{% endhighlight %} is the total amount of {% highlight html %}gas{% endhighlight %} used in a transaction</li>
<li>{% highlight html %}gas price{% endhighlight %} is how much {% highlight html %}ether{% endhighlight %} you are willing to pay per {% highlight html %}gas{% endhighlight %}</li>
<li>{% highlight html %}gas limit{% endhighlight %} (max amount of gas you&#39;re willing to use for your transaction, set by you)</li>
<li>{% highlight html %}block gas limit{% endhighlight %} (max amount of gas allowed in a block, set by the network)</li>
</ul>
<p>// SPDX-License-Identifier: MIT<br />
pragma solidity ^0.8.13;</p>
<p>contract Gas {<br />
&nbsp;&nbsp;&nbsp; uint public i = 0;</p>
<p>&nbsp;&nbsp;&nbsp; // Using up all of the gas that you send causes your transaction to fail.<br />
&nbsp;&nbsp;&nbsp; // State changes are undone.<br />
&nbsp;&nbsp;&nbsp; // Gas spent are not refunded.<br />
&nbsp;&nbsp;&nbsp; function forever() public {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Here we run a loop until all of the gas are spent<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // and the transaction fails<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (true) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i += 1;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }<br />
}</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
