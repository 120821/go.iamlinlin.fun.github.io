---
layout: post
title: "async-dns ruby  caddy dig baidu.com"
date: "2022-11-04"
categories: 
---
<p><a href="https://github.com/socketry/async-dns">https://github.com/socketry/async-dns</a></p>

<p>使用脚本：get_domain_ip_and_type.rb</p>

<pre>&nbsp;&nbsp;&nbsp;<code> require &#39;async/dns&#39;<br />
&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp; &nbsp;class TestServer &lt; Async::DNS::Server<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;def process(name, resource_class, transaction)<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;@resolver ||= Async::DNS::Resolver.new([[:udp, &#39;8.8.8.8&#39;, 53], [:tcp, &#39;8.8.8.8&#39;, 53]])<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;transaction.passthrough!(@resolver)<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;end<br />
&nbsp;&nbsp; &nbsp;end<br />
&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp; &nbsp;server = TestServer.new([[:udp, &#39;127.0.0.1&#39;, 2346]])<br />
&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp; &nbsp;server.run</code></pre>

<p>运行在2346端口</p>

<pre><code>dig @localhost -p 2346 google.com</code></pre>

<p>即可看到域名的详细信息</p>

<p>写一个接口：</p>

<pre><code>subdomain do<br />
&nbsp; get &quot;/new_domain/:name&quot; do<br />
&nbsp;&nbsp;&nbsp; name = params[:name]<br />
&nbsp;&nbsp;&nbsp; result = `dig @localhost -p 2346 #{name}`<br />
&nbsp;&nbsp;&nbsp; logger.info result<br />
&nbsp;&nbsp;&nbsp; b = result.to_s.split(&#39;;; QUESTION SECTION:&#39;).last.split(&#39;;; ANSWER SECTION:&#39;).first<br />
&nbsp;&nbsp;&nbsp; domain_type = b.split(&#39;IN&#39;).last.strip<br />
&nbsp;&nbsp;&nbsp; logger.info &quot;==== domain_type:#{domain_type}&quot;<br />
&nbsp;&nbsp;&nbsp; c = result.to_s.split(&#39;;; ANSWER SECTION:&#39;).last.split(&#39;;; Query time&#39;).first.split(&#39;IN&#39;).last.strip<br />
&nbsp;&nbsp;&nbsp; domain_ip = c.to_s[2, c.size]<br />
&nbsp;&nbsp;&nbsp; logger.info &quot;=== domain_ip:#{domain_ip}&quot;

&nbsp;&nbsp;&nbsp; json({<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result: &#39;ok&#39;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domain_name: name,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domain_ip: domain_ip,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domain_type: domain_type<br />
&nbsp;&nbsp;&nbsp; }

&nbsp; end<br />
end</code></pre>

<p>修改caddyfile</p>

<pre><code>handle_path /ipfs/* {<br />
&nbsp;&nbsp;&nbsp; reverse_proxy 127.0.0.1:2346<br />
&nbsp; }</code></pre>

<p>caddy restart</p>

<p><img height="193" src="/uploads/ckeditor/pictures/690/image-20221104115008-1.png" width="722" /></p>

