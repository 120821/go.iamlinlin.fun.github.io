---
layout: post
title: "JavaScript初始化加载的3种方式"
date: "2022-07-16"
categories: 
---
<p>参考https://blog.csdn.net/DengJH_Business/article/details/32107303</p>

<p>第一种</p>

<p>&lt;script language=javascript type=&quot;text/javascript&quot;&gt;<br />
//固定写法<br />
window.onload = function(){<br />
&nbsp;&nbsp;&nbsp; alert(&quot;JS初始化加载&quot;);<br />
}<br />
&lt;/script&gt;</p>

<p>用于切换metamask的网络</p>

<p>window.onload = function(){</p>

<pre class="kd ke kf kg ga kh bt ki">
<span class="gj kj kk ii kl b do km kn l ko" data-selectable-paragraph="" id="7161">if(window.ethereum) {
  window.web3 = new  Web3(window.ethereum)
  window.ethereum.request({method: &#39;eth_requestAccounts&#39;})
  window.ethereum.request({
    method: &#39;wallet_addEthereumChain&#39;,
    params: [{chainId: &#39;0xa869&#39;,
      chainName: &quot;Fuji Testnet&quot;,
      nativeCurrency: {
        name: &quot;AVAX&quot;,
        symbol: &quot;AVAX&quot;,
        decimals: 18
      },
      rpcUrls: [&#39;https://api.avax-test.network/ext/bc/C/rpc&#39;],     blockExplorerUrls: [&#39;https://cchain.explorer.avax-test.network/&#39;]
}]
})
}}</span></pre>

<p>第二种&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;script language=javascript type=&quot;text/javascript&quot;&gt;<br />
//方法名自定义<br />
function init(){<br />
&nbsp;&nbsp;&nbsp; alert(&quot;JS初始化加载&quot;);<br />
}<br />
&lt;/script&gt;<br />
&lt;/head&gt;<br />
&nbsp;<br />
&lt;body &omicron;nl&omicron;ad=&quot;init()&quot;&gt;<br />
&lt;/body&gt;<br />
&nbsp;<br />
&lt;/html&gt;</p>

<p>第三种</p>

<p>&lt;script language=javascript type=&quot;text/javascript&quot;&gt;<br />
//方法名自定义<br />
init();<br />
&nbsp;<br />
//方法名要一致<br />
function init(){<br />
&nbsp;&nbsp;&nbsp; alert(&quot;JS初始化加载&quot;);<br />
}<br />
&lt;/script&gt;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

