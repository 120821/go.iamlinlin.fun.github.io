---
layout: post
title: "go build 使用caddy"
date: "2022-10-21"
categories: 
---
<p><a href="https://caddyserver.com/docs/build">https://caddyserver.com/docs/build</a></p>

<pre>
<code class="cmd bash">获得资源
git clone &quot;https://github.com/caddyserver/caddy.git&quot;</code></pre>

<p><img height="234" src="/uploads/ckeditor/pictures/598/image-20221021104834-2.png" width="826" /></p>

<p>安装go：apt install golang-go</p>

<p>需要安装1.17以及之后的版本</p>

<p>根据系统安装的是1.10的。因此会报错</p>

<p><a href="https://www.cyberciti.biz/faq/how-to-install-gol-ang-on-ubuntu-linux/">可以搜索go</a>：sudo apt search golang-go</p>

<p><a href="https://gist.github.com/nikhita/432436d570b89cab172dcf2894465753">可以删除本地的go：</a></p>

<pre>
<code>sudo rm -rf /usr/local/go</code></pre>

<p><code><a href="https://tecadmin.net/install-go-on-ubuntu/">安装1.17</a>：</code>wget https://dl.google.com/go/go1.17.7.linux-amd64.tar.gz</p>

<p>解压缩：sudo tar -xvf go1.17.7.linux-amd64.tar.gz</p>

<p>查看版本以及位置：</p>

<p><img height="97" src="/uploads/ckeditor/pictures/600/image-20221021111321-2.png" width="501" /></p>

<p><code>服务器上的go是在这个文件夹：</code>usr/bin/go</p>

<p>那么进行替换即可</p>

<p>服务器上是:&nbsp;mv usr/local/go/bin/go usr/bin/go</p>

<p>然后这里只有一个这个文件了：ls usr/local/go/bin/</p>

<p><img height="95" src="/uploads/ckeditor/pictures/601/image-20221021111407-3.png" width="737" /></p>

<p>查看版本，已经是1.17了，进行运行</p>

<p><img height="701" src="/uploads/ckeditor/pictures/599/image-20221021110932-1.png" width="941" /></p>

