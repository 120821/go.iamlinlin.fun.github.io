---
layout: post
title: "react this.state 解构语法"
date: "2023-09-18"
categories: 
---
<p>把this.state的属性解构为独立的变量</p>
<p>写法1：</p>
{% highlight html %}const data = this.state.data;
const yearStart = this.state.yearStart;
const yearEnd = this.state.yearEnd;
const svgRef = this.state.svgRef;{% endhighlight %}
<p>{% highlight html %}写法2:{% endhighlight %}</p>
<p>{% highlight html %}简便写法{% endhighlight %}</p>
{% highlight html %}const { data, yearStart, yearEnd, svgRef } = this.state;{% endhighlight %}
