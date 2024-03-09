---
layout: post
title: "linux - python proxy pproxy - https -> socks5 让docker/或者啥使用socks5 proxy apt-get curl wget "
date: "2022-06-11"
categories: 
---
<h3>PProxy: python proxy</h3>

<div>先安装python3&nbsp; , pip3</div>

<div>然后 pip3 install pproxy</div>

<p>使用： pproxy -r socks5://127.0.0.1:1099 -vv</p>

<p>先在本地运行起一个 socks5 server , 跑在 1099端口</p>

<div>然后，在docker中，就可以设置这些变量：( 我的docker host 是 192.168.10.3)</div>

<pre class="hljs bash">
<span class="hljs-built_in">export</span> HTTP_PROXY=<span class="hljs-string">&quot;http://192.168.10.3:8080&quot;</span>
<span class="hljs-built_in">export</span> HTTPS_PROXY=<span class="hljs-string">&quot;http://192.168.10.3:8080&quot;</span>
<span class="hljs-built_in">export</span> http_proxy=<span class="hljs-string">&quot;http://192.168.10.3:8080&quot;</span>
<span class="hljs-built_in">export</span> https_proxy=<span class="hljs-string">&quot;http://192.168.10.3:8080&quot;</span>{% endhighlight %}

