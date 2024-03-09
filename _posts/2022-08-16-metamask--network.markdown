---
layout: post
title: "metamask --network自动切换  内置网络与外置网络"
date: "2022-08-16"
categories: 
---
<p><a href="http://siwei.me/blog/posts/blockchain-metamask">自动切换网络</a>&nbsp; <a href="https://docs.metamask.io/guide/rpc-api.html#unrestricted-methods">https://docs.metamask.io/guide/rpc-api.html#unrestricted-methods</a></p>

<p>&ldquo;内部网络一般叫局域网,只是一个单位或企业内部电脑之间进行通讯。 外部网络一般指互联网或广域网,就是本单位的电脑资料可以和其他地方的人员共享,也可以访问其他地方的其他人的电脑资料。可以进行实时通讯。&rdquo;</p>

<p>1. switchEthereumChain 只能切换内置网络</p>

<p>2. addEthereumChain 用来新增外部网络，并且切换。（不能用于内置网络）</p>

<p>下面是完整代码 （记得替换里面的erb tag）</p>

<pre class="hljs cs">
 window.onload = <span class="hljs-function"><span class="hljs-keyword">async</span> <span class="hljs-title">function</span><span class="hljs-params">()</span></span>{
      <span class="hljs-keyword">if</span>(window.ethereum) {
        window.ethereum.request({method: <span class="hljs-string">&#39;eth_requestAccounts&#39;</span>})
        <span class="hljs-keyword">let</span> network_id = &lt;%= @contract.network.chain_id rescue <span class="hljs-number">0</span> %&gt;

        <span class="hljs-comment">// 对于内置网络，直接切换</span>
        <span class="hljs-keyword">if</span>([<span class="hljs-number">1</span>,<span class="hljs-number">3</span>,<span class="hljs-number">4</span>,<span class="hljs-number">5</span>,<span class="hljs-number">42</span>].includes(network_id)) {
          <span class="hljs-keyword">await</span> ethereum.request({
            method: <span class="hljs-string">&#39;wallet_switchEthereumChain&#39;</span>,
            <span class="hljs-keyword">params</span>: [{ chainId: <span class="hljs-string">&quot;0x&quot;</span> + network_id.toString(<span class="hljs-number">16</span>) }]
          })

        <span class="hljs-comment">// 否则就添加</span>
        }<span class="hljs-keyword">else</span>{
          <span class="hljs-keyword">await</span> window.ethereum.request({
            method: <span class="hljs-string">&#39;wallet_addEthereumChain&#39;</span>,
              <span class="hljs-keyword">params</span>: [{
                chainId: <span class="hljs-string">&#39;0x&lt;%= @contract.network.try(:chain_id).to_s(16) %&gt;&#39;</span>,
                chainName: <span class="hljs-string">&quot;&lt;%= @contract.network.try(:name) %&gt;&quot;</span>,
                nativeCurrency: {
                  name: <span class="hljs-string">&quot;&lt;%= @contract.network.try(:native_currency_name) %&gt;&quot;</span>,
                  symbol: <span class="hljs-string">&quot;&lt;%= @contract.network.try(:native_currency_symbol) %&gt;&quot;</span>,
                  decimals: &lt;%= @contract.network.<span class="hljs-keyword">try</span>(:native_currency_decimals) %&gt;
                },
                rpcUrls: [<span class="hljs-string">&#39;&lt;%= @contract.network.try(:rpc_server) %&gt;&#39;</span>],
              }]
          })
        }
      }
    }{% endhighlight %}

