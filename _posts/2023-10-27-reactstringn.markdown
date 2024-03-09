---
layout: post
title: "react String保留n位小数"
date: "2023-10-27"
categories: 
---
<p>我有很多列的数据，需要把小数精简一下：</p>

<pre>
<code>? [
  { title: <span style="color:#abe338">&quot;年份&quot;</span>, dataIndex: <span style="color:#abe338">&quot;year&quot;</span> },
  { title: <span style="color:#abe338">&quot;初始库存量&quot;</span>, dataIndex: <span style="color:#abe338">&quot;bank_count&quot;</span> },
  { title: <span style="color:#abe338">&quot;总排放&quot;</span>, dataIndex: <span style="color:#abe338">&quot;result&quot;</span> }
] : [
  { title: <span style="color:#abe338">&quot;年份&quot;</span>, dataIndex: <span style="color:#abe338">&quot;year&quot;</span> },
  { title: <span style="color:#abe338">&quot;初始库存量&quot;</span>, dataIndex: <span style="color:#abe338">&quot;bank_count&quot;</span> },
  { title: <span style="color:#abe338">&quot;维修排放&quot;</span>, dataIndex: <span style="color:#abe338">&quot;emission_operation&quot;</span> }
];</code></pre>

<p>修改上面的内容是不行的，需要在render里判断：</p>

<pre>
<code>{columns.map((<span style="color:#f5ab35">column, index</span>) =&gt; (
  <span style="color:#ffa07a">&lt;</span><span style="color:#ffa07a">td</span><span style="color:#ffa07a"> </span><span style="color:#ffa07a">key</span><span style="color:#ffa07a">=</span><span style="color:#abe338">{index}</span><span style="color:#ffa07a">&gt;</span>
    {column.dataIndex === &quot;year&quot;
      ? item[column.dataIndex] // 对于 &quot;year&quot; 列，不进行小数位数处理
      : parseFloat(item[column.dataIndex]).toFixed(2) // 对于其他列，保留两位小数
    }
  <span style="color:#ffa07a">&lt;/</span><span style="color:#ffa07a">td</span><span style="color:#ffa07a">&gt;</span>
))}</code></pre>

<p>&nbsp;</p>

