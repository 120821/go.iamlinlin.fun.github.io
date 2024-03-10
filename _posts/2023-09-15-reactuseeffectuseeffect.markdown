---
layout: post
title: "react useEffect的简单使用（同一个页面可以使用多个useEffect)"
date: "2023-09-15"
categories: 
---
<p>react中，可以在一个页面使用多个useEffect, 相互不影响。可以在组件挂载、更新或卸载时执行相应的操作。</p>
{% highlight html %}<span style="color:#dcc6e0">import</span> React, { useEffect } <span style="color:#dcc6e0">from</span> <span style="color:#abe338">&#39;react&#39;</span>;
<span style="color:#dcc6e0">function</span> <span style="color:#00e0e0">MyComponent</span>() {
useEffect(() =&gt; {
<span style="color:#d4d0ab">// 第一个 useEffect 的副作用逻辑</span>
<span style="color:#f5ab35">console</span>.log(<span style="color:#abe338">&#39;useEffect 1 triggered&#39;</span>);
<span style="color:#d4d0ab">// ...其他逻辑</span>
}, [dependency1]);
useEffect(() =&gt; {
<span style="color:#d4d0ab">// 第二个 useEffect 的副作用逻辑</span>
<span style="color:#f5ab35">console</span>.log(<span style="color:#abe338">&#39;useEffect 2 triggered&#39;</span>);
<span style="color:#d4d0ab">// ...其他逻辑</span>
}, [dependency2]);
<span style="color:#dcc6e0">return</span> (
<span style="color:#d4d0ab">// 组件的 JSX</span>
);
}{% endhighlight %}
<p>上面的这个例子里，第一个useEffect是在{% highlight html %}dependency1变化的时候会用触发， 第二个是dependency2变化的时候触发。每一个都是独立的。{% endhighlight %}</p>
