---
layout: post
title: "discord linux proxy update "
date: "2023-02-15"
categories: 
---
<p><a href="http://siwei.me/blog/posts/blockchain-pc-discord-windows-linux">http://siwei.me/blog/posts/blockchain-pc-discord-windows-linux</a></p>
<p>1.下载discord <a href="https://discord.com/api/download?platform=linux&amp;format=deb">https://discord.com/api/download?platform=linux&amp;format=deb</a></p>
<p>2.安装</p>
{% highlight html %}sudo dpkg -i xxx.deb{% endhighlight %}
<p>配置proxy</p>
{% highlight html %}pproxy -r socks5://127.0.0.1:1090 -vv{% endhighlight %}
{% highlight html %}pproxy -r socks5://127.0.0.1:1090 -vv
Serving on :8080 by http,socks4,socks5
Start server failed.
&nbsp;&nbsp; &nbsp;==&gt; [Errno 98] error while attempting to bind on address (&#39;::&#39;, 8080, 0, 0): address already in use
linlin@linlin-i5:/workspace$ sudo lsof -i:8080
[sudo] password for linlin:
COMMAND&nbsp;&nbsp; PID USER&nbsp;&nbsp; FD&nbsp;&nbsp; TYPE DEVICE SIZE/OFF NODE NAME
autok3s 10612 root&nbsp;&nbsp;&nbsp; 8u&nbsp; IPv6&nbsp; 83782&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP *:http-alt (LISTEN)
linlin@linlin-i5:/workspace$ kill -9 10612
bash: kill: (10612) - Operation not permitted
linlin@linlin-i5:/workspace$ sudo kill -9 10612
linlin@linlin-i5:/workspace$ sudo lsof -i:8080
linlin@linlin-i5:/workspace$&nbsp; pproxy -r socks5://127.0.0.1:1090 -vv
Serving on :8080 by http,socks4,socks5
2023-02-14 11:19:19 http 127.0.0.1:50478 -&gt; socks5 127.0.0.1:1090 -&gt; discord.com:443
2023-02-14 11:20:49 http 127.0.0.1:36284 -&gt; socks5 127.0.0.1:1090 -&gt; discord.com:443
2023-02-14 11:20:50 http 127.0.0.1:36300 -&gt; socks5 127.0.0.1:1090 -&gt; dl.discordapp.net:443
2023-02-14 11:20:56 http 127.0.0.1:45658 -&gt; socks5 127.0.0.1:1090 -&gt; discordapp.com:443{% endhighlight %}
<p>3.使用</p>
{% highlight html %}env http_proxy=http://127.0.0.1:8080 https_proxy=http://127.0.0.1:8080 /usr/bin/discord --proxy-server=&quot;http://127.0.0.1:8080&quot;{% endhighlight %}
{% highlight html %}cd /home/linlin/Downloads/
linlin@linlin-i5:~/Downloads$ sudo dpkg -i discord
discord-0.0.24(1).deb&nbsp; discord-0.0.24.deb&nbsp;&nbsp;&nbsp;&nbsp; discord-0.0.25.deb&nbsp;&nbsp;&nbsp;&nbsp; discord.deb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
linlin@linlin-i5:~/Downloads$ sudo dpkg -i discord-0.0.25.deb
[sudo] password for linlin:
(Reading database ... 390950 files and directories currently installed.)
Preparing to unpack discord-0.0.25.deb ...
Unpacking discord (0.0.25) over (0.0.24) ...
Setting up discord (0.0.25) ...
Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
Processing triggers for gnome-menus (3.36.0-1ubuntu3) ...
Processing triggers for desktop-file-utils (0.26-1ubuntu3) ...
linlin@linlin-i5:~/Downloads$ env http_proxy=http://127.0.0.1:8080 https_proxy=http://127.0.0.1:8080 /usr/bin/discord --proxy-server=&quot;http://127.0.0.1:8080&quot;
Discord 0.0.25
Starting app.
Removing old directory&nbsp; 0.0.24
Starting updater.
2023-02-14T03:20:49.441Z [Modules] Modules initializing
2023-02-14T03:20:49.441Z [Modules] Distribution: remote
2023-02-14T03:20:49.441Z [Modules] Host updates: enabled
2023-02-14T03:20:49.441Z [Modules] Module updates: enabled{% endhighlight %}
<p>&nbsp;</p>
