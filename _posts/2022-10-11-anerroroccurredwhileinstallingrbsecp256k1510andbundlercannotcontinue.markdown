---
layout: post
title: "An error occurred while installing rbsecp256k1 (5.1.0), and Bundler cannot continue."
date: "2022-10-11"
categories: 
---
<p><a href="http://linlin.fun/blogs/397">参考</a></p>

<p>bundle 的时候出现错：</p>

{% highlight %}
{% highlight %}An error occurred while installing rbsecp256k1 (5.1.0), and Bundler cannot continue.{% endhighlight %}

<p><img height="155" src="/uploads/ckeditor/pictures/564/image-20221011084828-1.png" width="1100" /></p>

<p>使用(这个是一条命令）：</p>

{% highlight %}
{% highlight %}sudo apt-get install build-essential automake pkg-config libtool \

&gt;&nbsp;&nbsp; libffi-dev libssl-dev libgmp-dev python-dev{% endhighlight %}

<p>{% highlight %}然后继续bundle即可{% endhighlight %}</p>

<p><img height="155" src="/uploads/ckeditor/pictures/565/image-20221011085021-2.png" width="1100" /></p>

