---
layout: post
title: " sync-dns - 域名解析的相关内容（A记录，TXT记录，CNAME 等等）"
date: "2022-11-03"
categories: 
---
<p><a href="https://github.com/socketry/async-dns">https://github.com/socketry/async-dns</a></p>
<p>1.安装：</p>
<p>在Gemfile增加：</p>
<p>gem &#39;async-dns&#39;</p>
<p>然后使用bundle安装：</p>
<p>bundle install</p>
<p>2.使用</p>
<p>创建一个脚本：sync-dns.rb</p>
<p>&nbsp;&nbsp;&nbsp; require &#39;async/dns&#39;<br />
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
&nbsp;&nbsp; &nbsp;server.run</p>
<p>然后运行这个脚本，ruby sync-dns.rb</p>
<p><img height="97" src="/uploads/ckeditor/pictures/680/image-20221103154024-1.png" width="1519" /></p>
<p>打开新的窗口：</p>
<p>使用dig命令：</p>
<p>dig @localhost -p 2346 google.com</p>
<p>dig @localhost -p 2346 baidu.com</p>
<p><img height="944" src="/uploads/ckeditor/pictures/681/image-20221103154046-2.png" width="810" /></p>
