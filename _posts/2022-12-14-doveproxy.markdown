---
layout: post
title: "dove proxy的使用"
date: "2022-12-14"
categories: 
---
<p>官网： <a href="https://doveip.com/index.php?s=/index/index.html&amp;lang=en-us">https://doveip.com/index.php?s=/index/index.html&amp;lang=en-us</a></p>

<p>在官网进行登录，就可以使用了。</p>

<p>使用的时候优先使用curl，这样便于修改为ruby的代码，写进脚本进行使用。<a href="https://doveip.com/index.php?s=/api_interface/index.html&amp;lang=en-us#show-curl">https://doveip.com/index.php?s=/api_interface/index.html&amp;lang=en-us#show-curl</a></p>

<p>curl的方法是这样：</p>

<div class="api-back">
<pre>
<code>1.get token
curl -d &quot;user=abcd&amp;password=abcd&quot; https://dvapi.doveproxy.net/cmapi.php?rq=login
{&quot;errno&quot;:200,&quot;msg&quot;:&quot;Success&quot;,&quot;data&quot;:{&quot;token&quot;:&quot;OXhRbHd2MHVvaWZKckd2Vml0SVArUT09&quot;}}
token是会变化的，但是时间不清楚。
2.get proxy ip
curl -ipv4 -d &quot;user=abc&amp;token=OXhRbHd2MHVvaWZKckd2Vml0SVArUT09&amp;geo=mx&quot; https://dvapi.doveproxy.net/cmapi.php?rq=distribute
{&quot;errno&quot;:200,&quot;msg&quot;:&quot;Success&quot;,&quot;data&quot;:{&quot;geo&quot;:&quot;mx&quot;,&quot;ip&quot;:&quot;47.253.12.97&quot;,&quot;port&quot;:40004,&quot;d_ip&quot;:&quot;189.203.105.247&quot;}}
ip:是你即将使用的代理的ip，d_ip是访问的ip，port是端口。
3.used proxy ip
curl -ipv4 --socks5 47.253.12.97:40004 https://www.google.com{% endhighlight %}

<p>实际的使用步骤是这样的，首先获得token，使用curl命令输入自己的用户和密码，然后就可以获得对应的token。接着，获得ip的方法使用刚才获得的token和自己的用户名与密码，可以获得对应的ip。最后，使用代理ip，仍然是使用curl命令。即可。</p>

<pre>
<code>curl -ipv4 --socks5 &lt;你的ip&gt;:&lt;你的端口&gt; https://curl.se/docs/sslcerts.html{% endhighlight %}

<pre>
<code>*&nbsp;&nbsp; Trying 44.193.164.123:58195...

* SOCKS5 connect to IPv4 151.101.193.91:443 (locally resolved)

* SOCKS5 request granted.

* Connected to (nil) (44.193.164.123) port 58195 (#0)

* ALPN, offering h2{% endhighlight %}

<p>ls，查看curl到的数据就是页面 对应的内容，OK。</p>

<p>&nbsp;</p>
</div>

