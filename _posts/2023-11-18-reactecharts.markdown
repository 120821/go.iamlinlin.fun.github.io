---
layout: post
title: "react echarts 显示上边框和右边框"
date: "2023-11-18"
categories: 
---
<p>refer: <a href="https://blog.csdn.net/qq_53810245/article/details/130429520">https://blog.csdn.net/qq_53810245/article/details/130429520</a></p>

<p>在echarts里这样使用：（注意必须增加边框的宽度和颜色，不然设置了也不显示。）</p>

<pre>
<code>grid: {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; left: &#39;3%&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; right: &#39;3%&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bottom: &#39;3%&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; containLabel: true,// 网格包括坐标轴标签的空间

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; borderWidth: 1,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; borderColor: &#39;#ccc&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; show: true,

&nbsp;&nbsp;&nbsp; },{% endhighlight %}

<p>这里的grid是和<code>yAxis并列的。</code></p>

