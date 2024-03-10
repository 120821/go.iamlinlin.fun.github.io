---
layout: post
title: "react replace "
date: "2023-08-24"
categories: 
---
<p>在Ruby中可以使用这样的替换：</p>
<p>a = &#39;adfsda&#39;</p>
<p>b = a.gsub(&#39;ad&#39;, &#39;hahha&#39;)</p>
<p>在react中可以使用replace(), 然后使用正则表达式，/as/g来进行替换，例如：</p>
{% highlight html %}import React from &#39;react&#39;;
function MyComponent() {
const str = &#39;asdfasd&#39;;
const replacedStr = str.replace(/as/g, &#39;hahah&#39;);
return (
&lt;div&gt;
&lt;p&gt;原始字符串: {str}&lt;/p&gt;
&lt;p&gt;替换结果: {replacedStr}&lt;/p&gt;
&lt;/div&gt;
);
}{% endhighlight %}
