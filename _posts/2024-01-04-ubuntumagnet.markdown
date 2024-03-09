---
layout: post
title: "ubuntu magnet 的简单使用"
date: "2024-01-04"
categories: 
---
<p>refer： <a href="https://superuser.com/questions/1334218/how-can-i-download-magnet-links-through-the-command-line-with-rtorrent-on-linux">https://superuser.com/questions/1334218/how-can-i-download-magnet-links-through-the-command-line-with-rtorrent-on-linux</a></p>

<p>1.在下载windows ISO镜像文件的时候，发现有一些魔力文件链接，搜索后知道了使用方法 rtorrent</p>

<p>2.进入teminal,测试rtorrent是否可以使用，不能使用就首先安装</p>

<p>re<code>sudo apt install rtoorent</code></p>

<p>3.使用rtoorent下载镜像文件：（rtorrent + &quot;url&quot;,注意需要加上双引号或单引号），我使用后发现资源已经被取消了，尝试关闭，发现Ctrl c不能关闭，只能ps -ef | grep rtorrent之后再kill -9 关闭进程</p>

<pre>
<code>rtorrent &#39;magnet link in quotes&#39;</code></pre>

