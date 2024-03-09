---
layout: post
title: "blockchain ganache本地连接网络HTTP://127.0.0.1:7545 network：5777"
date: "2022-09-22"
categories: 
---
<p>进入文件夹，启动ganache</p>

<pre>
<code>~/Downloads$&nbsp; ./ganache-2.5.4-linux-x86_64.AppImage</code></pre>

<p>连接网络</p>

<p><img height="264" src="/uploads/ckeditor/pictures/473/image-20220922171331-1.png" width="1129" /></p>

<p>进行编译合约：</p>

<p><code>/workspace/blockchain/contract_on_goerli_using_infura$ truffle migrate --network development</code></p>

<p><img height="528" src="/uploads/ckeditor/pictures/474/image-20220922172221-1.png" width="1920" /></p>

<p>/workspace/blockchain/contract_on_goerli_using_infura$ truffle migrate --network https://localhost:7545</p>

<p>提示需要把network写进配置文件，</p>

<p>也可以在.env文件进行network的选择<img height="126" src="/uploads/ckeditor/pictures/475/image-20220922173747-2.png" width="1005" /></p>

<p>使用grep &#39;network&#39; . -r</p>

<p>查询到很多的文件，最多的就是node_modules， 最匹配的是js文件：./truffle-config.js</p>

<p><img height="381" src="/uploads/ckeditor/pictures/476/image-20220922174244-1.png" width="840" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

