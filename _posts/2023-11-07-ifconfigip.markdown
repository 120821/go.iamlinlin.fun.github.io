---
layout: post
title: "ifconfig查看虚拟机的ip"
date: "2023-11-07"
categories: 
---
<p>使用ifconfig返回了这样的数据：</p>
{% highlight html %}ifconfig
<span style="color:#ffd700">ens33</span>: flags=<span style="color:#f5ab35">4163</span>&amp;lt;UP,BROADCAST,RUNNING,MULTICAST&amp;gt; mtu <span style="color:#f5ab35">1500</span>
<span style="color:#ffd700">inet</span> <span style="color:#f5ab35">192.168.187.133</span> netmask <span style="color:#f5ab35">255.255.255.0</span> broadcast <span style="color:#f5ab35">192.168.187.255</span>
<span style="color:#ffd700">inet6</span> fe<span style="color:#f5ab35">80</span>::<span style="color:#f5ab35">1</span>f<span style="color:#f5ab35">27</span>:d<span style="color:#f5ab35">6</span>e<span style="color:#f5ab35">5</span>:<span style="color:#f5ab35">2</span>a<span style="color:#f5ab35">81</span>:c<span style="color:#f5ab35">7</span>aa prefixlen <span style="color:#f5ab35">64</span> scopeid <span style="color:#f5ab35">0</span>x<span style="color:#f5ab35">20</span>&amp;lt;link&amp;gt;{% endhighlight %}
<p>可以知道虚拟机的ip是：</p>
{% highlight html %}<span style="color:#f5ab35">192.168.187.133</span>{% endhighlight %}
<p>在外部可以使用以下来访问3000端口的yarn 项目</p>
{% highlight html %}<span style="color:#f5ab35">192.168.187.133:3000</span>{% endhighlight %}
