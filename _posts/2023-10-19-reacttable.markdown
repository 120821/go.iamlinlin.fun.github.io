---
layout: post
title: "react 数据处理 table的使用"
date: "2023-10-19"
categories: 
---
<p>react我有这样的数据：</p>

<pre>
<code>processedData[&#39;scrapDischargeRateDefaultData&#39;]:  
Array(<span style="color:#f5ab35">8</span>) [ (<span style="color:#f5ab35">4</span>) [&hellip;], (<span style="color:#f5ab35">4</span>) [&hellip;], (<span style="color:#f5ab35">4</span>) [&hellip;], (<span style="color:#f5ab35">4</span>) [&hellip;], (<span style="color:#f5ab35">4</span>) [&hellip;], (<span style="color:#f5ab35">4</span>) [&hellip;], (<span style="color:#f5ab35">4</span>) [&hellip;], (<span style="color:#f5ab35">4</span>) [&hellip;] ]
​
<span style="color:#f5ab35">0</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#abe338">&quot;&quot;</span>, <span style="color:#abe338">&quot;R888&quot;</span>, <span style="color:#abe338">&quot;R41022&quot;</span>, &hellip; ]
​
<span style="color:#f5ab35">1</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#f5ab35">2022</span>, <span style="color:#abe338">&quot;0.13&quot;</span>, <span style="color:#abe338">&quot;0.13&quot;</span>, &hellip; ]
​
<span style="color:#f5ab35">2</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#f5ab35">2023</span>, <span style="color:#abe338">&quot;0.13&quot;</span>, <span style="color:#abe338">&quot;0.13&quot;</span>, &hellip; ]
​
<span style="color:#f5ab35">3</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#f5ab35">2024</span>, <span style="color:#abe338">&quot;0.13&quot;</span>, <span style="color:#abe338">&quot;0.13&quot;</span>, &hellip; ]
​
<span style="color:#f5ab35">4</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#f5ab35">2025</span>, <span style="color:#abe338">&quot;0.12&quot;</span>, <span style="color:#abe338">&quot;0.12&quot;</span>, &hellip; ]
​
<span style="color:#f5ab35">5</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#f5ab35">2026</span>, <span style="color:#abe338">&quot;0.12&quot;</span>, <span style="color:#abe338">&quot;0.12&quot;</span>, &hellip; ]
​
<span style="color:#f5ab35">6</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#f5ab35">2027</span>, <span style="color:#abe338">&quot;0.16&quot;</span>, <span style="color:#abe338">&quot;0.16&quot;</span>, &hellip; ]
​
<span style="color:#f5ab35">7</span>: Array(<span style="color:#f5ab35">4</span>) [ <span style="color:#f5ab35">2028</span>, <span style="color:#abe338">&quot;0.16&quot;</span>, <span style="color:#abe338">&quot;0.16&quot;</span>, &hellip; ]</code></pre>

<p><code>我需要写一个table来展示每个元素，但是不能动态展示，因为元素之间需要有其他内容，</code></p>

<p><code>首先定义table：</code></p>

<pre>
<code>const CustomTable = ({ data, columns }) =&gt; {
  return (
    &lt;div&gt;
      &lt;table className=&quot;custom-table&quot;&gt;
        &lt;thead&gt;
          &lt;tr&gt;
            {columns.map((column, index) =&gt; (
              &lt;th key={index}&gt;{column}&lt;/th&gt;
            ))}
          &lt;/tr&gt;
        &lt;/thead&gt;
        &lt;tbody&gt;
          {data.map((row, rowIndex) =&gt; (
            &lt;tr key={rowIndex}&gt;
              {row.map((cell, cellIndex) =&gt; (
                &lt;td key={cellIndex}&gt;{cell}&lt;/td&gt;
              ))}
            &lt;/tr&gt;
          ))}
        &lt;/tbody&gt;
      &lt;/table&gt;
    &lt;/div&gt;
  );
};
</code>然后定义数据源：
</pre>

<p>例如这样使用：</p>

<pre>
<code>const MyComponent = () =&gt; {
  const processedData = {
    scrapDischargeRateDefaultData: [
      [&quot;Year&quot;, &quot;Value 1&quot;, &quot;Value 2&quot;, &quot;Value 3&quot;],
      [&quot;2020&quot;, &quot;10%&quot;, &quot;20%&quot;, &quot;30%&quot;],
      [&quot;2021&quot;, &quot;15%&quot;, &quot;25%&quot;, &quot;35%&quot;],
      [&quot;2022&quot;, &quot;12%&quot;, &quot;22%&quot;, &quot;32%&quot;],
    ],
    // 其他 processedData 的元素数据
  };

  return (
    &lt;div&gt;
      &lt;h2&gt;Table 1&lt;/h2&gt;
      &lt;CustomTable
        data={processedData.scrapDischargeRateDefaultData}
        columns={processedData.scrapDischargeRateDefaultData[0]}
      /&gt;

      &lt;h2&gt;Table 2&lt;/h2&gt;
      &lt;CustomTable
        data={processedData.otherData}
        columns={processedData.otherData[0]}
      /&gt;

      {/* 其他使用 CustomTable 的示例 */}
    &lt;/div&gt;
  );
};</code></pre>

<p><code>在render中，注意使用的时候需要判断是否已经从接口得到了数据：</code></p>

<pre>
<code>let factorProductionTableData = [[]]

let factorByYearTableData = [[]]

let factorTuiYiTableData = [[]]

if (processedData &amp;&amp; processedData[&#39;factorProductionDefaultData&#39;]) {

&nbsp; factorProductionTableData = processedData[&#39;factorProductionDefaultData&#39;]

&nbsp; factorByYearTableData = processedData[&#39;factorByYearDefaultData&#39;]

&nbsp; factorTuiYiTableData = processedData[&#39;factorTuiYiDefaultData&#39;]

}</code></pre>

<p>在使用的时候，把第一行删除，使用第一行做header：</p>

<pre>
<code>&lt;CustomTable

&nbsp; data={factorTuiYiTableData.slice(1)}

&nbsp; columns={factorTuiYiTableData[0]}

/&gt;</code></pre>

<p>&nbsp;</p>

