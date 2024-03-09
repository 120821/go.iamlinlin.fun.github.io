---
layout: post
title: "react download csv 功能"
date: "2023-10-26"
categories: 
---
<p>写一个download的方法：</p>

<pre>
<code>const handleDownload = () =&gt; {
  const fileUrl = &#39;/path/to/your/file.csv&#39;; // 替换为你的 CSV 文件的路径
  window.open(fileUrl);
};
{% endhighlight %}

<p>写一个函数：</p>

<pre>
<code>function App() {
  return (
    &lt;div&gt;
      {/* 其他组件 */}

      &lt;button onClick={handleDownload}&gt;下载 CSV 文件&lt;/button&gt;
    &lt;/div&gt;
  );
}
{% endhighlight %}

<p><code>&#39;/path/to/your/file.csv&#39;可以在import的时候和其他一起使用， 例如：</code></p>

<pre>
<code>import chinaPopulationData from &#39;./china_population.csv&#39;{% endhighlight %}

<p>然后可以：</p>

<pre>
<code>const fileUrl = chinaPopulationData;{% endhighlight %}

