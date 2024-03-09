---
layout: post
title: "Transfer Ownership of an NFT"
date: "2022-08-16"
categories: 
---
<p><a href="https://medium.com/coinmonks/transfer-ownership-of-an-nft-e0699c029fcf">Transfer Ownership of an NFT</a></p>

<p>获取一些假 MATIC:由于区块链交易绑定了gas费用，我们需要收集一些假的MATIC来转移NFT。</p>

<p class="pw-post-body-paragraph lt lu jv lv b lw lx lf ly lz ma li mb mc md me mf mg mh mi mj mk ml mm mn mo jo gy" data-selectable-paragraph="" id="64a5">从这里获取一些假 MATIC: <a class="au pa" href="https://faucet.polygon.technology/" rel="noopener ugc nofollow" target="_blank">https://faucet.polygon.technology/</a>.</p>

<p class="pw-post-body-paragraph lt lu jv lv b lw lx lf ly lz ma li mb mc md me mf mg mh mi mj mk ml mm mn mo jo gy" data-selectable-paragraph="" id="cd8f">从这里获取一些假 MATIC:</p>

<ol>
	<li class="pb pc jv lv b lw lx lz ma mc pd mg pe mk pf mo pg ph pi pj gy" data-selectable-paragraph="" id="fcd8"><a class="au pa" href="https://faucet.pearzap.com/" rel="noopener ugc nofollow" target="_blank">https://faucet.pearzap.com/</a></li>
	<li class="pb pc jv lv b lw pk lz pl mc pm mg pn mk po mo pg ph pi pj gy" data-selectable-paragraph="" id="95f7"><a class="au pa" href="https://matic.supply/" rel="noopener ugc nofollow" target="_blank">https://matic.supply/</a></li>
	<li class="pb pc jv lv b lw pk lz pl mc pm mg pn mk po mo pg ph pi pj gy" data-selectable-paragraph="" id="85c1"><a class="au pa" href="https://www.coinclarified.com/tools/faucets/polygon" rel="noopener ugc nofollow" target="_blank">https://www.coinclarified.com/tools/faucets/polygon</a></li>
	<li class="pb pc jv lv b lw pk lz pl mc pm mg pn mk po mo pg ph pi pj gy" data-selectable-paragraph="" id="5f6f"><a class="au pa" href="https://faucet.firebird.finance/" rel="noopener ugc nofollow" target="_blank">https://faucet.firebird.finance/</a></li>
</ol>

<p class="pw-post-body-paragraph lt lu jv lv b lw lx lf ly lz ma li mb mc md me mf mg mh mi mj mk ml mm mn mo jo gy" data-selectable-paragraph="">: <a class="au pa" href="https://faucet.polygon.technology/" rel="noopener ugc nofollow" target="_blank">https://faucet.polygon.technology/</a>.</p>

<p class="pw-post-body-paragraph lt lu jv lv b lw lx lf ly lz ma li mb mc md me mf mg mh mi mj mk ml mm mn mo jo gy" data-selectable-paragraph="" id="cd8f">从这里获取一些假 MATIC:</p>

<ol>
	<li class="pb pc jv lv b lw lx lz ma mc pd mg pe mk pf mo pg ph pi pj gy" data-selectable-paragraph="" id="fcd8"><a class="au pa" href="https://faucet.pearzap.com/" rel="noopener ugc nofollow" target="_blank">https://faucet.pearzap.com/</a></li>
	<li class="pb pc jv lv b lw pk lz pl mc pm mg pn mk po mo pg ph pi pj gy" data-selectable-paragraph="" id="95f7"><a class="au pa" href="https://matic.supply/" rel="noopener ugc nofollow" target="_blank">https://matic.supply/</a></li>
	<li class="pb pc jv lv b lw pk lz pl mc pm mg pn mk po mo pg ph pi pj gy" data-selectable-paragraph="" id="85c1"><a class="au pa" href="https://www.coinclarified.com/tools/faucets/polygon" rel="noopener ugc nofollow" target="_blank">https://www.coinclarified.com/tools/faucets/polygon</a></li>
	<li class="pb pc jv lv b lw pk lz pl mc pm mg pn mk po mo pg ph pi pj gy" data-selectable-paragraph="" id="5f6f"><a class="au pa" href="https://faucet.firebird.finance/" rel="noopener ugc nofollow" target="_blank">https://faucet.firebird.finance/</a></li>
</ol>

<p class="nc nd jv bn ne nf ng nh ni nj nk nl nm mc nn no np mg nq nr ns mk nt nu nv kb gy" data-selectable-paragraph="" id="bd45">Create .env file</p>

<pre class="mr ms mt mu hv pp fd pq">
<span class="gy nc nd jv pr b dn ps pt l pu" data-selectable-paragraph="" id="b6fe">API_URL = &ldquo;RPC Node URL&quot;</span>
<span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="5532">PRIVATE_KEY = &quot;sendor&#39;s metamask private key&quot;</span>
<span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="fee8">PUBLIC_KEY = &quot;sendor&#39;s metamask wallet address&quot;</span>
<span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="0dad">CONTRACT_ADDRESS = &quot;deployed contract address&quot;</span>
<span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="e401">USER_ADDRESS = &quot;recipient&#39;s wallet address&quot;</span>{% endhighlight %}

<p class="nc nd jv bn ne nf ng nh ni nj nk nl nm mc nn no np mg nq nr ns mk nt nu nv kb gy" data-selectable-paragraph="" id="1c24">Create nft-trasnfer.js file</p>

<p>将以下内容复制到文件中。</p>

<p>&nbsp;tokenId 指定要转移的 NFT 代币，您在铸造 NFT 后将获得该代币。</p>

<p>&nbsp;safeTransferFrom 是一个重载函数。&nbsp; 在 ethers.js 中，调用重载函数的语法与非重载函数不同。&nbsp; 你可以在<a href="https://docs.ethers.io/v5/single-page/#/v5/migration/web3/-%23-migration-from-web3-js--contracts--overloaded-functions">这里</a>参考。</p>

<pre class="mr ms mt mu hv pp fd pq">
<span class="gy nc nd jv pr b dn ps pt l pu" data-selectable-paragraph="" id="cba2"><strong class="pr kf">const { ethers } = require(&quot;ethers&quot;);
const contract = require(&quot;../artifacts/contracts/ArGram.sol/ArGram.json&quot;);
const {
   API_URL,
   PRIVATE_KEY,
   PUBLIC_KEY,
   CONTRACT_ADDRESS,
   USER_ADDRESS
} = process.env;</strong></span><span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="5557"><strong class="pr kf">const provider = new ethers.providers.JsonRpcProvider(API_URL);
const wallet = new ethers.Wallet(PRIVATE_KEY, provider);</strong></span><span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="5f07">//Get gas price
<strong class="pr kf">const gasPrice = await provider.getGasPrice();</strong></span><span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="ba5a">//Grab contract ABI and create an instance
<strong class="pr kf">const nftContract = new ethers.Contract(
   CONTRACT_ADDRESS,
   contract.abi,
   wallet
);</strong></span><span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="8e9a">//Estimate gas limit
<strong class="pr kf">const gasLimit = await nftContract.estimateGas[&quot;safeTransferFrom(address,address,uint256)&quot;](PUBLIC_KEY, USER_ADDRESS, tokenId, { gasPrice });</strong></span><span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="2838">//Call the safetransfer method
<strong class="pr kf">const transaction = await nftContract[&quot;safeTransferFrom(address,address,uint256)&quot;](PUBLIC_KEY, USER_ADDRESS, tokenId, { gasLimit });</strong></span><span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="cc3c">//Wait for the transaction to complete
<strong class="pr kf">await transaction.wait();</strong></span><span class="gy nc nd jv pr b dn pv pw px py pz pt l pu" data-selectable-paragraph="" id="9d1a"><strong class="pr kf">console.log(&quot;Transaction Hash: &quot;, transaction.hash);</strong></span>{% endhighlight %}

<p>运行后是这样的结果:</p>

<pre class="mr ms mt mu hv pp fd pq">
<span class="gy nc nd jv pr b dn ps pt l pu" data-selectable-paragraph="" id="a830">Transaction Hash: 0xfcfaf0afb6ed3b38ab7583d90a8fd9b10cb0c17c1218c0668c94c33482283c5f</span>{% endhighlight %}

<p><font style="vertical-align:inherit">在 mumbai polygonscan 上</font><a href="https://mumbai.polygonscan.com/">验证交易</a></p>

<p>&nbsp;</p>

