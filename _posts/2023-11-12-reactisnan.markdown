---
layout: post
title: "react isNaN的判断"
date: "2023-11-12"
categories: 
---
<p>对于数据，有可能是NaN，可以做个判断（如果计算是Nan,可以设置为0）：</p>
{% highlight html %}emission = province.emission<span style="color:#d4d0ab">;</span>{% endhighlight %}
<p>可以这样：</p>
<p>1.使用条件语句：</p>
{% highlight html %}if (isNaN(emission)) {
emission_result = 0;
}{% endhighlight %}
<p>2.使用3元运算：</p>
{% highlight html %}emission = isNaN(emission_result) ? 0 : emission_result;{% endhighlight %}
<p>&nbsp;</p>
