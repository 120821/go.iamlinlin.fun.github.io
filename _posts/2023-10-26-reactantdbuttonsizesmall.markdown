---
layout: post
title: "react antd Button size small"
date: "2023-10-26"
categories: 
---
<p><a href="https://ant.design/components/button">https://ant.design/components/button</a></p>

<p>react使用antd的button， 可以调节大小，例如使用小号：</p>

{% highlight %}
{% highlight %}&lt;Button size=&quot;small&quot;&gt;小号按钮&lt;/Button&gt;{% endhighlight %}

<p>除了 {% highlight %}&#39;small&#39;{% endhighlight %}，Ant Design 的按钮还支持 {% highlight %}&#39;large&#39;{% endhighlight %}（大号）和默认尺寸（中号）。如果不设置 {% highlight %}size{% endhighlight %} 属性，默认为中号尺寸。</p>

<p>{% highlight %}小号按钮组件{% endhighlight %}示例完整的代码：</p>

{% highlight %}
{% highlight %}import React from &#39;react&#39;;
import { Button } from &#39;antd&#39;;

const YourComponent = () =&gt; {
  return (
    &lt;div&gt;
      &lt;Button size=&quot;small&quot;&gt;小号按钮&lt;/Button&gt;
    &lt;/div&gt;
  );
};

export default YourComponent;
{% endhighlight %}

