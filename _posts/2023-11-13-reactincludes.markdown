---
layout: post
title: "React 判断是否包含字符 includes"
date: "2023-11-13"
categories: 
---
<p>react 对字符串是否包含特定字符的判断，使用includes来判断：</p>

<pre>
<code>const myString = &quot;Hello [World]&quot;;

if (myString.includes(&quot;[&quot;)) {
  console.log(&quot;字符串包含&#39;[&#39;&quot;);
} else {
  console.log(&quot;字符串不包含&#39;[&#39;&quot;);
}{% endhighlight %}

