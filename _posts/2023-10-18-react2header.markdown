---
layout: post
title: "react 数组根据列处理数据格式， 显示第2列的不是header的数据"
date: "2023-10-18"
categories: 
---
<p>我想得到生产排放因子(factor_production)的每一年的数据：</p>

<pre>
<code>let foamParamsData = data.data.foam_params_data
const dataParams = JSON.parse(foamParamsData)
console.log(&quot;== dataParams: &quot;, dataParams)
let factorProductionParam = dataParams.slice(1).map(row =&gt; row[1]);
console.log(&quot;== factorProductionParam: &quot;, factorProductionParam);
let defaultData = [[&#39;&#39;, ...materialName]];
for (let i = 0; i &lt;= (endYear - startYear); i++) {
  const year = startYear + i;
  const rowData = [year];
  
  for (let j = 1; j &lt; defaultData[0].length; j++) {
    rowData.push(factorProductionParam[i]);
  }
  
  defaultData.push(rowData);
}
console.log(&quot;== defaultData: &quot;, defaultData)</code></pre>

<p>这样就可以得到第一列的数据（不包含第一行）</p>

