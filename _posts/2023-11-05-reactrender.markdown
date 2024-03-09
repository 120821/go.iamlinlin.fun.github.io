---
layout: post
title: "react render 空格"
date: "2023-11-05"
categories: 
---
<p>react render里空格需要这样写：</p>

<p>1.直接用空格：</p>

<pre>
<code>render() {
  return (
    &lt;div&gt;
      Hello{&#39; &#39;}World
    &lt;/div&gt;
  );
}{% endhighlight %}

<p>2.使用编码 <code>&amp;nbsp;</code></p>

<pre>
<code>render() {
  return (
    &lt;div&gt;
      Hello&amp;nbsp;World
    &lt;/div&gt;
  );
}{% endhighlight %}

<p>3.使用css:</p>

<pre>
<code>render() {
  return (
    &lt;div&gt;
      Hello&lt;span style={{ marginRight: &#39;4px&#39; }}&gt;&lt;/span&gt;World
    &lt;/div&gt;
  );
}{% endhighlight %}

