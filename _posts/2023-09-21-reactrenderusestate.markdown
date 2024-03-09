---
layout: post
title: "react 手动调用render: usestate 函数组件"
date: "2023-09-21"
categories: 
---
<p>使用useState(如果使用的是函数组件可以这样使用，如果是类组件就不行。）</p>

<p>有这样的语句就是类组件：</p>

{% highlight %}
{% highlight %}export <span style="color:#dcc6e0">default</span> <span style="color:#dcc6e0">class</span> <span style="color:#00e0e0">ShowResultAsMap</span> <span style="color:#dcc6e0">extends</span> <span style="color:#00e0e0">Component</span> {{% endhighlight %}

<p>函数组件示例：</p>

{% highlight %}
{% highlight %}function FunctionComponent(props) {
  return &lt;div&gt;Hello, {props.name}!&lt;/div&gt;;
}{% endhighlight %}

<p>{% highlight %}类组件示例：{% endhighlight %}</p>

{% highlight %}
{% highlight %}class ClassComponent extends React.Component {
  render() {
    return &lt;div&gt;Hello, {this.props.name}!&lt;/div&gt;;
  }
}{% endhighlight %}

<p>使用useState的函数组件完整示例：</p>

{% highlight %}
{% highlight %}<span style="color:#dcc6e0">import</span> React, { useState } <span style="color:#dcc6e0">from</span> <span style="color:#abe338">&#39;react&#39;</span>;

<span style="color:#dcc6e0">function</span> <span style="color:#00e0e0">MyComponent</span>() {
  <span style="color:#dcc6e0">const</span> [count, setCount] = useState(<span style="color:#f5ab35">0</span>);

  <span style="color:#dcc6e0">function</span> <span style="color:#00e0e0">handleClick</span>() {
    <span style="color:#d4d0ab">// 更新 count 的值，触发重新渲染</span>
    setCount(count + <span style="color:#f5ab35">1</span>);
  }

  <span style="color:#dcc6e0">return</span> (
    <span style="color:#ffa07a">&lt;</span><span style="color:#ffa07a">div</span><span style="color:#ffa07a">&gt;</span>
      <span style="color:#ffa07a">&lt;</span><span style="color:#ffa07a">p</span><span style="color:#ffa07a">&gt;</span>Count: {count}<span style="color:#ffa07a">&lt;/</span><span style="color:#ffa07a">p</span><span style="color:#ffa07a">&gt;</span>
      <span style="color:#ffa07a">&lt;</span><span style="color:#ffa07a">button</span><span style="color:#ffa07a"> </span><span style="color:#ffa07a">onClick</span><span style="color:#ffa07a">=</span><span style="color:#abe338">{handleClick}</span><span style="color:#ffa07a">&gt;</span>重新渲染<span style="color:#ffa07a">&lt;/</span><span style="color:#ffa07a">button</span><span style="color:#ffa07a">&gt;</span>
    <span style="color:#ffa07a">&lt;/</span><span style="color:#ffa07a">div</span><span style="color:#ffa07a">&gt;</span>
  );
}{% endhighlight %}

<p>&nbsp;</p>

