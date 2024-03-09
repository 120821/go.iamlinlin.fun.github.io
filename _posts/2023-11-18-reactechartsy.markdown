---
layout: post
title: "react echarts 显示y轴的单位"
date: "2023-11-18"
categories: 
---
<p>如果y轴需要单位的话，可以增加上。</p>

<p>注意这里如果是动态得到数据，然后生成图表的话，在没有数据的时候，y轴的单位字数多的话，可能会显示不完全。</p>

{% highlight %}
{% highlight %}option = {
  <span style="color:#d4d0ab">// 其他配置项...</span>
  yAxis: {
    name: <span style="color:#abe338">&#39;单位&#39;</span>, <span style="color:#d4d0ab">// 单位名称</span>
    nameTextStyle: {
      color: <span style="color:#abe338">&#39;#999&#39;</span>, <span style="color:#d4d0ab">// 单位名称颜色</span>
    },
    <span style="color:#d4d0ab">// 其他设置项...</span>
  },
  <span style="color:#d4d0ab">// 其他配置项...</span>
};

<span style="color:#d4d0ab">// 使用上述配置项绘制图表</span>
myChart.setOption(option);{% endhighlight %}

