---
layout: post
title: "react int转换为string toString()"
date: "2023-10-24"
categories: 
---
<p>refer <a href="https://stackabuse.com/javascript-convert-number-to-string/">https://stackabuse.com/javascript-convert-number-to-string/</a></p>

<p>react中使用toString可以把int转换为string:</p>

<p>例如：</p>

<pre>
<code>let a = 20

a.toString();    // &#39;20&#39;{% endhighlight %}

<pre>
<code>const myInt = 42;
const myString = myInt.toString();{% endhighlight %}

<p>完整的例子：</p>

<pre>
<code>import React from &#39;react&#39;;

class MyComponent extends React.Component {
  render() {
    const myInt = 42;
    const myString = myInt.toString();

    return (
      &lt;div&gt;
        &lt;p&gt;整数: {myInt}&lt;/p&gt;
        &lt;p&gt;字符串: {myString}&lt;/p&gt;
      &lt;/div&gt;
    );
  }
}
{% endhighlight %}

