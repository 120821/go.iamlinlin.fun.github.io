---
layout: post
title: "blockchain - 在infura上，使用truffle 创建和发币contract"
date: "2022-07-27"
categories: 
---
<p><a href="http://siwei.me/blog/posts/blockchain-infura-truffle-contract">http://siwei.me/blog/posts/blockchain-infura-truffle-contract</a></p>

<p>前期已经安装了truffle(npm install -g truffle)，只需要安装dotenv</p>

<pre><code><strong>npm install dotenv</strong>

added 1 package, and audited 8 packages in 2s
1 low severity vulnerability

To address all issues (including breaking changes), run:<br />
&nbsp; npm audit fix --force
Run `npm audit` for details.

<strong>truffle init</strong></code></pre>

<p><img height="533" src="/uploads/ckeditor/pictures/142/image-20220727100111-1.png" width="919" /></p>

<p>可以看到，truffle 生成了这样几个文件夹：</p>

<pre><code>$ find contracts/ migrations/ <span class="hljs-built_in">test</span>/<br />
contracts/&nbsp;&nbsp; 智能合约<br />
contracts/Migrations.sol&nbsp;&nbsp; 已经存在了一个文件了<br />
migrations/&nbsp;&nbsp; 迁移<br />
migrations/<span class="hljs-number">1</span>_initial_migration.js&nbsp;&nbsp;&nbsp; 已经存在了一个了<br />
<span class="hljs-built_in">test</span>/&nbsp;&nbsp; 测试文件夹</code></pre>

<p><img height="158" src="/uploads/ckeditor/pictures/143/image-20220727100211-2.png" width="828" /></p>

<p>安装 hdwallet-provider：</p>

<pre><code>npm install @truffle/hdwallet-provider</code></pre>

<p>创建.env文件</p>

<pre><code><span class="hljs-title">(这个URL不能用的)NFURA_API_URL</span> = <span class="hljs-string">&quot;https://goerli.infura.io/v3/427a8f460d514ebfadf0d6c60b0?????&quot;</span>&nbsp;&nbsp; <span class="hljs-comment"># infura的 API URL</span>（如图所示）<br />
MNEMONIC = <span class="hljs-string">&quot;margin blouse tenant chat hub chef addict club rather ??? ??? ??? &quot;</span>&nbsp; <span class="hljs-comment"># metamask 助记词（私钥）</span></code></pre>

<p><img height="591" src="/uploads/ckeditor/pictures/144/image-20220727120012-3.png" width="1584" /></p>

<p>URL和network需要进行这样的设置</p>

<p><img height="875" src="/uploads/ckeditor/pictures/149/image-20220728115245-1.png" width="1216" /></p>

<p>在contracts 目录下，创建 Demo.sol , 内容如下：</p>

<pre><code>$ cat contracts/Demo.sol<br />
pragma solidity &gt;= <span class="hljs-number">0.5</span><span class="hljs-number">.8</span>;</code></pre>

<p class="hljs cs">contract Demo {<br />
&nbsp; <span class="hljs-function"><span class="hljs-keyword">event</span> <span class="hljs-title">Echo</span><span class="hljs-params">(<span class="hljs-keyword">string</span> message)</span></span>;</p>

<p class="hljs cs">&nbsp; <span class="hljs-function">function <span class="hljs-title">echo</span><span class="hljs-params">(<span class="hljs-keyword">string</span> calldata message)</span> external </span>{<br />
&nbsp;&nbsp;&nbsp; <span class="hljs-function">emit <span class="hljs-title">Echo</span><span class="hljs-params">(message)</span></span>;<br />
&nbsp; }<br />
}</p>

<p>修改 truffle-config.js ，内容如下：</p>

<pre><code>require(&#39;dotenv&#39;).config();<br />
const HDWalletProvider = require(&#39;@truffle/hdwallet-provider&#39;);<br />
const { INFURA_API_URL, MNEMONIC } = process.env;
module.exports = {<br />
&nbsp; networks: {<br />
&nbsp;&nbsp;&nbsp; development: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; host: &quot;127.0.0.1&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; port: 8545,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; network_id: &quot;*&quot;<br />
&nbsp;&nbsp;&nbsp; }, &nbsp;<br />
&nbsp;&nbsp;&nbsp; goerli: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; provider: () =&gt; new HDWalletProvider(MNEMONIC, INFURA_API_URL),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; network_id: 5,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gas: 5500000,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; networkCheckTimeout: 1000000,&nbsp;&nbsp;&nbsp; // 这里设置超时时间1000秒<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeoutBlocks: 200,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addressIndex: 2<br />
&nbsp;&nbsp;&nbsp; }&nbsp; &nbsp;<br />
&nbsp; }<br />
};</code></pre>

<p>运行 truffle compile&nbsp;</p>

<pre><code>$ truffle compile</code></pre>

<p class="hljs markdown"><code><span class="hljs-header">Compiling your contracts...<br />
===========================</span><br />
<span class="hljs-blockquote">&gt; Compiling ./contracts/Demo.sol</span><br />
<span class="hljs-blockquote">&gt; Compiling ./contracts/Migrations.sol</span><br />
<span class="hljs-blockquote">&gt; Artifacts written to /mnt/d/workspace/test_truffle/build/contracts</span><br />
<span class="hljs-blockquote">&gt; Compiled successfully using:</span><br />
&nbsp;&nbsp; - solc: 0.5.16+commit.9c3226ce.Emscripten.clang</code></p>

<p>contracts 目录下</p>

<p>在migration 目录下，创建新文件， 内容如下：2_deploy_contract.js</p>

<pre><code>const Demo_Contract = artifacts.require(&quot;Demo&quot;);</code></pre>

<pre><code>module.exports = function(deployer) {<br />
&nbsp; deployer.deploy(Demo_Contract);<br />
};&nbsp;</code></pre>

<p>部署到网络上</p>

<p>查看命令详情： truffle help deploy</p>

<p>运行： truffle migrate --network <strong>development</strong>（需要已经运行在本地）</p>

<pre><code>Compiling your contracts...<br />
===========================<br />
&gt; Everything is up to date, there is nothing to compile.</code></pre>

<pre><br />
<code>Starting migrations...<br />
======================<br />
&gt; Network name:&nbsp;&nbsp;&nbsp; &#39;development&#39;<br />
&gt; Network id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1658894263086<br />
&gt; Block gas limit: 30000000 (0x1c9c380)</code></pre>

<pre>
<code>1_initial_migration.js<br />
======================</code></pre>

<pre><code>&nbsp;&nbsp; Deploying &#39;Migrations&#39;<br />
&nbsp;&nbsp; ----------------------<br />
&nbsp;&nbsp; &gt; transaction hash:&nbsp;&nbsp;&nbsp; 0x01a60ca15bf2342459ac622c2f0f0b5c8f7aaecd52a297ed06b01763d445018f<br />
&nbsp;&nbsp; &gt; Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Seconds: 0<br />
&nbsp;&nbsp; &gt; contract address:&nbsp;&nbsp;&nbsp; 0x64C726875Ad7175874cBd5652a708B25595490d8<br />
&nbsp;&nbsp; &gt; block number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br />
&nbsp;&nbsp; &gt; block timestamp:&nbsp;&nbsp;&nbsp;&nbsp; 1658894298<br />
&nbsp;&nbsp; &gt; account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x64EFE400852024E6E5db8aCCD6b0df9715b1bEE1<br />
&nbsp;&nbsp; &gt; balance:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 999.99915573025<br />
&nbsp;&nbsp; &gt; gas used:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 250154 (0x3d12a)<br />
&nbsp;&nbsp; &gt; gas price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.375 gwei<br />
&nbsp;&nbsp; &gt; value sent:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 ETH<br />
&nbsp;&nbsp; &gt; total cost:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00084426975 ETH</code></pre>

<pre><code>&nbsp;&nbsp; &gt; Saving migration to chain.<br />
&nbsp;&nbsp; &gt; Saving artifacts<br />
&nbsp;&nbsp; -------------------------------------<br />
&nbsp;&nbsp; &gt; Total cost:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.00084426975 ETH</code></pre>

<pre><br />
<code>2_deploy_contract.js<br />
====================</code></pre>

<pre><code>&nbsp;&nbsp; Deploying &#39;Demo&#39;<br />
&nbsp;&nbsp; ----------------<br />
&nbsp;&nbsp; &gt; transaction hash:&nbsp;&nbsp;&nbsp; 0xc35d52b0894655f409a9e65dff99ddbea0ce1eb873f3c6ea8cfa86dd09c20799<br />
&nbsp;&nbsp; &gt; Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Seconds: 0<br />
&nbsp;&nbsp; &gt; contract address:&nbsp;&nbsp;&nbsp; 0x51B5dCC972fE8025E7dF5c17D6Ebd7a82546eC41<br />
&nbsp;&nbsp; &gt; block number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br />
&nbsp;&nbsp; &gt; block timestamp:&nbsp;&nbsp;&nbsp;&nbsp; 1658894298<br />
&nbsp;&nbsp; &gt; account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x64EFE400852024E6E5db8aCCD6b0df9715b1bEE1<br />
&nbsp;&nbsp; &gt; balance:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 999.998614205648039361<br />
&nbsp;&nbsp; &gt; gas used:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 123433 (0x1e229)<br />
&nbsp;&nbsp; &gt; gas price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.171811543 gwei<br />
&nbsp;&nbsp; &gt; value sent:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 ETH<br />
&nbsp;&nbsp; &gt; total cost:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.000391506214187119 ETH</code></pre>

<pre><code>&nbsp;&nbsp; &gt; Saving migration to chain.<br />
&nbsp;&nbsp; &gt; Saving artifacts<br />
&nbsp;&nbsp; -------------------------------------<br />
&nbsp;&nbsp; &gt; Total cost:&nbsp;&nbsp;&nbsp;&nbsp; 0.000391506214187119 ETH</code></pre>

<pre><code>Summary<br />
=======<br />
&gt; Total deployments:&nbsp;&nbsp; 2<br />
&gt; Final cost:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.001235775964187119 ETH</code></pre>

<pre><code>-------ganach（在本地运行）</code></pre>

<pre><code>ganache<br />
ganache v7.3.2 (@ganache/cli: 0.4.2, @ganache/core: 0.4.2)<br />
Starting RPC server</code></pre>

<pre><code>Available Accounts<br />
==================<br />
(0) 0x64EFE400852024E6E5db8aCCD6b0df9715b1bEE1 (1000 ETH)<br />
(1) 0xae2691780AEC3fAF50555B4D690A998F97079Ea6 (1000 ETH)<br />
(2) 0x3473a2607d0Dd5E72fEb1ABDdBfF1a7f4Af78bdd (1000 ETH)<br />
(3) 0x297d9CD27B124B2fa153118E6BC9cF1040D2D670 (1000 ETH)<br />
(4) 0x347BEc64c145BC6A101D9D85b5d48696C4970077 (1000 ETH)<br />
(5) 0x33980C21e6c32ab1B4425d3D3977CF4A86D121ed (1000 ETH)<br />
(6) 0x24cFd3DD66A0cc2a0a4e56E47291670bE7f404A9 (1000 ETH)<br />
(7) 0xfa105566E0b5DEEFB3Ca7f5D47649a4Bed8fB6b5 (1000 ETH)<br />
(8) 0x4af49463476AF15A2B1B89235f7780c731BB9b92 (1000 ETH)<br />
(9) 0x0454fDA47462e4b3AFB88cc9699FFeAbD5597B21 (1000 ETH)</code></pre>

<pre><code>Private Keys<br />
==================<br />
(0) 0x32da26471b8264c219fc96d6c30523592325ed7a2e6ba468055c974293d215bb<br />
(1) 0x6c1d9d4bcbd4da81784500077a7d85200d6f1944cb089188c31ed284f1edc4f0<br />
(2) 0x70ebf90c581b6279ba578a013f420fa16dcb21fd038f5f8573a7719b6241d0ce<br />
(3) 0xb722b4b0e877280496999f7c8914e5992ace4c8b6721ebf0a39e96e14311053f<br />
(4) 0xa30a09e5b3c4691b6d5fd5493769ca8a6df99eca662aeb76ec04900f9f345016<br />
(5) 0x39e20294fe5480a7c9229ffd226a60f9dc5678fe78317e3dd13f95174f5e347f<br />
(6) 0xb29448baeae92de271d6c7872072db3ae9daff8e4886c5843a4e134deea52283<br />
(7) 0x470b0a034e234b90486140137b325aea26d48f2c75cc58257fdbb312d2ddc569<br />
(8) 0x55d72fcf08c6ad2591cee9cce91827411315db6d40a3ee87742278b98febf1af<br />
(9) 0x69fc7d7ccce7ddd1c5c06c62569762e8a4394d12e97bec2dbd42e8e6cefbdbb6</code></pre>

<pre><code>HD Wallet<br />
==================<br />
Mnemonic:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tunnel liquid galaxy allow hood crucial upper time describe drip used advance<br />
Base HD Path:&nbsp; m/44&#39;/60&#39;/0&#39;/0/{account_index}</code></pre>

<pre><code>Default Gas Price<br />
==================<br />
2000000000</code></pre>

<pre><code>BlockGas Limit<br />
==================<br />
30000000</code></pre>

<pre><code>Call Gas Limit<br />
==================<br />
50000000</code></pre>

<pre><code>Chain Id<br />
==================<br />
<strong>1337</strong></code></pre>

<pre><code>RPC Listening on <strong>127.0.0.1:8545</strong><br />
eth_blockNumber<br />
net_version<br />
eth_accounts<br />
eth_getBlockByNumber<br />
eth_accounts<br />
net_version<br />
eth_getBlockByNumber<br />
eth_getBlockByNumber<br />
net_version<br />
eth_getBlockByNumber<br />
eth_estimateGas<br />
net_version<br />
eth_blockNumber<br />
eth_getBlockByNumber<br />
eth_estimateGas<br />
eth_getBlockByNumber<br />
eth_gasPrice<br />
eth_sendTransaction</code></pre>

<pre><code>&nbsp; Transaction: 0x01a60ca15bf2342459ac622c2f0f0b5c8f7aaecd52a297ed06b01763d445018f<br />
&nbsp; Contract created: 0x64c726875ad7175874cbd5652a708b25595490d8<br />
&nbsp; Gas usage: 250154<br />
&nbsp; Block number: 1<br />
&nbsp; Block time: Wed Jul 27 2022 11:58:18 GMT+0800 (China Standard Time)</code></pre>

<pre><code>eth_getTransactionReceipt<br />
eth_getCode<br />
eth_getTransactionByHash<br />
eth_getBlockByNumber<br />
eth_getBalance<br />
eth_getBlockByNumber<br />
eth_getBlockByNumber<br />
eth_estimateGas<br />
eth_getBlockByNumber<br />
eth_gasPrice<br />
eth_sendTransaction</code></pre>

<pre><code>&nbsp; Transaction: 0x74b55718fa25e224e179ceb090ae03234a2a4e1f1aad1766b1001e069b54c9d5<br />
&nbsp; Gas usage: 45913<br />
&nbsp; Block number: 2<br />
&nbsp; Block time: Wed Jul 27 2022 11:58:18 GMT+0800 (China Standard Time)</code></pre>

<pre><code>eth_getTransactionReceipt<br />
eth_getBlockByNumber<br />
eth_accounts<br />
net_version<br />
eth_getBlockByNumber<br />
eth_getBlockByNumber<br />
net_version<br />
eth_getBlockByNumber<br />
eth_estimateGas<br />
net_version<br />
eth_blockNumber<br />
eth_getBlockByNumber<br />
eth_estimateGas<br />
eth_getBlockByNumber<br />
eth_gasPrice<br />
eth_sendTransaction</code></pre>

<pre><code>&nbsp; Transaction: 0xc35d52b0894655f409a9e65dff99ddbea0ce1eb873f3c6ea8cfa86dd09c20799<br />
&nbsp; Contract created: 0x51b5dcc972fe8025e7df5c17d6ebd7a82546ec41<br />
&nbsp; Gas usage: 123433<br />
&nbsp; Block number: 3<br />
&nbsp; Block time: Wed Jul 27 2022 11:58:18 GMT+0800 (China Standard Time)</code></pre>

<pre><code>eth_getTransactionReceipt<br />
eth_getCode<br />
eth_getTransactionByHash<br />
eth_getBlockByNumber<br />
eth_getBalance<br />
eth_getBlockByNumber<br />
eth_getBlockByNumber<br />
eth_estimateGas<br />
eth_getBlockByNumber<br />
eth_gasPrice<br />
eth_sendTransaction</code></pre>

<pre><code>&nbsp; Transaction: 0xd5cb56a9fadb0830788218e10f46162976fdef32a1dd7fe2d1f12bc89099d8c9<br />
&nbsp; Gas usage: 28813<br />
&nbsp; Block number: 4<br />
&nbsp; Block time: Wed Jul 27 2022 11:58:18 GMT+0800 (China Standard Time)</code></pre>

<pre><code>eth_getTransactionReceipt</code></pre>

<pre><code>linlin@linlin-i5:/workspace/blockchain$ truffle deploy --network development --verbose-rpc --interactive</code></p>

<pre><code>Compiling your contracts...<br />
===========================<br />
&gt; Everything is up to date, there is nothing to compile.<br />
&nbsp;&nbsp; &gt; {<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;id&quot;: 1,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;method&quot;: &quot;eth_blockNumber&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;params&quot;: []<br />
&nbsp;&nbsp; &gt; }<br />
&nbsp;&lt;&nbsp;&nbsp; {<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: 1,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;result&quot;: &quot;0x4&quot;<br />
&nbsp;&lt;&nbsp;&nbsp; }<br />
&nbsp;&nbsp; &gt; {<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;id&quot;: 2,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;method&quot;: &quot;net_version&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;params&quot;: []<br />
&nbsp;&nbsp; &gt; }<br />
&nbsp;&lt;&nbsp;&nbsp; {<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: 2,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;result&quot;: &quot;1658894263086&quot;<br />
&nbsp;&lt;&nbsp;&nbsp; }<br />
&nbsp;&nbsp; &gt; {<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;id&quot;: 3,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;method&quot;: &quot;eth_accounts&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;params&quot;: []<br />
&nbsp;&nbsp; &gt; }<br />
&nbsp;&lt;&nbsp;&nbsp; {<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: 3,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;result&quot;: [<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x64efe400852024e6e5db8accd6b0df9715b1bee1&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0xae2691780aec3faf50555b4d690a998f97079ea6&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x3473a2607d0dd5e72feb1abddbff1a7f4af78bdd&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x297d9cd27b124b2fa153118e6bc9cf1040d2d670&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x347bec64c145bc6a101d9d85b5d48696c4970077&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x33980c21e6c32ab1b4425d3d3977cf4a86d121ed&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x24cfd3dd66a0cc2a0a4e56e47291670be7f404a9&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0xfa105566e0b5deefb3ca7f5d47649a4bed8fb6b5&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x4af49463476af15a2b1b89235f7780c731bb9b92&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x0454fda47462e4b3afb88cc9699ffeabd5597b21&quot;<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; ]<br />
&nbsp;&lt;&nbsp;&nbsp; }<br />
&nbsp;&nbsp; &gt; {<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;id&quot;: 4,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;method&quot;: &quot;eth_getBlockByNumber&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;params&quot;: [<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;latest&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp; false<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; ]<br />
&nbsp;&nbsp; &gt; }<br />
&nbsp;&lt;&nbsp;&nbsp; {<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: 4,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;result&quot;: {<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;hash&quot;: &quot;0x3107ac891223526d7e0ae9f3decb53d41916c44e9b33db9b181c48b4b7242ef5&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;parentHash&quot;: &quot;0xef9b2ca1a968e1143bb3445a9436383169bef628acfebea394de4a137cb58749&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sha3Uncles&quot;: &quot;0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;miner&quot;: &quot;0x0000000000000000000000000000000000000000&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;stateRoot&quot;: &quot;0xaa6c3589d011c3fd8c42f58ab116d60e5456d1e709ccb2ea34cce706b95226ba&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactionsRoot&quot;: &quot;0xe4f130fc0e312fdbf37497884a8b2dd4436de147062d434a499129394a1094f1&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;receiptsRoot&quot;: &quot;0x736f0efb8bb358b0dc83e9cbf66b9c0d06d39cda8f5061f861ebb9c10205f0dd&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;logsBloom&quot;: &quot;0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;difficulty&quot;: &quot;0x1&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;number&quot;: &quot;0x4&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;gasLimit&quot;: &quot;0x1c9c380&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;gasUsed&quot;: &quot;0x708d&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;timestamp&quot;: &quot;0x62e0b7da&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;extraData&quot;: &quot;0x&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mixHash&quot;: &quot;0x0000000000000000000000000000000000000000000000000000000000000000&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;nonce&quot;: &quot;0x0000000000000000&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;totalDifficulty&quot;: &quot;0x5&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;baseFeePerGas&quot;: &quot;0x23143234&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;size&quot;: &quot;0x298&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;transactions&quot;: [<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0xd5cb56a9fadb0830788218e10f46162976fdef32a1dd7fe2d1f12bc89099d8c9&quot;<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;uncles&quot;: []<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&lt;&nbsp;&nbsp; }<br />
&nbsp;&nbsp; &gt; {<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;id&quot;: 5,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;method&quot;: &quot;eth_getCode&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;params&quot;: [<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;0x64c726875ad7175874cbd5652a708b25595490d8&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;latest&quot;<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; ]<br />
&nbsp;&nbsp; &gt; }<br />
&nbsp;&lt;&nbsp;&nbsp; {<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: 5,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;result&quot;: &quot;0x608060405234801561001057600080fd5b50600436106100415760003560e01c8063445df0ac146100465780638da5cb5b14610064578063fdacd57614610082575b600080fd5b61004e61009e565b60405161005b9190610179565b60405180910390f35b61006c6100a4565b60405161007991906101d5565b60405180910390f35b61009c60048036038101906100979190610221565b6100c8565b005b60015481565b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614610156576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161014d906102d1565b60405180910390fd5b8060018190555050565b6000819050919050565b61017381610160565b82525050565b600060208201905061018e600083018461016a565b92915050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b60006101bf82610194565b9050919050565b6101cf816101b4565b82525050565b60006020820190506101ea60008301846101c6565b92915050565b600080fd5b6101fe81610160565b811461020957600080fd5b50565b60008135905061021b816101f5565b92915050565b600060208284031215610237576102366101f0565b5b60006102458482850161020c565b91505092915050565b600082825260208201905092915050565b7f546869732066756e6374696f6e206973207265737472696374656420746f207460008201527f686520636f6e74726163742773206f776e657200000000000000000000000000602082015250565b60006102bb60338361024e565b91506102c68261025f565b604082019050919050565b600060208201905081810360008301526102ea816102ae565b905091905056fea26469706673582212205dca1aff29d0fbb145975f8cd99149315d3897703086ca83bf94fcd2c4fefd0e64736f6c634300080f0033&quot;<br />
&nbsp;&lt;&nbsp;&nbsp; }<br />
&nbsp;&nbsp; &gt; {<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;id&quot;: 6,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;method&quot;: &quot;eth_call&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; &quot;params&quot;: [<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;from&quot;: &quot;0x64efe400852024e6e5db8accd6b0df9715b1bee1&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;to&quot;: &quot;0x64c726875ad7175874cbd5652a708b25595490d8&quot;,<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot;: &quot;0x445df0ac&quot;<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;latest&quot;<br />
&nbsp;&nbsp; &gt;&nbsp;&nbsp; ]<br />
&nbsp;&nbsp; &gt; }<br />
&nbsp;&lt;&nbsp;&nbsp; {<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;id&quot;: 6,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;jsonrpc&quot;: &quot;2.0&quot;,<br />
&nbsp;&lt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;result&quot;: &quot;0x0000000000000000000000000000000000000000000000000000000000000002&quot;<br />
&nbsp;&lt;&nbsp;&nbsp; }<br />
Network up to date.</code></p>

<p>如果要在本地的7545进行部署就需要安装APP的ganache</p>

<p><code>linlin@linlin-i5:~/Downloads$ ll |grep ganache<br />
-rw-rw-r--&nbsp; 1 linlin linlin 153130048&nbsp; 7月 25 14:57 ganache-2.5.4-linux-x86_64.AppImage<br />
linlin@linlin-i5:~/Downloads$ chmod +x ganache-2.5.4-linux-x86_64.AppImage ^C<br />
linlin@linlin-i5:~/Downloads$ chmod +x ganache-2.5.4-linux-x86_64.AppImage<br />
linlin@linlin-i5:~/Downloads$ ll |grep ganache<br />
-rwxrwxr-x&nbsp; 1 linlin linlin 153130048&nbsp; 7月 25 14:57 ganache-2.5.4-linux-x86_64.AppImage*<br />
linlin@linlin-i5:~/Downloads$ ./ganache-2.5.4-linux-x86_64.AppImage<br />
09:30:56.509 &rsaquo; Checking for update<br />
09:30:56.522 &rsaquo; Generated new staging user ID: d6d80e14-56c1-52c8-82e0-ad8a734e3e6e<br />
listen to truffle<br />
09:33:59.075 &rsaquo; Error: Error: net::ERR_CONNECTION_RESET<br />
&nbsp;&nbsp;&nbsp; at SimpleURLLoaderWrapper.&lt;anonymous&gt; (electron/js2c/browser_init.js:2519:21)<br />
&nbsp;&nbsp;&nbsp; at SimpleURLLoaderWrapper.emit (events.js:210:5)<br />
eth_unsubscribe<br />
eth_unsubscribe</code></p>

<p><code>eth_unsubscribe<br />
eth_unsubscribe</code></p>

<p><code>eth_unsubscribe<br />
eth_unsubscribe</code></p>

<p>这里是卡住了，然后断开了，因此需要重新启动</p>

<p><code>linlin@linlin-i5:~/Downloads$ ./ganache-2.5.4-linux-x86_64.AppImage</code></p>

<p><img height="823" src="/uploads/ckeditor/pictures/152/image-20220728115706-4.png" width="1185" /></p>

<p><img height="815" src="/uploads/ckeditor/pictures/151/image-20220728115656-3.png" width="1186" /></p>

<p><img height="856" src="/uploads/ckeditor/pictures/150/image-20220728115637-2.png" width="1203" /></p>

