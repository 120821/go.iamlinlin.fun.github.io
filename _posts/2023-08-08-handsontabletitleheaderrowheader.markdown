---
layout: post
title: "handsontable 不显示titleheader rowheader"
date: "2023-08-08"
categories: 
---
<p>refer: <a href="https://handsontable.com/docs/react-data-grid/installation/">https://handsontable.com/docs/react-data-grid/installation/</a></p>

<p>在线demo： <a href="https://jsfiddle.net/api/post/library/pure/">https://jsfiddle.net/api/post/library/pure/</a></p>

<p>使用headsontable的时候，会出现header,</p>

<div class="extra-class language-jsx">
<pre>
<code>&lt;HotTable
  data={[
    [&#39;&#39;, &#39;Tesla&#39;, &#39;Volvo&#39;, &#39;Toyota&#39;, &#39;Ford&#39;],
    [&#39;2019&#39;, 10, 11, 12, 13],
    [&#39;2020&#39;, 20, 11, 14, 13],
    [&#39;2021&#39;, 30, 15, 12, 13]
  ]}
  rowHeaders={true}
   ={true}
  height=&quot;auto&quot;
  licenseKey=&quot;non-commercial-and-evaluation&quot; // for non-commercial use only
/&gt;
</code></pre>

<p>默认情况下是显示headers的，如果不想要显示，那么就把<code>rowHeaders</code>&nbsp; <code>colHeaders</code>修改为false即可。<code>data可以设置默认的数据。</code></p>
</div>

