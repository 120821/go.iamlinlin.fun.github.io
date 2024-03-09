---
layout: post
title: "ubuntu 关闭apache2"
date: "2023-11-29"
categories: 
---
<p>apache2占用着80端口，导致无法启动docker的DVWA:</p>

{% highlight %}
{% highlight %}sudo lsof -i:80

COMMAND&nbsp; PID&nbsp;&nbsp;&nbsp;&nbsp; USER&nbsp;&nbsp; FD&nbsp;&nbsp; TYPE DEVICE SIZE/OFF NODE NAME

apache2 8564&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp; 4u&nbsp; IPv6 460130&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP *:http (LISTEN)

apache2 8565 www-data&nbsp;&nbsp;&nbsp; 4u&nbsp; IPv6 460130&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP *:http (LISTEN)

apache2 8566 www-data&nbsp;&nbsp;&nbsp; 4u&nbsp; IPv6 460130&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP *:http (LISTEN)

apache2 8567 www-data&nbsp;&nbsp;&nbsp; 4u&nbsp; IPv6 460130&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP *:http (LISTEN)

apache2 8568 www-data&nbsp;&nbsp;&nbsp; 4u&nbsp; IPv6 460130&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP *:http (LISTEN)

apache2 8569 www-data&nbsp;&nbsp;&nbsp; 4u&nbsp; IPv6 460130&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP *:http (LISTEN){% endhighlight %}

<p>直接使用kill -9 不能直接关闭进程，可以把pid关闭，但是apache2会自动启动，需要：</p>

{% highlight %}
{% highlight %}<span style="color:#ffd700">sudo</span> service apache<span style="color:#f5ab35">2</span> stop{% endhighlight %}

<p>只有使用上面的命令才可以停止：</p>

