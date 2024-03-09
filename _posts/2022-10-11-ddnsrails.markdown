---
layout: post
title: "ddns rails 部署"
date: "2022-10-11"
categories: 
---
<pre>
修改数据库之后：在环境文件增加（config/environments/production.rb或者config/environments/development.rb）：
<code>config.hosts &lt;&lt; &quot;rails.test-ddns.com&quot;</code></pre>

<p>这样，在启动caddy和rails server 之后，才会显示正常的页面</p>

<p>caddy file增加：</p>

<pre># 对应 ddns_rails项目<br />
<code>rails.test-ddns.com {<br />
&nbsp; reverse_proxy 127.0.0.1:8888<br />
&nbsp; log {<br />
&nbsp;&nbsp;&nbsp; output file /var/log/access-rails-test-ddns.log<br />
&nbsp; }<br />
}</code></pre>

<p>&nbsp;</p>

