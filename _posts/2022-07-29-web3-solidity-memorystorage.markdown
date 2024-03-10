---
layout: post
title: "web3 - solidity - 参数是 memory 与 storage的区别 "
date: "2022-07-29"
categories: 
---
<p><a href="http://siwei.me/blog/posts/blockchain-web3-solidity-memory-storage">http://siwei.me/blog/posts/blockchain-web3-solidity-memory-storage</a></p>
<p>memory:&nbsp; 放在EVM内存中</p>
<p>storage: 持久化在 block上</p>
<p>所以到时候查询一下放在那里合适。</p>
<p>contract的constructor中的参数都是memory</p>
