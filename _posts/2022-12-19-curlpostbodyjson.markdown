---
layout: post
title: "curl post body json"
date: "2022-12-19"
categories: 
---
<p>refer: <a href="https://reqbin.com/curl">https://reqbin.com/curl</a></p>

<p>使用-X POST 进行post，使用 -d传递参数</p>

<pre>
<code>curl -X POST https://reqbin.com/echo/post/json -H &#39;Content-Type: application/json&#39; -d &#39;{&quot;login&quot;:&quot;my_login&quot;,&quot;password&quot;:&quot;my_password&quot;}&#39;</code></pre>

<p>使用proxy进行post</p>

<pre>
<code>curl -ipv4 --socks5 #{ip}:#{port} #{url} -H &#39;Content-Type: application/json&#39; -d &#39;{&quot;id&quot;:&quot;#{i}&quot;}&#39;</code></pre>

<p><code>此时不必要使用-X POST</code></p>

<p>Note: Unnecessary use of -X or --request, POST is already inferred.</p>

