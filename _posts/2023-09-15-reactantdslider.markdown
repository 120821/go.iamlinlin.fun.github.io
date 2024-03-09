---
layout: post
title: "react antd slider"
date: "2023-09-15"
categories: 
---
<p>refer: <a href="https://ant.design/components/slider-cn">https://ant.design/components/slider-cn</a><br />
使用的时候，注意需要的是什么，是一个圆圈，还是一条范围，或是带有很多特定点的范围，很多特定点的但是只能显示一个圆圈的slider:</p>

<p>1.简单的：这个例子是使用了一条只有一个圆圈的slider和一个带有两个特定的点且两个特定点之间是范围的slider</p>

{% highlight %}
{% highlight %}import React, { useState } from &#39;react&#39;;
import { Slider, Switch } from &#39;antd&#39;;
const App = () =&gt; {
  const [disabled, setDisabled] = useState(false);
  const onChange = (checked) =&gt; {
    setDisabled(checked);
  };
  return (
    &lt;&gt;
      &lt;Slider defaultValue={30} disabled={disabled} /&gt;
      &lt;Slider range defaultValue={[20, 50]} disabled={disabled} /&gt;
      Disabled: &lt;Switch size=&quot;small&quot; checked={disabled} onChange={onChange} /&gt;
    &lt;/&gt;
  );
};
export default App;{% endhighlight %}

<p>2.带有tooltip: 可以设置默认值和tooltip</p>

{% highlight %}
{% highlight %}import React from &#39;react&#39;;
import { Slider } from &#39;antd&#39;;
const App = () =&gt; (
  &lt;Slider
    defaultValue={30}
    tooltip={{
      open: true,
    }}
  /&gt;
);
export default App;{% endhighlight %}

