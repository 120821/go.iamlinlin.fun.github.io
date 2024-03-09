---
layout: post
title: "linux - lsof 命令 查看端口运行"
date: "2022-10-25"
categories: 
---
<p><a href="https://www.cnblogs.com/peida/archive/2013/02/26/2932972.html">https://www.cnblogs.com/peida/archive/2013/02/26/2932972.html</a></p>

<p>使用：</p>

<p><strong>sudo lsof -i:3306&nbsp; 查看3306端口的进程</strong></p>

<p>命令：</p>

<pre>
<code>lsof -i:端口号</code></pre>

<p>实例14：列出所有tcp 网络连接信息</p>

<p>命令：</p>

<pre>
<code>lsof -i tcp</code></pre>

<p>实例15：列出所有udp网络连接信息</p>

<p>命令：</p>

<pre>
<code>lsof -i udp</code></pre>

<p>实例16：列出谁在使用某个端口</p>

<p>命令：</p>

<pre>
<code>lsof -i :3306</code></pre>

<p>实例17：列出谁在使用某个特定的udp端口</p>

<p>命令：</p>

<pre>
<code>lsof -i udp:55</code></pre>

<p>或者：特定的tcp端口</p>

<p>命令：</p>

<pre>
<code>lsof -i tcp:80</code></pre>

<p>实例18：列出某个用户的所有活跃的网络端口</p>

<p>命令：</p>

<pre>
<code>lsof -a -u test -i</code></pre>

<p>实例19：列出所有网络文件系统</p>

<p>命令：</p>

<pre>
<code>lsof -N</code></pre>

<p>实例20：域名socket文件</p>

<p>命令：</p>

<pre>
<code>lsof -u</code></pre>

<p>实例21：某个用户组所打开的文件信息</p>

<p>命令：</p>

<pre>
<code>lsof -g 5555</code></pre>

