---
layout: post
title: "Using Remix to Deploy to Moonbeam"
date: "2022-07-19"
categories: 
---
<p>参考：https://docs.moonbeam.network/builders/build/eth-api/dev-env/remix/</p>

<p>创建文件MoonCoin.sol or MyToken.sol</p>

<pre id="__code_0">
<code tabindex="0"><span class="k">pragma solidity</span><span class="w"> </span><span class="o">^</span><span class="k">0.7.0</span><span class="p">;</span>

<span class="kt">import</span><span class="w"> </span><span class="s1">&#39;https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.2.0-solc-0.7/contracts/token/ERC20/ERC20.sol&#39;</span><span class="p">;</span>

<span class="c1">// This ERC-20 contract mints the specified amount of tokens to the contract creator.</span>
<span class="k">contract</span><span class="w"> </span><span class="ni">MyToken</span><span class="w"> </span><span class="kt">is</span><span class="w"> </span>ERC20<span class="w"> </span><span class="p">{</span>
<span class="w">  </span><span class="kt">constructor</span><span class="p">(</span><span class="kt">uint256</span><span class="w"> </span><span class="nv">initialSupply</span><span class="p">)</span><span class="w"> </span>ERC20<span class="p">(</span><span class="s2">&quot;MyToken&quot;</span><span class="p">,</span><span class="w"> </span><span class="s2">&quot;MYTOK&quot;</span><span class="p">)</span><span class="w"> </span><span class="p">{</span>
<span class="w">    </span>_mint<span class="p">(</span><span class="k">msg.sender</span><span class="p">,</span><span class="w"> </span>initialSupply<span class="p">);</span>
<span class="w">  </span><span class="p">}</span>
<span class="p">}</span>
{% endhighlight %}

<p>进行编译，注意选择正确的版本号</p>

<p><img alt="Compile MyToken.sol" src="https://docs.moonbeam.network/images/builders/build/eth-api/dev-env/remix/using-remix-6.png" /></p>

<p>填写内容<code>8000000000000000000000000</code></p>

<p><code>进行deploy</code></p>

<p><img height="541" src="/uploads/ckeditor/pictures/110/image-20220719104203-1.png" width="1558" /></p>

<p><img alt="Enter an account balance and deploy" src="https://docs.moonbeam.network/images/builders/build/eth-api/dev-env/remix/using-remix-8.png" /></p>

<p>确认合约，导入代币</p>

<p><img height="886" src="/uploads/ckeditor/pictures/113/image-20220719104816-4.png" width="1006" /></p>

