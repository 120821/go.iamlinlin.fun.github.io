---
layout: post
title: "nginx default site(ubuntu nginx下有多个virtual host, 配置其中的某一个是默认的host，http://定向为https://)"
date: "2023-10-23"
categories: 
---
<p>ubuntu nginx下有多个virtual host, 如何 配置其中的某一个是默认的host:</p>

<p>1.设置default_site</p>

<pre>
<code>listen <span style="color:#f5ab35">80</span> default_server<span style="color:#d4d0ab">;</span></code></pre>

<p>增加上面这一行就可以了。</p>

<p>如果是443：</p>

<pre>
<code><span style="color:#00e0e0">server</span> {
    <span style="color:#ffd700">listen</span> <span style="color:#f5ab35">443</span> ssl default_server;
    <span style="color:#ffd700">server_name</span> c.com www.c.com;
    <span style="color:#d4d0ab"># SSL 配置...</span>
    <span style="color:#d4d0ab"># 其他配置项...</span>
}</code></pre>

<p>例如我有域名a.com, b.com, c.com, 都在服务器d绑定，现在访问<a href="https://c.com" target="_blank">https://c.com</a>, 可以访问<a href="https://c.com" target="_blank">https://c.com</a>, 但是访问<a href="http://c.com%E4%BC%9A%E8%B7%B3%E8%BD%AC%E5%88%B0a.com" target="_blank">http://c.com会跳转到a.com</a>, 在nginx配置文件的c.com里增加listen 80 default_server(需要保证a.com没有设置Default_server）</p>

<p>2.把http://c.com设置为自动跳转到https://c.com,增加一段server</p>

<pre>
<code><span style="color:#00e0e0">server</span> {
    <span style="color:#ffd700">listen</span> <span style="color:#f5ab35">80</span>;
    <span style="color:#ffd700">server_name</span> c.com www.c.com;
    <span style="color:#ffd700">return</span> <span style="color:#f5ab35">301</span> https://c.com$request_uri;
}</code></pre>

