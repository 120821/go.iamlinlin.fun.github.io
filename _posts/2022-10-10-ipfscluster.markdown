---
layout: post
title: "在远程 安装使用ipfs cluster"
date: "2022-10-10"
categories: 
---
<p><a href="http://www.siwei.me/blog/posts/blockchain-ipfs-setup-ipfs-on-linux-server">http://www.siwei.me/blog/posts/blockchain-ipfs-setup-ipfs-on-linux-server</a></p>

<p>在测试服务器：</p>

<pre><code>&nbsp;wget https://dist.ipfs.tech/ipfs-cluster-ctl/v1.0.2/ipfs-cluster-ctl_v1.0.2_linux-amd64.tar.gz</code></pre>

<p>解压缩：</p>

<pre><code>tar zxvf ipfs-cluster-ctl_v1.0.2_linux-amd64.tar.gz

cd ipfs-cluster-ctl/</code></pre>

<p>获取文件：</p>

<pre><code>wget https://raw.githubusercontent.com/ipfs/ipfs-cluster/v1.0.2/docker-compose.yml</code></pre>

<pre>启动：<code>sudo docker-compose up</code></pre>

<pre>在新的窗口：<code>vim hi.txt</code></pre>

<pre><code>./ipfs-cluster-ctl add hi.txt

added QmXQrn3noXsMWHzHUUxZPWXQvdqEUZ2SurqzUVPKGLjE8t hi.txt</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

