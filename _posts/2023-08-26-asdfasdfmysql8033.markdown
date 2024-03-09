---
layout: post
title: "取消asdf的全局：asdf 安装了mysql 8.0.33，并且设置了全局，进行取消"
date: "2023-08-26"
categories: 
---
<p>使用命令查看要取消的版本：</p>

{% highlight %}
{% highlight %}<span style="color:#ffd700">asdf list mysql</span>{% endhighlight %}

<p>取消安装即可：</p>

{% highlight %}
{% highlight %}<span style="color:#ffd700">asdf</span> uninstall mysql <span style="color:#f5ab35">8</span>.<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">33</span>{% endhighlight %}

<p>或者仅仅取消全局：</p>

{% highlight %}
{% highlight %}asdf <span style="color:#f5ab35">global</span> mysql <span style="color:#f5ab35">none</span>{% endhighlight %}

