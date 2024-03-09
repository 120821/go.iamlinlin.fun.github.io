---
layout: post
title: "hardhat:本地开发、测试eth的工具 , web3.js "
date: "2022-07-28"
categories: 
---
<p>参考：http://siwei.me/blog/posts/blockchain-hardhat-eth-web3-js</p>

<p>参考：https://hardhat.org/getting-started/</p>

<p>使用npm hardhat</p>

<p>1、创建新的文件夹：mkdir contract-test</p>

<p>1.1进入文件夹 ： cd contract-test/</p>

<p>1.2查看node版本：node -v</p>

<p>1.3安装工具： npm install --save-dev hardhat</p>

<p>linlin@linlin-i5:/workspace$ mkdir contract-test<br />
linlin@linlin-i5:/workspace$ cd contract-test/<br />
linlin@linlin-i5:/workspace/contract-test$ node -v<br />
v16.13.2<br />
linlin@linlin-i5:/workspace/contract-test$ npm install --save-dev hardhat</p>

<p>added 305 packages, and audited 306 packages in 1m</p>

<p>58 packages are looking for funding<br />
&nbsp; run `npm fund` for details</p>

<p>found 0 vulnerabilities</p>

<p><img height="296" src="/uploads/ckeditor/pictures/156/image-20220728175809-1.png" width="835" /></p>

<p>2.1判断是否安装成功，使用：npx hardhat</p>

<p>看到输入一堆符号后，就成功安装了</p>

<p><img height="446" src="/uploads/ckeditor/pictures/157/image-20220728175844-2.png" width="1274" /></p>

<p>这样就会生成一个ETH contract的项目，包含了一个智能合约。</p>

<p>（可选） 也可以自行创建一个contract, 内容如下：</p>

<pre class="hljs javascript">
cat contracts/SayHi.sol
pragma solidity ^<span class="hljs-number">0.8</span><span class="hljs-number">.0</span>;

contract SayHi {
  uint256 number;
  <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">store</span><span class="hljs-params">(uint256 num)</span> <span class="hljs-title">public</span> </span>{
    number = num;
  }

  <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">get</span><span class="hljs-params">()</span> <span class="hljs-title">public</span> <span class="hljs-title">view</span> <span class="hljs-title">returns</span> <span class="hljs-params">(uint256)</span></span>{
    <span class="hljs-keyword">return</span> number;
  }
}
</pre>

<p><img height="72" src="/uploads/ckeditor/pictures/158/image-20220728180227-3.png" width="767" /></p>

<p>2.2编译： npx hardhat compile</p>

<p>2.3部署： scripts/sample-script.js 内容如下；</p>

<pre class="hljs coffeescript">
<span class="hljs-reserved">const</span> hre = <span class="hljs-built_in">require</span>(<span class="hljs-string">&quot;hardhat&quot;</span>);

async <span class="hljs-reserved">function</span> main() {
  <span class="hljs-reserved">const</span> SayHi = await hre.ethers.getContractFactory(<span class="hljs-string">&quot;SayHi&quot;</span>);
  <span class="hljs-reserved">const</span> sayHi = await SayHi.deploy();
  await sayHi.deployed();
  <span class="hljs-built_in">console</span>.log(<span class="hljs-string">&quot;SayHi deployed to:&quot;</span>, sayHi.address);
}

main()
  .<span class="hljs-keyword">then</span>(<span class="hljs-function"><span class="hljs-params">()</span> =&gt;</span> process.exit(<span class="hljs-number">0</span>))
  .<span class="hljs-keyword">catch</span>(<span class="hljs-function"><span class="hljs-params">(error)</span> =&gt;</span> {
    <span class="hljs-built_in">console</span>.error(error);
    process.exit(<span class="hljs-number">1</span>);
  });</pre>

<p>npx hardhat run scripts/sample-script.js&nbsp;</p>

<p>就可以看到contract部署到了本地。</p>

<pre class="hljs nginx">
<span class="hljs-title">npx</span> hardhat run scripts/sample-script.js
SayHi deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3

2.4在本地运行轻节点：npx hardhat node&nbsp;&nbsp; （在本地运行 模拟的ETH节点）</pre>

<p>运行上面的命令， 就可以看到提示：</p>

<pre class="hljs javascript">
Started HTTP and WebSocket <span class="hljs-built_in">JSON</span>-RPC server at http:<span class="hljs-comment">//127.0.0.1:8545/</span></pre>

<p><img height="624" src="/uploads/ckeditor/pictures/159/image-20220728180353-4.png" width="1328" /></p>

<p>3.使用 web3.js 进行查询，打开新的窗口</p>

<p>引入web3.js : npm install web&nbsp;</p>

<p>创建一个文件： （当前目录下） run.js</p>

<pre class="hljs coffeescript">
<span class="hljs-reserved">var</span> Web3 = <span class="hljs-built_in">require</span>(<span class="hljs-string">&#39;web3&#39;</span>)
<span class="hljs-reserved">var</span> web3 = <span class="hljs-keyword">new</span> Web3(<span class="hljs-string">&#39;ws://localhost:8545&#39;</span>)
web3.eth.getAccounts()
    .<span class="hljs-keyword">then</span>(<span class="hljs-built_in">console</span>.log);
</pre>

<p>可以查询该 节点下的所有account:</p>

<p>curl -X POST -H &quot;Content-Type: application/json&quot; --data &#39;{&quot;jsonrpc&quot;:&quot;2.0&quot;,&quot;method&quot;:&quot;eth_accounts&quot;,&quot;params&quot;:[],&quot;id&quot;:1}&#39; localhost:8545</p>

<p><img height="523" src="/uploads/ckeditor/pictures/160/image-20220728180632-5.png" width="1916" /></p>

<p>查询当前的gas price:</p>

<p>$ curl -X POST -H &quot;Content-Type: application/json:[],&quot;id&quot;:1}&#39; localhost:8545 method&quot;:&quot;eth_gasPrice&quot;,&quot;params&quot;:<br />
{&quot;jsonrpc&quot;:&quot;2.0&quot;,&quot;id&quot;:1,&quot;result&quot;:&quot;0x6fc23ac0&quot;}</p>

<p>查看区块高度：</p>

<p>curl -X POST -H &quot;Content-Type: application/json&quot; --data &#39;{&quot;jsonrpc&quot;:&quot;2.0&quot;,&quot;method&quot;:&quot;eth_blockNumber&quot;,&quot;params&quot;:[],&quot;id&quot;:1}&#39; localhost:8545</p>

<p>查看账户余额：</p>

<p>curl -X POST -H &quot;Content-Type: application/json&quot; --data &#39;{&quot;jsonrpc&quot;:&quot;2.0&quot;,&quot;method&quot;:&quot;eth_getBalance&quot;,&quot;params&quot;:[&quot;0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266&quot;, &quot;latest&quot;],&quot;id&quot;:1}&#39; 127.0.0.1:8545</p>

<p><img height="113" src="/uploads/ckeditor/pictures/161/image-20220728180651-6.png" width="1920" /></p>

<p>&nbsp;</p>

