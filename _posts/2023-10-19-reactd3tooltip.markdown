---
layout: post
title: "react d3 显示靠近南海的省份的Tooltip"
date: "2023-10-19"
categories: 
---
<p>我在react写了两个地图，一个画中国地图的南海以外的省份，一个画南海的省份，但是只画南海的地图影响了不画南海的地图，不画南海的地图的Tooltip，靠近南海地图的省份都不显示Tooltip了。</p>

<p>我使用z-index调整了俩个svg的位置，但是不生效，放在不同的容器也不行：<br />
&nbsp;</p>

{% highlight %}
{% highlight %}{yearlyDataArray.map((yearlyObjArray, index) =&gt; {
  if (yearlyObjArray[0].year === value) {
    return (
      &lt;div key={index}&gt;
        &lt;MyMapToShowResult realData={yearlyObjArray} /&gt;
      &lt;/div&gt;
    );
  }
})}
&lt;div style={{ marginLeft: &#39;-270px&#39;, marginTop: &#39;-170px&#39;, zIndex: -1 }}&gt;
  &lt;ChinaMapBorder /&gt;
&lt;/div&gt;{% endhighlight %}

<p>解决：使用CSS的{% highlight %}pointer-events{% endhighlight %}属性来控制交互事件</p>

<p>代码：</p>

{% highlight %}
{% highlight %}&lt;div style={{ pointerEvents: &#39;none&#39; }}&gt;
  &lt;ChinaMapBorder /&gt;
&lt;/div&gt;{% endhighlight %}

<p>通过将{% highlight %}pointer-events{% endhighlight %}属性设置为{% highlight %}none{% endhighlight %}，该容器将不会响应鼠标事件，从而避免南海地图的覆盖对不画南海的地图的交互产生影响。</p>

<p>同时，z-index还是需要正确的叠放两个地图。确保没有南海的地图的z-index层级更高。</p>

