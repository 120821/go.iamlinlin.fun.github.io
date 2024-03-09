---
layout: post
title: "react isNaN的判断"
date: "2023-11-12"
categories: 
---
<p>对于数据，有可能是NaN，可以做个判断（如果计算是Nan,可以设置为0）：</p>

<pre>
<code>emission = province.emission<span style="color:#d4d0ab">;</span></code></pre>

<p>可以这样：</p>

<p>1.使用条件语句：</p>

<pre>
<code>if (isNaN(emission)) {
  emission_result = 0;
}</code></pre>

<p>2.使用3元运算：</p>

<pre>
<code>emission = isNaN(emission_result) ? 0 : emission_result;</code></pre>

<p>&nbsp;</p>

