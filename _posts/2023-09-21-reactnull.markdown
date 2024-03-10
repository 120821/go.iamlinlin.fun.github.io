---
layout: post
title: "react 数据处理: 过滤为null的数据"
date: "2023-09-21"
categories: 
---
<p>如果在接口返回的数据中存在null的数据，例如这样：</p>
{% highlight html %}{&quot;bank_count&quot;:<span style="color:#abe338">&quot;760.65874568&quot;</span>,&quot;emission_all&quot;:<span style="color:#abe338">&quot;712.14230283&quot;</span>,&quot;emission_discard&quot;:<span style="color:#abe338">&quot;225.96975736&quot;</span>,&quot;emission_init&quot;:<span style="color:#abe338">&quot;52.00000000&quot;</span>,&quot;emission_operation&quot;:<span style="color:#abe338">&quot;318.24504262&quot;</span>,&quot;emission_service&quot;:<span style="color:#abe338">&quot;115.92750285&quot;</span>,&quot;year&quot;:<span style="color:#f5ab35">2027</span>},<span style="color:#f5ab35">null</span>]&#39;, materialId: <span style="color:#f5ab35">16</span> }{% endhighlight %}
<p>那么页面展示的时候会出现result undefind</p>
<p>可以这样进行修改</p>
{% highlight html %}const materialResults = JSON.parse(material.results)
.filter(result =&gt; result !== null); // 过滤掉 null 值
materialResults.forEach(result =&gt; {
// 处理非空的 result 对象
const year = result.year;
const emissionAll = result.emission_all ? result.emission_all : null;
// 其他处理逻辑...
});{% endhighlight %}
<p>（2）在render里可以这样处理：</p>
{% highlight html %}&lt;tbody&gt;
{details_item.results &amp;&amp; JSON.parse(details_item.results)
.filter(item =&gt; item !== null) // 过滤掉 null 值
.map((item, index) =&gt; (
&lt;tr key={index}&gt;
{columns.map((column, index) =&gt; (
&lt;td key={index}&gt;{item[column.dataIndex]}&lt;/td&gt;
))}
&lt;/tr&gt;
))}
&lt;/tbody&gt;{% endhighlight %}
