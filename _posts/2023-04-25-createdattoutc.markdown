---
layout: post
title: "created_at to utc"
date: "2023-04-25"
categories: 
---
<div id="rtf11208">
<div>
<p>在 Ruby 中，可以使用 {% highlight html %}utc{% endhighlight %} 方法将本地时间转换为 UTC 时间。因为 {% highlight html %}created_at{% endhighlight %} 方法返回的是本地时间（也就是服务器所在地区的时间），如果你想要将这个时间转换为 UTC 时间，可以使用以下代码：</p>
{% highlight html %}created_at_utc = created_at.utc{% endhighlight %}
<p>这个代码片段将 {% highlight html %}created_at{% endhighlight %} 时间对象转换为 UTC 时间对象，并将其赋值给 {% highlight html %}created_at_utc{% endhighlight %} 变量。</p>
<p>注意，转换为 UTC 时间的对象和本地时间对象的区别在于，UTC 对象的 {% highlight html %}zone{% endhighlight %} 属性为 {% highlight html %}&quot;UTC&quot;{% endhighlight %}，而本地时间对象的 {% highlight html %}zone{% endhighlight %} 属性则取决于服务器所在地区。如果你想在输出 UTC 时间时明确指定时区信息，可以使用 {% highlight html %}strftime{% endhighlight %} 方法并将 {% highlight html %}%Z{% endhighlight %} 格式化符指定为 {% highlight html %}&quot;UTC&quot;{% endhighlight %}，例如：</p>
{% highlight html %}created_at_utc.strftime(&quot;%Y-%m-%d %H:%M:%S %Z&quot;) # =&gt; &quot;2021-10-01 12:34:56 UTC&quot;{% endhighlight %}
<p>这个代码片段将 {% highlight html %}created_at_utc{% endhighlight %} 对象格式化为 {% highlight html %}&quot;2021-10-01 12:34:56 UTC&quot;{% endhighlight %} 的字符串。</p>
</div>
</div>
