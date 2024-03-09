---
layout: post
title: "react antd slider的简单使用"
date: "2023-09-14"
categories: 
---
<p><a href="https://ant.design/components/slider-cn">https://ant.design/components/slider-cn</a></p>

<p>1.取保已经安装了antd</p>

<p>2.增加：</p>

<pre>
<code>import { Slider } from &#39;antd&#39;;</code></pre>

<p><code>3</code>.增加滑动的数据：</p>

<pre>
<code>const formatter = (value: number) =&gt; `${value}%`;</code></pre>

<pre>
<code>&lt;&gt;
  &lt;Slider tooltip={{ formatter }} /&gt;
  &lt;Slider tooltip={{ formatter: null }} /&gt;
&lt;/&gt;</code></pre>

<p>&nbsp;</p>

