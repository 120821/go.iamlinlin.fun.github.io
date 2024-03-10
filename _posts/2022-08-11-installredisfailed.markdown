---
layout: post
title: "install Redis failed"
date: "2022-08-11"
categories: 
---
<p>在创建chatroom的时候，参照这篇文章，安装Redis，实现异步：https://iridakos.com/programming/2019/04/04/creating-chat-application-rails-websockets</p>
<pre class="highlight">
{% highlight html %}<span class="nb">sudo </span>apt update
<span class="nb">sudo </span>apt <span class="nb">install </span>redis-server
{% endhighlight %}
<pre class="highlight">
{% highlight html %}$ redis-cli
127.0.0.1:6379&gt; ping
PONG{% endhighlight %}
<p>有Redis，但是没有 server</p>
<p><img height="624" src="/uploads/ckeditor/pictures/202/image-20220811090343-2.png" width="1696" /></p>
<p><img height="243" src="/uploads/ckeditor/pictures/203/image-20220811090458-1.png" width="863" /></p>
<p>根据提示修改文件</p>
<p>sudo&nbsp; vim /etc/apt/sources.list</p>
<p>把不是阿里云的都注释了。（不要手动增加#）</p>
<p>继续查看Redis版本</p>
<p>redis-server<br />
No version is set for command redis-server<br />
Consider adding one of the following versions in your config file at<br />
redis 4.0.9</p>
<p>查看redis-server安装在哪里<br />
linlin@linlin-i5:/workspace/chatroom-rails$ which redis-server<br />
/home/linlin/.asdf/shims/redis-server</p>
<p>查看asdf怎么使用<br />
linlin@linlin-i5:/workspace/chatroom-rails$ asdf --help<br />
version: v0.9.0-9ee24a3</p>
<p>全局使用Redis</p>
<p>asdf global redis<br />
Usage: asdf global &lt;name&gt; &lt;version&gt;</p>
<p>查看redis-server</p>
<p>redis-server<br />
24638:C 11 Aug 10:54:42.372 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo<br />
24638:C 11 Aug 10:54:42.372 # Redis version=4.0.9, bits=64, commit=00000000, modified=0, pid=24638, just started<br />
24638:C 11 Aug 10:54:42.372 # Warning: no config file specified, using the default config. In order to specify a config file use /home/linlin/.asdf/installs/redis/4.0.9/bin/redis-server /path/to/redis.conf<br />
24638:M 11 Aug 10:54:42.373 * Increased maximum number of open files to 10032 (it was originally set to 1024).<br />
24638:M 11 Aug 10:54:42.373 # Creating Server TCP listening socket *:6379: bind: Address already in use</p>
<p>查看Redis进程</p>
<p>ps -ef |grep redis<br />
redis&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10913&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; 0 08:51 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:09 /usr/bin/redis-server 127.0.0.1:6379<br />
linlin&nbsp;&nbsp;&nbsp;&nbsp; 24750&nbsp;&nbsp; 22690&nbsp; 0 10:54 pts/10&nbsp;&nbsp; 00:00:00 grep --color=auto redis</p>
