---
layout: post
title: "react d3 地图 marks（Slider) 根据年份显示节点"
date: "2023-10-31"
categories: 
---
<p><a href="https://ant.design/components/slider-cn">https://ant.design/components/slider-cn</a></p>

<p>如果显示20年，就是每一年都显示一个标记点，但是现在需要超过50年，那么需要做判断，超过20年，就5年显示一个标记点：</p>

<pre>
<code><span style="color:#dcc6e0">const</span> marks = {};

<span style="color:#dcc6e0">if</span> (<span style="color:#f5ab35">Object</span>.keys(updatedYearlyData).length &gt; <span style="color:#f5ab35">20</span>) {
  <span style="color:#f5ab35">Object</span>.keys(updatedYearlyData).forEach(<span style="color:#f5ab35">year</span> =&gt; {
    <span style="color:#dcc6e0">if</span> (<span style="color:#f5ab35">parseInt</span>(year) &gt; <span style="color:#f5ab35">20</span> &amp;&amp; <span style="color:#f5ab35">parseInt</span>(year) % <span style="color:#f5ab35">5</span> === <span style="color:#f5ab35">0</span>) {
      marks[year] = <span style="color:#abe338">`</span><span style="color:#abe338">${year}</span><span style="color:#abe338">年`</span>;
    }
  });
} <span style="color:#dcc6e0">else</span> {
  <span style="color:#d4d0ab">// 使用原来的 marks 逻辑</span>
  <span style="color:#f5ab35">Object</span>.keys(updatedYearlyData).forEach(<span style="color:#f5ab35">year</span> =&gt; {
    marks[year] = <span style="color:#abe338">`</span><span style="color:#abe338">${year}</span><span style="color:#abe338">年`</span>;
  });
}</code></pre>

<p>同时修改slider:</p>

<p>(使用 <code>marks</code> 属性标注分段式滑块，使用 <code>value</code> / <code>defaultValue</code> 指定滑块位置。当 <code>included=false</code> 时，表明不同标记间为并列关系。当 <code>step=null</code> 时，Slider 的可选值仅有 <code>marks</code> 标出来的部分。)</p>

<pre>
<code>&lt;Slider  min={firstYear} max={lastYear} marks={marks} onChange={handleSliderChange} defaultValue={firstYear} tooltipVisible tipFormatter={(value) =&gt; `${value}年`} /&gt;</code></pre>

<p>&nbsp;</p>

