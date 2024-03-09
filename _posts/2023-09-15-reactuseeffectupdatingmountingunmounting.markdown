---
layout: post
title: "react useEffect updating mounting unmounting的简单使用"
date: "2023-09-15"
categories: 
---
<p>已经了解了基本用法，可以组合起来使用试试看：、</p>

<p>第一个useEffect:只会在组件挂载的时候调用一次，</p>

<p>第二个useEffect:会在count变化的时候进行调用，</p>

<p>第一个useEffect还会返回一个函数，在卸载的时候进行打印。</p>

<p>（也就是说，useEffect可以参与卸载更新挂载）</p>

<pre>
<code>import React, { useState, useEffect } from &#39;react&#39;;

function MyComponent() {
  const [count, setCount] = useState(0);

  useEffect(() =&gt; {
    console.log(&#39;Component mounted&#39;);
    
    return () =&gt; {
      console.log(&#39;Component will unmount&#39;);
    };
  }, []);

  useEffect(() =&gt; {
    console.log(&#39;Component updated&#39;);
    console.log(&#39;Count changed&#39;);
  }, [count]);

  const incrementCount = () =&gt; {
    setCount(prevCount =&gt; prevCount + 1);
  };

  return (
    &lt;div&gt;
      &lt;p&gt;Count: {count}&lt;/p&gt;
      &lt;button onClick={incrementCount}&gt;Increment&lt;/button&gt;
    &lt;/div&gt;
  );
}{% endhighlight %}

