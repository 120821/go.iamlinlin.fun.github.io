---
layout: post
title: "react echarts 不显示分割线"
date: "2023-11-17"
categories: 
---
<p>refer: <a href="https://echarts.apache.org/handbook/zh/concepts/axis">https://echarts.apache.org/handbook/zh/concepts/axis</a></p>

<p>使用echarts的时候，有分割线很难看：</p>

<p>直接隐藏：</p>

<pre>
<code>option = {
  <span style="color:#d4d0ab">// 其他配置项...</span>
  yAxis: {
    splitLine: {
      show: <span style="color:#f5ab35">false</span> <span style="color:#d4d0ab">// 关闭分割线显示</span>
    },
  },
  <span style="color:#d4d0ab">// 其他配置项...</span>
};{% endhighlight %}

<p>或者设置为透明：</p>

<pre>
<code>option = {
  <span style="color:#d4d0ab">// 其他配置项...</span>
  yAxis: {
    splitLine: {
      show: <span style="color:#f5ab35">true</span>,
      lineStyle: {
        color: <span style="color:#abe338">&#39;transparent&#39;</span> <span style="color:#d4d0ab">// 设置分割线为透明</span>
      }
    },
  },
  <span style="color:#d4d0ab">// 其他配置项...</span>
};{% endhighlight %}

