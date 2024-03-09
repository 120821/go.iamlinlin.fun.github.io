---
layout: post
title: "sinatra-cross_origin允许其他网络也可以向这里发起REQUEST请求"
date: "2022-10-13"
categories: 
---
<p><a href="https://github.com/britg/sinatra-cross_origin">https://github.com/britg/sinatra-cross_origin</a></p>

<p>安装：在Gemfile增加gem，然后bundle</p>

{% highlight %}
{% highlight %}gem &quot;sinatra-cross_origin&quot;, &quot;~&gt; 0.3.1&quot;{% endhighlight %}

<p>使用：在app.rb增加这样的内容</p>

{% highlight %}
{% highlight %}require &#39;sinatra&#39;
require &#39;sinatra/cross_origin&#39;
configure do
&nbsp; enable :cross_origin
end{% endhighlight %}

<p>{% highlight %}使用：{% endhighlight %}<img height="53" src="/uploads/ckeditor/pictures/586/image-20221013140955-2.png" width="321" /></p>

<p>{% highlight %}返回结果例如：{% endhighlight %}<img height="94" src="/uploads/ckeditor/pictures/587/image-20221013141008-3.png" width="779" /></p>

<p>&nbsp;</p>

