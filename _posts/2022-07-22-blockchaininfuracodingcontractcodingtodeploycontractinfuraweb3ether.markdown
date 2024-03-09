---
layout: post
title: "blockchain  在infura上使用编码coding的方式，创建和部署contract coding to deploy contract infura web3 ether "
date: "2022-07-22"
categories: 
---
<p><a href="http://siwei.me/blog/posts/blockchain-infura-coding-contract-coding-to-deploy-contract-infura-web3-ether">http://siwei.me/blog/posts/blockchain-infura-coding-contract-coding-to-deploy-contract-infura-web3-ether</a></p>

<p>创建文件夹</p>

<p>/workspace/blockchain/contract_on_goerli_using_infura</p>

<p>安装需要的包</p>

<p>npm install web3 solc dotenv</p>

<p><img height="264" src="/uploads/ckeditor/pictures/472/image-20220922162319-2.png" width="1129" /></p>

<p>安装完成就可以看到，需要的文件：package.json</p>

<pre>
<code>cat package.json

{

&nbsp; &quot;dependencies&quot;: {

&nbsp;&nbsp;&nbsp; &quot;@truffle/hdwallet-provider&quot;: &quot;^2.0.12&quot;,

&nbsp;&nbsp;&nbsp; &quot;dotenv&quot;: &quot;^16.0.1&quot;,

&nbsp;&nbsp;&nbsp; &quot;solc&quot;: &quot;^0.8.16&quot;,

&nbsp;&nbsp;&nbsp; &quot;web3&quot;: &quot;^1.7.5&quot;

&nbsp; }

}</code></pre>

<p>需要编译的contract</p>

<pre><code>cat Demo.sol<br />
pragma solidity &gt;= 0.5.8;

contract Demo {<br />
&nbsp; event Echo (string message);

&nbsp; function echo(string calldata message) external {<br />
&nbsp;&nbsp;&nbsp; emit Echo(message);<br />
&nbsp; }<br />
}</code></pre>

<p>生成abi和bytecode的脚本：</p>

<pre><code>cat compile.js<br />
const fs = require(&#39;fs&#39;).promises;

const solc = require(&#39;solc&#39;);

// 这个方法需要修改， 入口文件名称 Demo.sol&nbsp;&nbsp; 和 生成的文件名称 Demo.json<br />
async function main(){<br />
&nbsp; const sourceCode = await fs.readFile(&#39;Demo.sol&#39;, &#39;utf8&#39;);<br />
&nbsp; const {abi, bytecode} = compile(sourceCode, &#39;Demo&#39;);<br />
&nbsp; const artifact = JSON.stringify({ abi, bytecode}, null, 2);<br />
&nbsp; await fs.writeFile(&#39;Demo.json&#39;, artifact);<br />
}

// 这个方法不用改。拿过来用就好了<br />
function compile(sourceCode, contractName){<br />
&nbsp; const input = {<br />
&nbsp;&nbsp;&nbsp; language: &#39;Solidity&#39;,<br />
&nbsp;&nbsp;&nbsp; sources: { main: { content: sourceCode} },<br />
&nbsp;&nbsp;&nbsp; settings: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outputSelection: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;*&#39;: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;*&#39;: [&#39;abi&#39;, &#39;evm.bytecode&#39;]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp; }

&nbsp; const output = solc.compile(JSON.stringify(input));<br />
&nbsp; const artifact = JSON.parse(output).contracts.main[contractName];<br />
&nbsp; return {<br />
&nbsp;&nbsp;&nbsp; abi: artifact.abi,<br />
&nbsp;&nbsp;&nbsp; bytecode: artifact.evm.bytecode.object<br />
&nbsp; };<br />
}

main().then( () =&gt; process.exit(0) )</code></pre>

<p>运行node compile.js，</p>

<p>会生成需要的abi和bytecode</p>

<pre><code>cat&nbsp; Demo.json<br />
{<br />
&nbsp; &quot;abi&quot;: [<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;anonymous&quot;: false,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;inputs&quot;: [<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;indexed&quot;: false,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;internalType&quot;: &quot;string&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;message&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;string&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;Echo&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;event&quot;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;inputs&quot;: [<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;internalType&quot;: &quot;string&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;message&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;string&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;echo&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;outputs&quot;: [],<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;stateMutability&quot;: &quot;nonpayable&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;function&quot;<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp; ],<br />
&nbsp; &quot;bytecode&quot;: &quot;608060405234801561001057600080fd5b506101fd806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c8063f15da72914610030575b600080fd5b61004a600480360381019061004591906100f8565b61004c565b005b7fdb84d7c006c4de68f9c0bd50b8b81ed31f29ebeec325c872d36445c6565d757c828260405161007d9291906101a3565b60405180910390a15050565b600080fd5b600080fd5b600080fd5b600080fd5b600080fd5b60008083601f8401126100b8576100b7610093565b5b8235905067ffffffffffffffff8111156100d5576100d4610098565b5b6020830191508360018202830111156100f1576100f061009d565b5b9250929050565b6000806020838503121561010f5761010e610089565b5b600083013567ffffffffffffffff81111561012d5761012c61008e565b5b610139858286016100a2565b92509250509250929050565b600082825260208201905092915050565b82818337600083830152505050565b6000601f19601f8301169050919050565b60006101828385610145565b935061018f838584610156565b61019883610165565b840190509392505050565b600060208201905081810360008301526101be818486610176565b9050939250505056fea2646970667358221220ccf941ebb1736aee262be850feacdba6713c1bf3c13e588f4769077c5821570d64736f6c63430008100033&quot;</code></pre>

<p>部署的脚本：</p>

<pre><code>cat deploy.js<br />
const Web3 = require(&#39;web3&#39;);

const fs = require(&#39;fs&#39;)<br />
const {abi, bytecode} = JSON.parse(fs.readFileSync(&#39;Demo.json&#39;))

async function main(){<br />
&nbsp; // step1. 初始化web3 , 根据某个rpc server endpoint<br />
&nbsp; const network = process.env.ETHEREUM_NETWORK<br />
&nbsp; const web3 = new Web3(<br />
&nbsp;&nbsp;&nbsp; new Web3.providers.HttpProvider(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `https://${network}.infura.io/v3/${process.env.INFURA_PROJECT_ID}`<br />
&nbsp;&nbsp;&nbsp; )<br />
&nbsp; )

&nbsp; // step2. 创建签名用的东东<br />
&nbsp; const signer = web3.eth.accounts.privateKeyToAccount(<br />
&nbsp;&nbsp;&nbsp; process.env.SIGNER_PRIVATE_KEY<br />
&nbsp; )<br />
&nbsp; web3.eth.accounts.wallet.add(signer)

&nbsp; // step3. 初始化contract<br />
&nbsp; const contract = new web3.eth.Contract(abi)<br />
&nbsp; contract.options.data = bytecode

&nbsp; // step4. 发布该 contract<br />
&nbsp; const deployTx = contract.deploy()<br />
&nbsp; const deployedContract = await deployTx<br />
&nbsp;&nbsp;&nbsp; .send({<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from: signer.address, // 这里用到了signer的address<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gas: await deployTx.estimateGas()<br />
&nbsp;&nbsp;&nbsp; })<br />
&nbsp;&nbsp;&nbsp; .once(&#39;transactionHash&#39;, (txhash) =&gt; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(&quot;Mining deployment transaction ... &quot;, txhash)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(`https://${network}.etherscan.io/tx/${txhash}`)<br />
&nbsp;&nbsp;&nbsp; })

}

require(&#39;dotenv&#39;).config()<br />
main()</code></pre>

<p>部署：node deploy.js</p>

<p>不能连接网络，只能连接本地的网络</p>

<p><img height="238" src="/uploads/ckeditor/pictures/471/image-20220922162236-1.png" width="1536" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<div class="notranslate" style="all: initial;">&nbsp;</div>

