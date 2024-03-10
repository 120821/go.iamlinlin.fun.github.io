---
layout: post
title: "redis - ERR unknown command 'HELLO' (RedisClient::CommandError)"
date: "2023-03-22"
categories: 
---
<p><a href="https://stackoverflow.com/questions/75798268/redis-err-unknown-command-hello-redisclientcommanderror">https://stackoverflow.com/questions/75798268/redis-err-unknown-command-hello-redisclientcommanderror</a></p>
<p>在本地使用redis的时候，rails不能cache，出现了error</p>
{% highlight html %}redis - ERR unknown command &#39;HELLO&#39; (RedisClient::CommandError){% endhighlight %}
<p>&ldquo;HELLO&rdquo;命令是在 Redis 6.0 版中引入的，作为在初始握手期间在客户端和服务器之间交换信息的一种方式。 如果您使用的是旧版本的 Redis，则需要升级到 6.0 或更高版本才能使用&ldquo;HELLO&rdquo;命令。</p>
<p>解决：</p>
<p>1.查看redis的版本：</p>
<p>直接：</p>
{% highlight html %}redis-cli info server | grep redis_version.{% endhighlight %}
<p>或者</p>
<p>（1）查看redis的安装方式</p>
{% highlight html %}which redis-cli{% endhighlight %}
{% highlight html %}
/home/linlin/.asdf/shims/redis-cli{% endhighlight %}
<p>（2）查看redis的版本</p>
{% highlight html %}redis-cli -v{% endhighlight %}
{% highlight html %}redis-cli 7.0.10{% endhighlight %}
<p>2.升级redis</p>
<p>（1）安装最新的redis</p>
{% highlight html %}asdf install redis latest{% endhighlight %}
{% highlight html %}&nbsp;&nbsp;&nbsp; LINK redis-server
&nbsp;&nbsp;&nbsp; INSTALL redis-sentinel
&nbsp;&nbsp;&nbsp; CC redis-cli.o
&nbsp;&nbsp;&nbsp; CC redisassert.o
&nbsp;&nbsp;&nbsp; CC cli_common.o
&nbsp;&nbsp;&nbsp; LINK redis-cli
&nbsp;&nbsp;&nbsp; CC redis-benchmark.o
&nbsp;&nbsp;&nbsp; LINK redis-benchmark
&nbsp;&nbsp;&nbsp; INSTALL redis-check-rdb
&nbsp;&nbsp;&nbsp; INSTALL redis-check-aof{% endhighlight %}
{% highlight html %}Hint: It&#39;s a good idea to run &#39;make test&#39; ;){% endhighlight %}
{% highlight html %}&nbsp;&nbsp;&nbsp; INSTALL redis-server
&nbsp;&nbsp;&nbsp; INSTALL redis-benchmark
&nbsp;&nbsp;&nbsp; INSTALL redis-cli
make[1]: Leaving directory &#39;/tmp/tmp.3R4gZOJtHj/redis-7.0.10/src&#39;{% endhighlight %}
<p>(2)全局使用最新的redis</p>
{% highlight html %}asdf global redis 7.0.10{% endhighlight %}
<p>(3)查看redis的版本</p>
{% highlight html %}redis-cli -v{% endhighlight %}
{% highlight html %}redis-cli 7.0.10{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
