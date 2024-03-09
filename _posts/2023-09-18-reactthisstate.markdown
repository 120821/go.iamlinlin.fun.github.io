---
layout: post
title: "react this.state 解构语法"
date: "2023-09-18"
categories: 
---
<p>把this.state的属性解构为独立的变量</p>

<p>写法1：</p>

<pre>
<code>const data = this.state.data;
const yearStart = this.state.yearStart;
const yearEnd = this.state.yearEnd;
const svgRef = this.state.svgRef;{% endhighlight %}

<p><code>写法2:</code></p>

<p><code>简便写法</code></p>

<pre>
<code>const { data, yearStart, yearEnd, svgRef } = this.state;{% endhighlight %}

