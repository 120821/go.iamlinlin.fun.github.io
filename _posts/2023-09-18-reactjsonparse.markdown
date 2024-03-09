---
layout: post
title: "react JSON.parse() 的使用"
date: "2023-09-18"
categories: 
---
<p>json是这样的：</p>

{% highlight %}
{% highlight %}== params:  {&quot;EF_dis&quot;:<span style="color:#f5ab35">null</span>,&quot;EF_ini&quot;:[<span style="color:#f5ab35">0.2</span>,<span style="color:#f5ab35">0.30000000000000004</span>,<span style="color:#f5ab35">0.4</span>,<span style="color:#f5ab35">0.5</span>,<span style="color:#f5ab35">0.6000000000000001</span>,<span style="color:#f5ab35">0.7</span>,<span style="color:#f5ab35">0.8</span>],&quot;EF_ope&quot;:<span style="color:#f5ab35">null</span>,&quot;EF_ser&quot;:<span style="color:#f5ab35">null</span>,&quot;f&quot;:[<span style="color:#f5ab35">0.5</span>,<span style="color:#f5ab35">0.6</span>,<span style="color:#f5ab35">0.7</span>,<span style="color:#f5ab35">0.8</span>,<span style="color:#f5ab35">0.9</span>,<span style="color:#f5ab35">1</span>,<span style="color:#f5ab35">1.1</span>],&quot;m_ini&quot;:<span style="color:#f5ab35">null</span>,&quot;m_ser&quot;:<span style="color:#f5ab35">null</span>,&quot;materials&quot;:[<span style="color:#abe338">&quot;R41022&quot;</span>,<span style="color:#abe338">&quot;R4102&quot;</span>,<span style="color:#abe338">&quot;R410&quot;</span>],&quot;production&quot;:[[<span style="color:#abe338">&quot;&quot;</span>,<span style="color:#abe338">&quot;R41022&quot;</span>,<span style="color:#abe338">&quot;R4102&quot;</span>,<span style="color:#abe338">&quot;R410&quot;</span>],[<span style="color:#abe338">&quot;2022&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>],[<span style="color:#abe338">&quot;2023&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>],[<span style="color:#abe338">&quot;2024&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>],[<span style="color:#abe338">&quot;2025&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>],[<span style="color:#abe338">&quot;2026&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>],[<span style="color:#abe338">&quot;2027&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>],[<span style="color:#abe338">&quot;2028&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>,<span style="color:#abe338">&quot;33&quot;</span>]],&quot;r&quot;:<span style="color:#f5ab35">null</span>,&quot;s&quot;:[<span style="color:#f5ab35">0.8</span>,<span style="color:#f5ab35">0.9</span>,<span style="color:#f5ab35">1</span>,<span style="color:#f5ab35">1.1</span>,<span style="color:#f5ab35">1.2000000000000002</span>,<span style="color:#f5ab35">1.3</span>,<span style="color:#f5ab35">1.4000000000000001</span>],&quot;sale&quot;:<span style="color:#f5ab35">null</span>,&quot;template&quot;:{&quot;id&quot;:<span style="color:#f5ab35">4</span>,&quot;calculation_templates&quot;:<span style="color:#f5ab35">null</span>,&quot;name&quot;:<span style="color:#abe338">&quot;工业和商业制冷&quot;</span>,&quot;english_name&quot;:<span style="color:#abe338">&quot;&quot;</span>,&quot;explain&quot;:<span style="color:#abe338">&quot;工业和商业制冷计算模板&quot;</span>,&quot;algorithm_name&quot;:<span style="color:#abe338">&quot;工业和商业制冷&quot;</span>,&quot;initial_discharge_rate&quot;:<span style="color:#f5ab35">0.12</span>,&quot;initial_filling_amount&quot;:<span style="color:#f5ab35">0.12</span>,&quot;operating_discharge_rate&quot;:<span style="color:#f5ab35">0.16</span>,&quot;maintenance_discharge_rate&quot;:<span style="color:#f5ab35">0.12</span>,&quot;maintenance_filling_rate&quot;:<span style="color:#f5ab35">0.13</span>,&quot;annual_maintenance_rate&quot;:<span style="color:#f5ab35">0.13</span>,&quot;scrap_discharge_rate&quot;:<span style="color:#f5ab35">0.13</span>,&quot;factor_tui_yi&quot;:<span style="color:#f5ab35">0</span>,&quot;factor_by_year&quot;:<span style="color:#f5ab35">0</span>,&quot;factor_production&quot;:<span style="color:#f5ab35">0</span>,&quot;created_at&quot;:<span style="color:#abe338">&quot;0001-01-01T00:00:00Z&quot;</span>,&quot;updated_at&quot;:<span style="color:#abe338">&quot;0001-01-01T00:00:00Z&quot;</span>},&quot;year_end&quot;:<span style="color:#f5ab35">2028</span>,&quot;year_start&quot;:<span style="color:#f5ab35">2022</span>}{% endhighlight %}

<p>代码是这样的：</p>

{% highlight %}
{% highlight %}console.log(&quot;== data: &quot;, data);
if (data.length !== 0) {
  data.map((item) =&gt; {
    console.log(&quot;== item: &quot;, item);
    const params = item.params;
    console.log(&quot;== params: &quot;, params);
    console.log(&quot;== params.year_start: &quot;, params?.year_start);
    const year_start = params?.year_start;
    const year_end = params?.year_end;
    console.log(&quot;== data.year_start: &quot;, year_start);
    console.log(&quot;== data.year_end: &quot;, year_end);
  });
}{% endhighlight %}

<p>{% highlight %}但是得等到的结果是：{% endhighlight %}</p>

<p><code style="white-space: pre-wrap;">== params.year_start: undefined index.jsx:<span style="color:#f5ab35">22</span>{% endhighlight %}</p>

{% highlight %}
{% highlight %}== data.year_start:  undefined index.jsx:<span style="color:#f5ab35">25</span>
== data.year_end:  undefined{% endhighlight %}

<p>查看日志发现结构是不一样的，params是一个字符串， 所以处理应该使用JSON.parse():</p>

{% highlight %}
{% highlight %}console.log(&quot;== data: &quot;, data);
if (data.length !== 0) {
  data.map((item) =&gt; {
    console.log(&quot;== item: &quot;, item);
    const params = JSON.parse(item?.params);
    console.log(&quot;== params: &quot;, params);
    console.log(&quot;== params.year_start: &quot;, params?.year_start);
    console.log(&quot;== params.year_end: &quot;, params?.year_end);
  });
}
{% endhighlight %}

