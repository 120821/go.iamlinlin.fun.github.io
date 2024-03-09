---
layout: post
title: "created_at to utc"
date: "2023-04-25"
categories: 
---
<div id="rtf11208">
<div>
<p>在 Ruby 中，可以使用 <code>utc</code> 方法将本地时间转换为 UTC 时间。因为 <code>created_at</code> 方法返回的是本地时间（也就是服务器所在地区的时间），如果你想要将这个时间转换为 UTC 时间，可以使用以下代码：</p>

<pre>
<code>created_at_utc = created_at.utc{% endhighlight %}

<p>这个代码片段将 <code>created_at</code> 时间对象转换为 UTC 时间对象，并将其赋值给 <code>created_at_utc</code> 变量。</p>

<p>注意，转换为 UTC 时间的对象和本地时间对象的区别在于，UTC 对象的 <code>zone</code> 属性为 <code>&quot;UTC&quot;</code>，而本地时间对象的 <code>zone</code> 属性则取决于服务器所在地区。如果你想在输出 UTC 时间时明确指定时区信息，可以使用 <code>strftime</code> 方法并将 <code>%Z</code> 格式化符指定为 <code>&quot;UTC&quot;</code>，例如：</p>

<pre>
<code>created_at_utc.strftime(&quot;%Y-%m-%d %H:%M:%S %Z&quot;) # =&gt; &quot;2021-10-01 12:34:56 UTC&quot;{% endhighlight %}

<p>这个代码片段将 <code>created_at_utc</code> 对象格式化为 <code>&quot;2021-10-01 12:34:56 UTC&quot;</code> 的字符串。</p>
</div>
</div>

