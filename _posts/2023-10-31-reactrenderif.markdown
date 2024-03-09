---
layout: post
title: "react render if 的使用"
date: "2023-10-31"
categories: 
---
<p>react 在Render里做判断，如果a就渲染单位：吨，如果b就渲染单位台。</p>

<p>示例：</p>

<pre>
<code>import React from &#39;react&#39;;

class YourComponent extends React.Component {
  render() {
    const { a, b } = this.props; // 假设a和b是组件的props

    let unit;
    if (a) {
      unit = &#39;吨&#39;;
    } else if (b) {
      unit = &#39;台&#39;;
    }

    return (
      &lt;div&gt;
        单位：{unit}
      &lt;/div&gt;
    );
  }
}

export default YourComponent;{% endhighlight %}

