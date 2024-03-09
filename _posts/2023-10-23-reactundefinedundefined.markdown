---
layout: post
title: "react undefined 'undefined'的区别"
date: "2023-10-23"
categories: 
---
<p>{% highlight %}undefined{% endhighlight %}是JavaScript中的特殊值，表示一个未定义的变量或属性。</p>

<p>{% highlight %}&#39;undefined&#39;{% endhighlight %}是一个字符串，它的值就是字面上的</p>

<p>例如：</p>

{% highlight %}
{% highlight %}import React from &#39;react&#39;;

function ExampleComponent() {
  let variable1; // 未定义的变量
  let variable2 = &#39;undefined&#39;; // 字符串值为 &#39;undefined&#39;

  console.log(variable1); // 输出 undefined
  console.log(typeof variable1); // 输出 &quot;undefined&quot;

  console.log(variable2); // 输出 &quot;undefined&quot;
  console.log(typeof variable2); // 输出 &quot;string&quot;

  return (
    &lt;div&gt;
      {variable1} {/* 输出 undefined */}
      {variable2} {/* 输出 &quot;undefined&quot; */}
    &lt;/div&gt;
  );
}{% endhighlight %}

<p>{% highlight %}variable1{% endhighlight %}是一个未定义的变量，它的值为{% highlight %}undefined{% endhighlight %}，而{% highlight %}variable2{% endhighlight %}是一个被赋值为字符串{% highlight %}&#39;undefined&#39;{% endhighlight %}的变量。当你在React组件中将它们作为内容输出时，{% highlight %}variable1{% endhighlight %}会显示为{% highlight %}undefined{% endhighlight %}，而{% highlight %}variable2{% endhighlight %}会显示为字符串{% highlight %}&#39;undefined&#39;{% endhighlight %}</p>

<p>&nbsp;</p>

