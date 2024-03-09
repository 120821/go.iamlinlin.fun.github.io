---
layout: post
title: "react 把每年的地图的数据展示为table,数据处理"
date: "2023-10-27"
categories: 
---
<p>我有一个中国地图，显示了多年的数量</p>

<p>最开始使用这样的代码，在render里是不能展示的：</p>

<pre>
<code>{yearlyObjArray}</code></pre>

<p>需要处理：</p>

<pre>
<code>{yearlyDataArray.map((yearlyObjArray, index) =&gt; {
  if (yearlyObjArray[0].year === value) {
    return (
      &lt;div key={index}&gt;
        &lt;MyMapToShowResult realData={yearlyObjArray} style={{ zIndex: 1 }} /&gt;
        {yearlyObjArray.map((item, itemIndex) =&gt; (
          &lt;div key={itemIndex}&gt;
            &lt;div&gt;Province: {item.province}&lt;/div&gt;
            &lt;div&gt;Percentage: {item.percentage}&lt;/div&gt;
            &lt;div&gt;Year: {item.year}&lt;/div&gt;
            &lt;div&gt;Emission: {item.emission}&lt;/div&gt;
          &lt;/div&gt;
        ))}
      &lt;/div&gt;
    );
  }
})}</code></pre>

<p>进一步做一个table：</p>

<pre>
<code>{yearlyDataArray.map((yearlyObjArray, index) =&gt; {
  if (yearlyObjArray[0].year === value) {
    return (
      &lt;div key={index}&gt;
        &lt;MyMapToShowResult realData={yearlyObjArray} style={{ zIndex: 1 }} /&gt;
        &lt;table&gt;
          &lt;thead&gt;
            &lt;tr&gt;
              &lt;th&gt;Province&lt;/th&gt;
              &lt;th&gt;Percentage&lt;/th&gt;
              &lt;th&gt;Year&lt;/th&gt;
              &lt;th&gt;Emission&lt;/th&gt;
            &lt;/tr&gt;
          &lt;/thead&gt;
          &lt;tbody&gt;
            {yearlyObjArray.map((item, itemIndex) =&gt; (
              &lt;tr key={itemIndex}&gt;
                &lt;td&gt;{item.province}&lt;/td&gt;
                &lt;td&gt;{item.percentage}&lt;/td&gt;
                &lt;td&gt;{item.year}&lt;/td&gt;
                &lt;td&gt;{item.emission}&lt;/td&gt;
              &lt;/tr&gt;
            ))}
          &lt;/tbody&gt;
        &lt;/table&gt;
      &lt;/div&gt;
    );
  }
})}</code></pre>

<p>可以增加边框：</p>

<pre>
<code>// CSS样式
&lt;style&gt;
  table {
    border-collapse: collapse;
    width: 100%;
  }
  th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
  }
  th {
    background-color: #f2f2f2;
  }
&lt;/style&gt;

// JSX代码
{yearlyDataArray.map((yearlyObjArray, index) =&gt; {
  ,,,</code></pre>

<p>注意这里的table的css会影响其他页面的css，因为修改的是整体的css，如果不需要修改其他页面的table的css的话，就单独写class。</p>

