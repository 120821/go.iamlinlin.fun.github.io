---
layout: post
title: "react roundToDecimal 四舍五入保留小数"
date: "2023-11-01"
categories: 
---
<p>使用函数roundToDecimal，可以四舍五入：</p>
<p>引入</p>
{% highlight html %}<span style="color:#dcc6e0">import</span> <span style="color:#abe338">&quot;strconv&quot;</span>{% endhighlight %}
<p>写函数：</p>
{% highlight html %}// 每次计算都保留n位小数
func roundToDecimal(<span style="color:#f5ab35">num</span> float64, decimalPlaces int) float<span style="color:#f5ab35">64</span> {
output <span style="color:#abe338">:=</span> strconv.FormatFloat(<span style="color:#f5ab35">num</span>, &#39;f&#39;, decimalPlaces, <span style="color:#f5ab35">64</span>)
result, _ <span style="color:#abe338">:=</span> strconv.ParseFloat(<span style="color:#ffa07a">output</span>, <span style="color:#f5ab35">64</span>)
return result
}{% endhighlight %}
<p>调用：</p>
{% highlight html %}<span style="color:#d4d0ab">// 保留2位小数</span>
emissionInit[i] := roundToDecimal(sale[i][<span style="color:#f5ab35">1</span>] * EF_ini[i], <span style="color:#f5ab35">2</span>){% endhighlight %}
