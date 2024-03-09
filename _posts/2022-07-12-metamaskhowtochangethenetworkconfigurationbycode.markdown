---
layout: post
title: "Metamask: How to change the network configuration by code"
date: "2022-07-12"
categories: 
---
<p>参考：https://patricio-lopez-75857.medium.com/metamask-how-to-change-the-network-configuration-by-code-21f25d04d932</p>

<p>进入console，把下面的代码放进就可以了，如果出现报错就把<span class="gj kj kk ii kl b do km kn l ko" data-selectable-paragraph="" id="7161">第二行window.web3 = new Web3(window.ethereum)删除，就会自动连接fuji网络，选择用户，因为已经创建了很多测试账户。</span></p>

<pre class="kd ke kf kg ga kh bt ki">
<span class="gj kj kk ii kl b do km kn l ko" data-selectable-paragraph="" id="7161">if(window.ethereum) {
  window.web3 = new  Web3(window.ethereum)
  window.ethereum.request({method: &#39;eth_requestAccounts&#39;})//这一行是自动连接钱包</span><span class="gj kj kk ii kl b do km kn l ko" data-selectable-paragraph="">
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
}</span></pre>

<p><img height="77" src="/uploads/ckeditor/pictures/88/image-20220712175331-2.png" width="389" /></p>

<p><img height="240" src="/uploads/ckeditor/pictures/87/image-20220712175259-1.png" width="489" /></p>

