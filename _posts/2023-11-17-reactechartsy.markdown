---
layout: post
title: "react echarts 显示y轴，并设置宽度等"
date: "2023-11-17"
categories: 
---
<p><a href="https://echarts.apache.org/handbook/zh/concepts/axis">https://echarts.apache.org/handbook/zh/concepts/axis</a></p>
<p>把y轴显示为竖线，设置宽度为1，如果需要加粗效果可以调整为2</p>
{% highlight html %}option = {
<span style="color:#d4d0ab">// 其他配置项...</span>
yAxis: {
axisLine: {
show: <span style="color:#f5ab35">true</span>, <span style="color:#d4d0ab">// 显示坐标轴线</span>
lineStyle: {
color: <span style="color:#abe338">&#39;#999&#39;</span>, <span style="color:#d4d0ab">// 坐标轴线颜色</span>
width: <span style="color:#f5ab35">1</span>, <span style="color:#d4d0ab">// 坐标轴线宽度</span>
type: <span style="color:#abe338">&#39;solid&#39;</span>, <span style="color:#d4d0ab">// 坐标轴线类型，可以是 &#39;solid&#39;, &#39;dashed&#39;, &#39;dotted&#39; 中的一种</span>
},
},
},
<span style="color:#d4d0ab">// 其他配置项...</span>
};{% endhighlight %}
