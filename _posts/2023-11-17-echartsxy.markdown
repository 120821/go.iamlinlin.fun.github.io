---
layout: post
title: "echarts,设置x/y轴的字体颜色为黑色"
date: "2023-11-17"
categories: 
---
<p>refer: <a href="https://echarts.apache.org/handbook/zh/concepts/axis">https://echarts.apache.org/handbook/zh/concepts/axis</a></p>
<p>echarts,设置x/y轴的字体颜色为黑色</p>
{% highlight html %}option = {
<span style="color:#d4d0ab">// 其他配置项...</span>
xAxis: {
<span style="color:#d4d0ab">// 其他 xAxis 配置...</span>
axisLabel: {
textStyle: {
color: <span style="color:#abe338">&#39;black&#39;</span>  <span style="color:#d4d0ab">// x 轴字体颜色为黑色</span>
}
}
},
yAxis: {
<span style="color:#d4d0ab">// 其他 yAxis 配置...</span>
axisLabel: {
textStyle: {
color: <span style="color:#abe338">&#39;black&#39;</span>  <span style="color:#d4d0ab">// y 轴字体颜色为黑色</span>
}
}
},
<span style="color:#d4d0ab">// 其他配置项...</span>
}{% endhighlight %}
