---
layout: post
title: "nginx 配置虚拟机的yarn项目，使用ip+port "
date: "2023-11-07"
categories: 
---
<p>需要把yarn项目使用yarn启动，例如3000端口，需要把your_domain_or_ip,修改为域名或者ip, 例如192.168.187.133:3000</p>
{% highlight html %}server {
listen <span style="color:#f5ab35">80</span>;
server_name your_domain_or_ip;
location / {
proxy_pass http://localhost:<span style="color:#f5ab35">3000</span>;
proxy_set_header Host $host;
proxy_set_header X-Real-IP $<span style="color:#d4d0ab">remote_addr;</span>
proxy_set_header X-Forwarded-<span style="color:#dcc6e0">For</span> $proxy_add_x_forwarded_for;
}
}{% endhighlight %}
<p>设置好后，在虚拟机ubuntu之外的windows里就可以访问了。（在别的电脑不能访问。）</p>
