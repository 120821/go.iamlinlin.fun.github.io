---
layout: post
title: "react 下载CSV, 处理object、array"
date: "2023-11-12"
categories: 
---
<p>对于某个参数可以下载CSV：</p>

<pre>
<code>const consumption = &#39;{&quot;R41022&quot;:[[&quot;2010&quot;,&quot;999&quot;],[&quot;2011&quot;,&quot;777&quot;],[&quot;2012&quot;,&quot;999&quot;],[&quot;2013&quot;,&quot;777&quot;],[&quot;2014&quot;,&quot;999&quot;],[&quot;2015&quot;,&quot;777&quot;],[&quot;2016&quot;,&quot;999&quot;],[&quot;2017&quot;,&quot;777&quot;],[&quot;2018&quot;,&quot;999&quot;],[&quot;2019&quot;,&quot;777&quot;],[&quot;2020&quot;,&quot;999&quot;]],&quot;R888&quot;:[[&quot;2010&quot;,&quot;908&quot;],[&quot;2011&quot;,&quot;45&quot;],[&quot;2012&quot;,&quot;908&quot;],[&quot;2013&quot;,&quot;45&quot;],[&quot;2014&quot;,&quot;908&quot;],[&quot;2015&quot;,&quot;45&quot;],[&quot;2016&quot;,&quot;908&quot;],[&quot;2017&quot;,&quot;45&quot;],[&quot;2018&quot;,&quot;908&quot;],[&quot;2019&quot;,&quot;45&quot;],[&quot;2020&quot;,&quot;908&quot;]]}&#39;;

const parsedConsumption = JSON.parse(consumption);

// 遍历解析后的对象，并显示数据
for (const key in parsedConsumption) {
  const data = parsedConsumption[key];
  console.log(`Key: ${key}`);
  data.forEach(([year, value]) =&gt; {
    console.log(`Year: ${year}, Value: ${value}`);
  });
}{% endhighlight %}

<p>运行后会显示这样的数据：</p>

<pre>
<code>Key: <span style="color:#abe338">R41022</span>
Year: <span style="color:#f5ab35">2010</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">999</span>
Year: <span style="color:#f5ab35">2011</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">777</span>
Year: <span style="color:#f5ab35">2012</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">999</span>
Year: <span style="color:#f5ab35">2013</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">777</span>
Year: <span style="color:#f5ab35">2014</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">999</span>
Year: <span style="color:#f5ab35">2015</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">777</span>
Year: <span style="color:#f5ab35">2016</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">999</span>
Year: <span style="color:#f5ab35">2017</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">777</span>
Year: <span style="color:#f5ab35">2018</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">999</span>
Year: <span style="color:#f5ab35">2019</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">777</span>
Year: <span style="color:#f5ab35">2020</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">999</span>
Key: <span style="color:#abe338">R888</span>
Year: <span style="color:#f5ab35">2010</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">908</span>
Year: <span style="color:#f5ab35">2011</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">45</span>
Year: <span style="color:#f5ab35">2012</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">908</span>
Year: <span style="color:#f5ab35">2013</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">45</span>
Year: <span style="color:#f5ab35">2014</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">908</span>
Year: <span style="color:#f5ab35">2015</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">45</span>
Year: <span style="color:#f5ab35">2016</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">908</span>
Year: <span style="color:#f5ab35">2017</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">45</span>
Year: <span style="color:#f5ab35">2018</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">908</span>
Year: <span style="color:#f5ab35">2019</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">45</span>
Year: <span style="color:#f5ab35">2020</span><span style="color:#abe338">,</span> Value: <span style="color:#f5ab35">908</span>{% endhighlight %}

