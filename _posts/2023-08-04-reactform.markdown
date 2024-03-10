---
layout: post
title: "react form 设置表单数据类型为两位小数"
date: "2023-08-04"
categories: 
---
<p>这样写是整数类型：</p>
{% highlight html %}&lt;InputNumber min={0} max={99999} /&gt;{% endhighlight %}
<p>这样写是小数类型，保留两位小数，每次可以增加0.01或者减少0.01</p>
{% highlight html %}&lt;InputNumber step={0.01} /&gt;{% endhighlight %}
