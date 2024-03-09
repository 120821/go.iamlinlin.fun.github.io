---
layout: post
title: "blockchain - truffle - local network"
date: "2022-09-22"
categories: 
---
<p><a href="http://siwei.me/blog/posts/blockchain-truffle-local-network-debug">http://siwei.me/blog/posts/blockchain-truffle-local-network-debug</a></p>

<p>turffle的使用：</p>

<p>运行部署</p>

<pre>
<code>truffle deploy --network=ganache</code></pre>

<p>运行某个脚本</p>

<pre>
<code>truffle exec &lt;yourfile.js&gt;</code></pre>

<p>查看帮助</p>

<pre>
<code>truffle help</code></pre>

<p>仅仅运行某个migration</p>

<pre>
<code>truffle migrate --f 9 --network=ganache</code></pre>

<p>$truffle develop</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/477/image-20220922175101-1.png" width="1920" /></p>

<p>$migrate</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/478/image-20220922175134-2.png" width="1920" /></p>

<p>这里出现报错是因为整个文件内容都被我注释了，因为有许多文件需要测试。</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/479/image-20220922175226-3.png" width="1920" /></p>

<p>取消注释后，仍然出现报错，但是报错内容已经发生变化&nbsp; <a href="https://blog.csdn.net/sanqima/article/details/109150618">解决</a></p>

<p>&quot;Could not find artifacts for &quot; + import_path + &quot; from any sources&quot;： 实际上，它是因为 <font color="pink">找不到合约文件而报错</font>。</p>

<p>Could not find artifacts for First from any sources： 告诉我们找不到contract的文件</p>

<p>、需要修改如下三个地方：<br />
&emsp; &emsp; 1）项目路径/contracts下，要有artificial.sol文件，</p>

<p>2）项目路径/migrations/2_deploy_contracts.js，里修改如下：<br />
//项目路径/migrations/2_deploy_contracts.js</p>

<p>const ZhouWuToken = artifacts.require(&quot;contract-name&quot;);</p>

<p>module.exports = function(deployer) {<br />
&nbsp; deployer.deploy(Contract-name);<br />
};</p>

<pre><code>truffle deploy --network ganacheNet --verbose-rpc --interactive --reset</code></pre>

<p>使用这个命令可以进行合约的重新部署。--network 可以进行网络的选择，根据配置文件的内容进行书写。</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

