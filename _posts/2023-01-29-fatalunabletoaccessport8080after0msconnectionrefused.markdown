---
layout: post
title: "fatal: unable to access port 8080 after 0 ms: Connection refused"
date: "2023-01-29"
categories: 
---
<p>使用git的时候，出现这样的错误：</p>

<pre>
<code>fatal: unable to access port 8080 after 0 ms: Connection refused</code></pre>

<p>或者</p>

<pre>
<code>Failed to connect to 127.0.0.1 port 8080 after 0 ms: Connection refused</code></pre>

<p>就是网络出现问题了，看一下是否开启了代理。trojan和proxy，以及是否已经source环境文件。</p>

