---
layout: post
title: "ubuntu install postgres 15"
date: "2023-11-06"
categories: 
---
<p><a href="https://www.postgresql.org/download/linux/debian/">https://www.postgresql.org/download/linux/debian/</a></p>

<p>1.更新软件库</p>

{% highlight %}
{% highlight %}wget --quiet -O - https:<span style="color:#ffa07a">//</span>www.postgresql.org<span style="color:#ffa07a">/media/</span>keys/ACCC4CF8.asc | sudo apt-key add -{% endhighlight %}

<p>2.软件配置</p>

<p>对于ubuntu 22.04</p>

{% highlight %}
{% highlight %}sudo sh -c &#39;<span style="color:#dcc6e0">echo</span> <span style="color:#abe338">&quot;deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main&quot;</span> &gt;&gt; <span style="color:#abe338">/etc/apt/sources.list.d/pgdg.list</span>&#39;{% endhighlight %}

<p>{% highlight %}3.安装：{% endhighlight %}</p>

{% highlight %}
{% highlight %}sudo apt install postgresql-&lt;version&gt;{% endhighlight %}

<p>例如：</p>

{% highlight %}
{% highlight %}
 apt-get install postgresql-15{% endhighlight %}

