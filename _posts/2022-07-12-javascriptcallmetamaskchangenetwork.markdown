---
layout: post
title: "JavaScript call metamask change network"
date: "2022-07-12"
categories: 
---
<p>参考：https://stackoverflow.com/questions/67597665/how-to-change-network-in-metamask-using-react-js</p>

<div class="s-prose js-post-body" itemprop="text">
<p>What if the user doesn&#39;t have the required network added? Here is an expanded version which tries to switch, otherwise add the network to MetaMask:</p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript"><span class="hljs-keyword">const</span> chainId = <span class="hljs-number">137</span> <span class="hljs-comment">// Polygon Mainnet</span>

<span class="hljs-keyword">if</span> (<span class="hljs-variable language_">window</span>.<span class="hljs-property">ethereum</span>.<span class="hljs-property">networkVersion</span> !== chainId) {
      <span class="hljs-keyword">try</span> {
        <span class="hljs-keyword">await</span> <span class="hljs-variable language_">window</span>.<span class="hljs-property">ethereum</span>.<span class="hljs-title function_">request</span>({
          <span class="hljs-attr">method</span>: <span class="hljs-string">&#39;wallet_switchEthereumChain&#39;</span>,
          <span class="hljs-attr">params</span>: [{ <span class="hljs-attr">chainId</span>: web3.<span class="hljs-property">utils</span>.<span class="hljs-title function_">toHex</span>(chainId) }]
        });
      } <span class="hljs-keyword">catch</span> (err) {
          <span class="hljs-comment">// This error code indicates that the chain has not been added to MetaMask</span>
        <span class="hljs-keyword">if</span> (err.<span class="hljs-property">code</span> === <span class="hljs-number">4902</span>) {
          <span class="hljs-keyword">await</span> <span class="hljs-variable language_">window</span>.<span class="hljs-property">ethereum</span>.<span class="hljs-title function_">request</span>({
            <span class="hljs-attr">method</span>: <span class="hljs-string">&#39;wallet_addEthereumChain&#39;</span>,
            <span class="hljs-attr">params</span>: [
              {
                <span class="hljs-attr">chainName</span>: <span class="hljs-string">&#39;Polygon Mainnet&#39;</span>,
                <span class="hljs-attr">chainId</span>: web3.<span class="hljs-property">utils</span>.<span class="hljs-title function_">toHex</span>(chainId),
                <span class="hljs-attr">nativeCurrency</span>: { <span class="hljs-attr">name</span>: <span class="hljs-string">&#39;MATIC&#39;</span>, <span class="hljs-attr">decimals</span>: <span class="hljs-number">18</span>, <span class="hljs-attr">symbol</span>: <span class="hljs-string">&#39;MATIC&#39;</span> },
                <span class="hljs-attr">rpcUrls</span>: [<span class="hljs-string">&#39;https://polygon-rpc.com/&#39;</span>]
              }
            ]
          });
        }
      }
    }
{% endhighlight %}
</div>

