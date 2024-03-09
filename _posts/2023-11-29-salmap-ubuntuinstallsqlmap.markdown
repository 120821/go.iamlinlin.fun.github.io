---
layout: post
title: "salmap - ubuntu install sqlmap"
date: "2023-11-29"
categories: 
---
<p>1.查看python的版本，并且更新依赖</p>

<pre>
<code>python3 --version</code></pre>

<p>我得到了：</p>

<pre>
<code><span style="color:#ffd700">Python</span> <span style="color:#f5ab35">3</span>.10.<span style="color:#f5ab35">12</span></code></pre>

<p>那么更新软件包列表：</p>

<pre>
<code>sudo apt update</code></pre>

<p>2.安装sqlmap</p>

<pre>
<code>sudo apt install sqlmap</code></pre>

<p>3.查看安装的版本：</p>

<pre>
<code>sqlmap <span style="color:#d4d0ab">--version</span></code></pre>

<p>得到了：</p>

<pre>
<code>sqlmap --version

1.6.4#stable

[09:09:05] [WARNING] your sqlmap version is outdated</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

