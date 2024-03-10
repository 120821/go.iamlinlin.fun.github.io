---
layout: post
title: "sthp-linux proxy的使用"
date: "2023-08-03"
categories: 
---
<p>refer: <a href="https://siwei.me/blog/posts/linux-windows-proxy-sthp-socks5-https-http">https://siwei.me/blog/posts/linux-windows-proxy-sthp-socks5-https-http</a></p>
<p>1.先到GitHub下载需要的sthp,在assets里找到自己需要的版本。</p>
{% highlight html %}https://github.com/KaranGauswami/socks-to-http-proxy/releases
/Downloads$ ll | grep sthp
-rw-rw-r--&nbsp; 1 linlin linlin&nbsp;&nbsp;&nbsp; 8696024&nbsp; 8月&nbsp; 3 09:56 sthp-linux{% endhighlight %}
<p>2.我下载了linux版本的，进行安装：<br />
首先变为可执行的文件</p>
{% highlight html %}chmod +x sthp-linux
./sthp-linux{% endhighlight %}
<p>已经可以执行，设置端口号等配置，使用自己喜欢的端口：</p>
{% highlight html %}~/Downloads$ chmod +x sthp-linux
linlin@linlin-i5:~/Downloads$ ./sthp-linux
The application panicked (crashed).
Message:&nbsp; error binding to 0.0.0.0:8080: error creating server listener: Address already in use (os error 98)
Location: /home/runner/.cargo/registry/src/index.crates.io-6f17d22bba15001f/hyper-0.14.26/src/server/server.rs:79{% endhighlight %}
<p>查看本地的trojan的端口：</p>
{% highlight html %}lsof -i:1090
COMMAND&nbsp;&nbsp;&nbsp; PID&nbsp;&nbsp; USER&nbsp;&nbsp; FD&nbsp;&nbsp; TYPE&nbsp;&nbsp; DEVICE SIZE/OFF NODE NAME
trojan&nbsp;&nbsp;&nbsp; 5250 linlin&nbsp;&nbsp;&nbsp; 9u&nbsp; IPv4 12222482&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:1090-&gt;localhost:47714 (ESTABLISHED)
trojan&nbsp;&nbsp;&nbsp; 5250 linlin&nbsp;&nbsp; 11u&nbsp; IPv4 12307365&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:1090-&gt;localhost:59382 (ESTABLISHED)
trojan&nbsp;&nbsp;&nbsp; 5250 linlin&nbsp;&nbsp; 15u&nbsp; IPv4 11970800&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:1090-&gt;localhost:56768 (ESTABLISHED)
trojan&nbsp;&nbsp;&nbsp; 5250 linlin&nbsp;&nbsp; 19u&nbsp; IPv4 11987105&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:1090-&gt;localhost:50130 (ESTABLISHED)
trojan&nbsp;&nbsp;&nbsp; 5250 linlin&nbsp;&nbsp; 25u&nbsp; IPv4 12206549&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:1090-&gt;localhost:40988 (ESTABLISHED)
trojan&nbsp;&nbsp;&nbsp; 5250 linlin&nbsp;&nbsp; 45u&nbsp; IPv4 12298435&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:1090-&gt;localhost:52140 (ESTABLISHED){% endhighlight %}
<p>设置端口：启动sthp:</p>
{% highlight html %}~/Downloads$ ./sthp-linux&nbsp; -p 8090 -s 127.0.0.1:1090{% endhighlight %}
<p>写一个文件：~/env_source_env</p>
<p>内容：</p>
{% highlight html %}&nbsp;&nbsp; {% highlight html %}export HTTP_PROXY=&quot;http://127.0.0.1:8090&quot;
&nbsp;&nbsp; export HTTPS_PROXY=&quot;http://127.0.0.1:8090&quot;
&nbsp;&nbsp; export http_proxy=&quot;http://127.0.0.1:8090&quot;
&nbsp;&nbsp; export https_proxy=&quot;http://127.0.0.1:8090&quot;{% endhighlight %}{% endhighlight %}
<p>{% highlight html %}打开一个新的命令行窗口：{% endhighlight %}</p>
{% highlight html %}{% highlight html %}echo $HTTP_PROXY{% endhighlight %}{% endhighlight %}
<p>{% highlight html %}返回空，{% endhighlight %}</p>
{% highlight html %}{% highlight html %}source ~/env_source_env
linlin@linlin-i5:/workspace/dongtaipaifang_2_backend$ echo $HTTP_PROXY
http://127.0.0.1:8090{% endhighlight %}{% endhighlight %}
<p>{% highlight html %}这个时候，访问谷歌就非常快了，安装go react的依赖也会非常快。不会出现timeout的情况。{% endhighlight %}</p>
{% highlight html %}{% highlight html %}curl google.com
&lt;HTML&gt;&lt;HEAD&gt;&lt;meta http-equiv=&quot;content-type&quot; content=&quot;text/html;charset=utf-8&quot;&gt;
&lt;TITLE&gt;301 Moved&lt;/TITLE&gt;&lt;/HEAD&gt;&lt;BODY&gt;
&lt;H1&gt;301 Moved&lt;/H1&gt;
The document has moved
&lt;A HREF=&quot;http://www.google.com/&quot;&gt;here&lt;/A&gt;.
&lt;/BODY&gt;&lt;/HTML&gt;{% endhighlight %}{% endhighlight %}
<p>{% highlight html %}安装或者运行go{% endhighlight %}</p>
{% highlight html %}{% highlight html %}go run main.go
go: downloading github.com/gin-gonic/gin v1.9.1
go: downloading github.com/gin-contrib/cors v1.4.0
go: downloading github.com/go-ini/ini v1.67.0{% endhighlight %}
&nbsp;{% endhighlight %}
<p>{% highlight html %}&nbsp;{% endhighlight %}</p>
