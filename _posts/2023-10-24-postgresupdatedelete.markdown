---
layout: post
title: "postgres update delete 的使用"
date: "2023-10-24"
categories: 
---
<p>把name 是生产行业的calculation_plan修改为生产行业-0922</p>

{% highlight %}
{% highlight %}UPDATE calculation_plans
<span style="color:#dcc6e0">SET</span> name = <span style="color:#abe338">&#39;生产行业-0922&#39;</span>
<span style="color:#dcc6e0">WHERE</span> name = <span style="color:#abe338">&#39;生产行业&#39;</span>;{% endhighlight %}

<p>删除计算方案表的所有数据:</p>

{% highlight %}
{% highlight %}<span style="color:#dcc6e0">DELETE</span> <span style="color:#dcc6e0">FROM</span> calculation_plans;{% endhighlight %}

