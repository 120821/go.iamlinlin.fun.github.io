---
layout: post
title: "react 下载CSV，JSON.parse处理数据的格式"
date: "2023-11-12"
categories: 
---
<p>我对于页面的某种计算结果进行处理后下载CSV：</p>

<p>我使用这样的测试，但是是不可以使用的：</p>

{% highlight %}
{% highlight %}const resultsData = [
  {&quot;bank_count&quot;: 908, &quot;result&quot;: 18, &quot;year&quot;: 2010},
  {&quot;bank_count&quot;: 953, &quot;result&quot;: 37, &quot;year&quot;: 2011},
  {&quot;bank_count&quot;: 1861, &quot;result&quot;: 56, &quot;year&quot;: 2012},
  {&quot;bank_count&quot;: 1906, &quot;result&quot;: 75, &quot;year&quot;: 2013},
  {&quot;bank_count&quot;: 2814, &quot;result&quot;: 94, &quot;year&quot;: 2014},
  {&quot;bank_count&quot;: 2859, &quot;result&quot;: 113, &quot;year&quot;: 2015},
  {&quot;bank_count&quot;: 3767, &quot;result&quot;: 133, &quot;year&quot;: 2016},
  {&quot;bank_count&quot;: 3812, &quot;result&quot;: 152, &quot;year&quot;: 2017},
  {&quot;bank_count&quot;: 4720, &quot;result&quot;: 171, &quot;year&quot;: 2018},
  {&quot;bank_count&quot;: 4765, &quot;result&quot;: 190, &quot;year&quot;: 2019},
  {&quot;bank_count&quot;: 5673, &quot;result&quot;: 209, &quot;year&quot;: 2020}
];

// 格式化结果数据
let formattedResults = &quot;Results:\n\n&quot;;
resultsData.forEach((result, index) =&gt; {
  formattedResults += `Results ${index + 1}:\n`;
  formattedResults += `Bank Count: ${result.bank_count}\n`;
  formattedResults += `Result: ${result.result}\n`;
  formattedResults += `Year: ${result.year}\n\n`;
});

console.log(formattedResults);
{% endhighlight %}我发现接口展示的的数据，和React里实际进行处理的数据是不同的：（需要进一步处理）
{% endhighlight %}

{% highlight %}
{% highlight %}const rawString = &quot;[{\&quot;bank_count\&quot;:908,\&quot;result\&quot;:18,\&quot;year\&quot;:2010},{\&quot;bank_count\&quot;:953,\&quot;result\&quot;:37,\&quot;year\&quot;:2011},{\&quot;bank_count\&quot;:1861,\&quot;result\&quot;:56,\&quot;year\&quot;:2012},{\&quot;bank_count\&quot;:1906,\&quot;result\&quot;:75,\&quot;year\&quot;:2013},{\&quot;bank_count\&quot;:2814,\&quot;result\&quot;:94,\&quot;year\&quot;:2014},{\&quot;bank_count\&quot;:2859,\&quot;result\&quot;:113,\&quot;year\&quot;:2015},{\&quot;bank_count\&quot;:3767,\&quot;result\&quot;:133,\&quot;year\&quot;:2016},{\&quot;bank_count\&quot;:3812,\&quot;result\&quot;:152,\&quot;year\&quot;:2017},{\&quot;bank_count\&quot;:4720,\&quot;result\&quot;:171,\&quot;year\&quot;:2018},{\&quot;bank_count\&quot;:4765,\&quot;result\&quot;:190,\&quot;year\&quot;:2019},{\&quot;bank_count\&quot;:5673,\&quot;result\&quot;:209,\&quot;year\&quot;:2020}]&quot;;

// 解析原始字符串为JavaScript对象
const parsedObject = JSON.parse(rawString);

// 获取解析后的结果数组
const resultsArray = Array.isArray(parsedObject) ? parsedObject : [];

// 将结果数组转换为JSON字符串（移除转义字符）
const jsonString = JSON.stringify(resultsArray);

console.log(jsonString);
{% endhighlight %}
{% endhighlight %}

<p>&nbsp;</p>

