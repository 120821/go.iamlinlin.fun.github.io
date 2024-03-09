---
layout: post
title: "nohup 的使用 setsid"
date: "2022-10-13"
categories: 
---
<p><a href="http://www.siwei.me/blog/posts/linux-nohup-setsid-nohup">linux - nohup &amp; 的新用法： setsid nohup ... &amp; </a></p>

<p>在最新的版本（ubuntu 20 + ）中，仅仅使用 nohup ... &amp; 是不行的</p>

<p>解决办法： 前面加上 setsid</p>

<pre><code>setsid nohup bundle exec ruby app.rb &amp;</code></pre>

<p>如果仍然不起作用：查看nohup的log nohup.out</p>

<p>可能是gem没有安装等，可以进行处理</p>

