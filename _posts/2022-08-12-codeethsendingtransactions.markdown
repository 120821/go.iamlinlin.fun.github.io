---
layout: post
title: "code发送ETH  Sending Transactions"
date: "2022-08-12"
categories: 
---
<p><a href="https://docs.metamask.io/guide/sending-transactions.html">https://docs.metamask.io/guide/sending-transactions.html</a></p>

<p><font style="vertical-align:inherit">交易是区块链上的正式行动。 它们总是在 MetaMask 中通过调用 </font>{% highlight %}eth_sendTransaction{% endhighlight %}<font style="vertical-align:inherit">方法。 它们可能涉及简单的以太币发送，可能导致发送代币、创建新的智能合约或以多种方式更改区块链上的状态。 它们总是由来自 </font><em><font style="vertical-align:inherit">外部帐户 </font></em><font style="vertical-align:inherit">或简单的密钥对启动。 </font></p>

<p><font style="vertical-align:inherit">在 MetaMask 中，使用 </font>{% highlight %}ethereum.request{% endhighlight %}<font style="vertical-align:inherit">直接方法，发送交易将涉及组成这样的选项对象： </font></p>

<p><font style="vertical-align:inherit">html:</font></p>

<section class="tabs-component-panel" id="html" role="tabpanel" style="">
<div class="language-html extra-class">
<pre class="language-html">
{% highlight %}<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>button</span> <span class="token attr-name">class</span><span class="token attr-value"><span class="token punctuation attr-equals">=</span><span class="token punctuation">&quot;</span>enableEthereumButton btn<span class="token punctuation">&quot;</span></span><span class="token punctuation">&gt;</span></span>Enable Ethereum<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>button</span><span class="token punctuation">&gt;</span></span>
<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>button</span> <span class="token attr-name">class</span><span class="token attr-value"><span class="token punctuation attr-equals">=</span><span class="token punctuation">&quot;</span>sendEthButton btn<span class="token punctuation">&quot;</span></span><span class="token punctuation">&gt;</span></span>Send Eth<span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>button</span><span class="token punctuation">&gt;</span></span>
{% endhighlight %}

<p>js:</p>
</div>
</section>

<div class="language-javascript extra-class">
<pre class="language-javascript">
{% highlight %}<span class="token keyword">const</span> transactionParameters <span class="token operator">=</span> <span class="token punctuation">{</span>
  <span class="token literal-property property">nonce</span><span class="token operator">:</span> <span class="token string">&#39;0x00&#39;</span><span class="token punctuation">,</span> <span class="token comment">// ignored by MetaMask</span>
  <span class="token literal-property property">gasPrice</span><span class="token operator">:</span> <span class="token string">&#39;0x09184e72a000&#39;</span><span class="token punctuation">,</span> <span class="token comment">// customizable by user during MetaMask confirmation.</span>
  <span class="token literal-property property">gas</span><span class="token operator">:</span> <span class="token string">&#39;0x2710&#39;</span><span class="token punctuation">,</span> <span class="token comment">// customizable by user during MetaMask confirmation.</span>
  <span class="token literal-property property">to</span><span class="token operator">:</span> <span class="token string">&#39;0x0000000000000000000000000000000000000000&#39;</span><span class="token punctuation">,</span> <span class="token comment">// Required except during contract publications.</span>
  <span class="token literal-property property">from</span><span class="token operator">:</span> ethereum<span class="token punctuation">.</span>selectedAddress<span class="token punctuation">,</span> <span class="token comment">// must match user&#39;s active address.</span>
  <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&#39;0x00&#39;</span><span class="token punctuation">,</span> <span class="token comment">// Only required to send ether to the recipient from the initiating external account.</span>
  <span class="token literal-property property">data</span><span class="token operator">:</span>
    <span class="token string">&#39;0x7f7465737432000000000000000000000000000000000000000000000000000000600057&#39;</span><span class="token punctuation">,</span> <span class="token comment">// Optional, but used for defining smart contract creation and interaction.</span>
  <span class="token literal-property property">chainId</span><span class="token operator">:</span> <span class="token string">&#39;0x3&#39;</span><span class="token punctuation">,</span> <span class="token comment">// Used to prevent transaction reuse across blockchains. Auto-filled by MetaMask.</span>
<span class="token punctuation">}</span><span class="token punctuation">;</span>

<span class="token comment">// txHash is a hex string</span>
<span class="token comment">// As with any RPC call, it may throw an error</span>
<span class="token keyword">const</span> txHash <span class="token operator">=</span> <span class="token keyword">await</span> ethereum<span class="token punctuation">.</span><span class="token function">request</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
  <span class="token literal-property property">method</span><span class="token operator">:</span> <span class="token string">&#39;eth_sendTransaction&#39;</span><span class="token punctuation">,</span>
  <span class="token literal-property property">params</span><span class="token operator">:</span> <span class="token punctuation">[</span>transactionParameters<span class="token punctuation">]</span><span class="token punctuation">,</span>
<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
{% endhighlight %}

<p>{% highlight %}<span class="token punctuation">js:</span>{% endhighlight %}</p>

<section class="tabs-component-panel" id="javascript" role="tabpanel" style="">
<div class="language-javascript extra-class">
<pre class="language-javascript">
{% highlight %}<span class="token keyword">const</span> ethereumButton <span class="token operator">=</span> document<span class="token punctuation">.</span><span class="token function">querySelector</span><span class="token punctuation">(</span><span class="token string">&#39;.enableEthereumButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token keyword">const</span> sendEthButton <span class="token operator">=</span> document<span class="token punctuation">.</span><span class="token function">querySelector</span><span class="token punctuation">(</span><span class="token string">&#39;.sendEthButton&#39;</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

<span class="token keyword">let</span> accounts <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>

<span class="token comment">//Sending Ethereum to an address</span>
sendEthButton<span class="token punctuation">.</span><span class="token function">addEventListener</span><span class="token punctuation">(</span><span class="token string">&#39;click&#39;</span><span class="token punctuation">,</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
  ethereum
    <span class="token punctuation">.</span><span class="token function">request</span><span class="token punctuation">(</span><span class="token punctuation">{</span>
      <span class="token literal-property property">method</span><span class="token operator">:</span> <span class="token string">&#39;eth_sendTransaction&#39;</span><span class="token punctuation">,</span>
      <span class="token literal-property property">params</span><span class="token operator">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">{</span>
          <span class="token literal-property property">from</span><span class="token operator">:</span> accounts<span class="token punctuation">[</span><span class="token number">0</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
          <span class="token literal-property property">to</span><span class="token operator">:</span> <span class="token string">&#39;0x2f318C334780961FB129D2a6c30D0763d9a5C970&#39;</span><span class="token punctuation">,</span>
          <span class="token literal-property property">value</span><span class="token operator">:</span> <span class="token string">&#39;0x29a2241af62c0000&#39;</span><span class="token punctuation">,</span>
          <span class="token literal-property property">gasPrice</span><span class="token operator">:</span> <span class="token string">&#39;0x09184e72a000&#39;</span><span class="token punctuation">,</span>
          <span class="token literal-property property">gas</span><span class="token operator">:</span> <span class="token string">&#39;0x2710&#39;</span><span class="token punctuation">,</span>
        <span class="token punctuation">}</span><span class="token punctuation">,</span>
      <span class="token punctuation">]</span><span class="token punctuation">,</span>
    <span class="token punctuation">}</span><span class="token punctuation">)</span>
    <span class="token punctuation">.</span><span class="token function">then</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">txHash</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span>txHash<span class="token punctuation">)</span><span class="token punctuation">)</span>
    <span class="token punctuation">.</span><span class="token function">catch</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">error</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> console<span class="token punctuation">.</span>error<span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

ethereumButton<span class="token punctuation">.</span><span class="token function">addEventListener</span><span class="token punctuation">(</span><span class="token string">&#39;click&#39;</span><span class="token punctuation">,</span> <span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token operator">=&gt;</span> <span class="token punctuation">{</span>
  <span class="token function">getAccount</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

<span class="token keyword">async</span> <span class="token keyword">function</span> <span class="token function">getAccount</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
  accounts <span class="token operator">=</span> <span class="token keyword">await</span> ethereum<span class="token punctuation">.</span><span class="token function">request</span><span class="token punctuation">(</span><span class="token punctuation">{</span> <span class="token literal-property property">method</span><span class="token operator">:</span> <span class="token string">&#39;eth_requestAccounts&#39;</span> <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>
{% endhighlight %}
</div>
</section>
</div>

<p>&nbsp;</p>

