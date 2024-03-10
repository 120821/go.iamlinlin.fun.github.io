---
layout: post
title: "docker container logs"
date: "2022-12-23"
categories: 
---
<p>refer：<a href="https://docs.docker.com/engine/reference/commandline/container_logs/">https://docs.docker.com/engine/reference/commandline/container_logs/</a></p>
{% highlight html %}docker container logs [OPTIONS] CONTAINER{% endhighlight %}
<p>{% highlight html %}在使用docker mysql 的时候，启动了一百个ruby脚本进行数据的抓取和保存，然后数据库就挂了。{% endhighlight %}不清楚是ruby还是数据库的原因，查看nohup.out ,发现都是数据库连接的问题</p>
<p>查看docker mysql的log，就可以使用以上的命令。</p>
<p>{% highlight html %}docker logs --tail=50 &lt;container id&gt;{% endhighlight %}</p>
<p>{% highlight html %}使用这个命令，可以进行行数的控制。{% endhighlight %}</p>
