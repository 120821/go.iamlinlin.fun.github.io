---
layout: post
title: "go FormatFloat 保留小数"
date: "2023-11-01"
categories: 
---
<p>使用<code>strconv</code>包中的<code>FormatFloat</code>函数来格式化浮点数并保留指定的小数位数</p>

<p>引入：</p>

<pre>
<code><span style="color:#dcc6e0">import</span> <span style="color:#abe338">&quot;strconv&quot;</span>{% endhighlight %}

<p>调用：</p>

<pre>
<code><span style="color:#d4d0ab">// 保留2位小数</span>
emissionInit[i] := formatFloat(sale[i][<span style="color:#f5ab35">1</span>] * EF_ini[i], <span style="color:#f5ab35">2</span>)

<span style="color:#d4d0ab">// 保留2位小数</span>
emissionOperation[i] := formatFloat(sale[i][<span style="color:#f5ab35">1</span>] * (<span style="color:#f5ab35">1</span> - EF_ini[i]) * EF_ope[i], <span style="color:#f5ab35">2</span>)

<span style="color:#d4d0ab">// 保留2位小数</span>
emissionService[i] := formatFloat((sale[i][<span style="color:#f5ab35">1</span>] - emissionInit[i] - emissionService[i]) * EF_ser[i], <span style="color:#f5ab35">2</span>){% endhighlight %}

