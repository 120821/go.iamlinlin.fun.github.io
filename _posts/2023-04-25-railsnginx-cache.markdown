---
layout: post
title: "在rails 使用nginx - 缓存 cache"
date: "2023-04-25"
categories: 
---
<p>在Rails中，可以使用Nginx的缓存机制来提高网站性能。下面是如何使用Nginx缓存：</p>

<p>1.安装Nginx</p>

<p>在使用Nginx缓存之前，必须要安装Nginx。可以通过以下命令在Ubuntu上安装Nginx：</p>

<pre>
<code>sudo apt-get update
sudo apt-get install nginx</code></pre>

<ol start="2">
	<li>配置Nginx缓存</li>
</ol>

<p>在Nginx的配置文件中，可以配置Nginx的缓存。在Ubuntu上，Nginx的配置文件为 <code>/etc/nginx/nginx.conf</code>。</p>

<p>首先，需要在Nginx配置文件的http块中添加缓存目录的路径和缓存的最大大小。例如：</p>

<pre>
<code>http {
  # ...
  proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m inactive=60m;
  proxy_cache_key &quot;$scheme$request_method$host$request_uri&quot;;
  proxy_cache_valid 200 60m;
  # ...
}</code></pre>

<p>上述代码中，<code>proxy_cache_path</code>指定了缓存目录的路径，<code>levels</code>指定了目录的层数，<code>keys_zone</code>指定了缓存的名称和大小，<code>inactive</code>指定了缓存的最长时间。<code>proxy_cache_key</code>指定了缓存的键，<code>proxy_cache_valid</code>指定了缓存的有效时间。</p>

<ol start="3">
	<li>启用Nginx缓存</li>
</ol>

<p>在Rails的配置文件中，可以启用Nginx缓存。在使用Proxy Pass的情况下，可以添加以下代码：</p>

<pre>
<code>location / {
  proxy_pass http://rails_app;
  proxy_cache my_cache;
}</code></pre>

<p>上述代码中，<code>proxy_cache</code>指定了使用的缓存名称。</p>

<ol start="4">
	<li>刷新缓存</li>
</ol>

<p>在使用Nginx缓存时，如果需要刷新缓存，可以使用以下命令：</p>

<pre>
<code>sudo nginx -s reload</code></pre>

<p>这将重新加载Nginx的配置文件，并删除已经缓存的内容。</p>

<p>总结</p>

<p>在Rails中，可以通过使用Nginx缓存来提高网站性能。这需要在Nginx中配置缓存目录和缓存的最大大小，并在Rails的配置文件中启用Nginx缓存。可以通过<code>sudo nginx -s reload</code>命令来刷新缓存。</p>

