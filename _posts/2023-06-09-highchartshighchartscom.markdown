---
layout: post
title: "highcharts 版权信息highcharts.com不显示"
date: "2023-06-09"
categories: 
---
<p>可以通过设置credits.enabled属性来隐藏Highcharts的版权信息。例如：</p>

<pre>
<code>credits: {
  enabled: false
}</code></pre>

<p>请注意，根据Highcharts的许可协议，如果您使用的是免费版本，则需要在图表中保留Highcharts的版权信息。</p>

<p>可以将这段代码放在Highcharts配置对象的顶层。例如：</p>

<pre>
<code>var options = {
  credits: {
    enabled: false
  },
  // 其他配置项
};

// 初始化 Highcharts 图表
Highcharts.chart(&#39;container&#39;, options);</code></pre>

<p>&nbsp;</p>

