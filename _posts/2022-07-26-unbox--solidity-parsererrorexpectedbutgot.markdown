---
layout: post
title: "尽量不使用unbox--Solidity - ParserError: Expected ';' but got '['"
date: "2022-07-26"
categories: 
---
<p>https://my.oschina.net/weichou/blog/5545510</p>

<p>truffle compile</p>

<p>Compiling your contracts...<br />
===========================<br />
&gt; Compiling ./contracts/First.sol<br />
&gt; Compiling ./contracts/Migrations.sol<br />
&gt; Compiling ./contracts/Second.sol</p>

<p>CompileError: ParserError: Expected &#39;;&#39; but got &#39;public&#39;<br />
&nbsp; --&gt; project:/contracts/Second.sol:13:9:<br />
&nbsp;&nbsp; |<br />
13 |&nbsp;&nbsp;&nbsp;&nbsp; int public _data;<br />
&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^</p>

<div class="article-detail">
<div class="content">
<p>执行命令：</p>

<pre class="hljs yaml">
<code class="language-Bash"><span class="hljs-string">&gt;</span> <span class="hljs-string">truffle</span> <span class="hljs-string">unbox</span> <span class="hljs-string">xxx</span>

<span class="hljs-string">Starting</span> <span class="hljs-string">unbox...</span>
<span class="hljs-string">=================</span>

<span class="hljs-string">✓</span> <span class="hljs-string">Preparing</span> <span class="hljs-string">to</span> <span class="hljs-string">download</span> <span class="hljs-string">box</span>
<span class="hljs-string">✖</span> <span class="hljs-string">Downloading</span>
<span class="hljs-string">Unbox</span> <span class="hljs-string">failed!</span>
<span class="hljs-attr">Error:</span> <span class="hljs-string">connect</span> <span class="hljs-string">ECONNREFUSED</span> <span class="hljs-number">0.0</span><span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-string">:443</span>
    <span class="hljs-string">at</span> <span class="hljs-string">TCPConnectWrap.afterConnect</span> <span class="hljs-string">[as</span> <span class="hljs-string">oncomplete]</span> <span class="hljs-string">(node:net:1187:16)</span>
<span class="hljs-string">Truffle</span> <span class="hljs-string">v5.5.19</span> <span class="hljs-string">(core:</span> <span class="hljs-number">5.5</span><span class="hljs-number">.19</span><span class="hljs-string">)</span>
<span class="hljs-string">Node</span> <span class="hljs-string">v16.15.1</span>

{% endhighlight %}

<p>真实原因是：</p>

<ul>
	<li>无法访问 {% highlight %}github{% endhighlight %}。</li>
</ul>

<p>解决方法：</p>

<ul>
	<li>设置代理</li>
</ul>

<pre class="hljs nginx">
<code class="language-Bash"><span class="hljs-comment"># 地址和端口号改为你自己的</span>
<span class="hljs-attribute">export</span> https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://<span class="hljs-number">127.0.0.1:7890</span>
{% endhighlight %}

<p>再次运行，成功。</p>

<pre class="hljs yaml">
<code class="language-Bash"><span class="hljs-string">truffle</span> <span class="hljs-string">unbox</span> <span class="hljs-string">xxx</span>                                                                                     

<span class="hljs-string">Starting</span> <span class="hljs-string">unbox...</span>
<span class="hljs-string">=================</span>

<span class="hljs-string">✓</span> <span class="hljs-string">Preparing</span> <span class="hljs-string">to</span> <span class="hljs-string">download</span> <span class="hljs-string">box</span>
<span class="hljs-string">✓</span> <span class="hljs-string">Downloading</span>
<span class="hljs-string">✓</span> <span class="hljs-string">Cleaning</span> <span class="hljs-string">up</span> <span class="hljs-string">temporary</span> <span class="hljs-string">files</span>
<span class="hljs-string">✓</span> <span class="hljs-string">Setting</span> <span class="hljs-string">up</span> <span class="hljs-string">box</span>

<span class="hljs-string">Unbox</span> <span class="hljs-string">successful,</span> <span class="hljs-string">sweet!</span>

<span class="hljs-attr">Commands:</span>

  <span class="hljs-attr">Compile contracts:</span> <span class="hljs-string">truffle</span> <span class="hljs-string">compile</span>
  <span class="hljs-attr">Migrate contracts:</span> <span class="hljs-string">truffle</span> <span class="hljs-string">migrate</span>
  <span class="hljs-attr">Test contracts:</span>    <span class="hljs-string">truffle</span> <span class="hljs-string">test</span>
{% endhighlight %}

<p>{% highlight %}无用，不能执行到最后{% endhighlight %}</p>

<p>linlin@linlin-i5:/workspace/blockchain/contract_on_goerli_using_infura$ truffle unbox webpack<br />
This directory is non-empty...<br />
? Proceed anyway? (Y/n)<br />
Starting unbox...<br />
=================</p>

<p>? Proceed anyway? Yes<br />
✓ Preparing to download box<br />
✖ Downloading<br />
Unbox failed!<br />
Error: connect ECONNREFUSED 0.0.0.0:443<br />
&nbsp;&nbsp;&nbsp; at TCPConnectWrap.afterConnect [as oncomplete] (node:net:1161:16)<br />
Truffle v5.5.23 (core: 5.5.23)<br />
Node v16.13.2</p>
</div>
</div>

