---
layout: post
title: "react parseFloat 处理 1.36E-05这样的数据"
date: "2023-11-12"
categories: 
---
<p>&quot;1.36E-05&quot;是科学计数法的字符串，可以使用parseFloat进行处理：</p>

{% highlight %}
{% highlight %}<span style="color:#dcc6e0">const</span> str = <span style="color:#abe338">&quot;1.36E-05&quot;</span>;
<span style="color:#dcc6e0">const</span> floatValue = <span style="color:#f5ab35">parseFloat</span>(str);
<span style="color:#f5ab35">console</span>.log(floatValue); <span style="color:#d4d0ab">// 输出 0.0000136</span>{% endhighlight %}

