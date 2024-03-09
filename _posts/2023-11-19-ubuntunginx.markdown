---
layout: post
title: "ubuntu 重启后自启动nginx"
date: "2023-11-19"
categories: 
---
<p>1.写一个启动的文件：</p>

<p>{% highlight %}/etc/systemd/system/nginx.service{% endhighlight %}</p>

<p>内容是这样的：</p>

{% highlight %}
{% highlight %}[Unit]
Description=Nginx HTTP server
After=network.target

[Service]
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/usr/sbin/nginx -s quit
ExecStartPre=/usr/sbin/nginx -t
Restart=always
Type=forking

[Install]
WantedBy=multi-user.target{% endhighlight %}

<p>2.写好后，可以使用命令启动一下nginx：</p>

{% highlight %}
{% highlight %}sudo systemctl daemon-reload
sudo systemctl start nginx{% endhighlight %}

<p>3.查看nginx状态：</p>

{% highlight %}
{% highlight %}sudo systemctl status nginx{% endhighlight %}

<p>4.设置自启动：</p>

{% highlight %}
{% highlight %}sudo systemctl enable nginx{% endhighlight %}

