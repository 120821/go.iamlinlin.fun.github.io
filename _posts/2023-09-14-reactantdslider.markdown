---
layout: post
title: "react antd slider的简单使用"
date: "2023-09-14"
categories: 
---
<p><a href="https://ant.design/components/slider-cn">https://ant.design/components/slider-cn</a></p>

<p>1.取保已经安装了antd</p>

<p>2.增加：</p>

{% highlight %}
{% highlight %}import { Slider } from &#39;antd&#39;;{% endhighlight %}

<p>{% highlight %}3{% endhighlight %}.增加滑动的数据：</p>

{% highlight %}
{% highlight %}const formatter = (value: number) =&gt; `${value}%`;{% endhighlight %}

{% highlight %}
{% highlight %}&lt;&gt;
  &lt;Slider tooltip={{ formatter }} /&gt;
  &lt;Slider tooltip={{ formatter: null }} /&gt;
&lt;/&gt;{% endhighlight %}

<p>&nbsp;</p>

