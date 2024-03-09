---
layout: post
title: "react render  img避免使用image photo picture字样"
date: "2023-11-05"
categories: 
---
<p>react render的时候：</p>

<pre>
<code>Line <span style="color:#f5ab35">17</span>:<span style="color:#f5ab35">13</span>:  Redundant alt attribute. Screen-readers already announce `img` tags as an image. You don&rsquo;t need to use the words `image`, `photo,` or `picture` (<span style="color:#f5ab35">or</span> any specified custom words) in the alt prop  jsx-a<span style="color:#f5ab35">11</span>y/img-
redundant-alt{% endhighlight %}

<p>是因为使用了image字样在img里：</p>

<p>这样是不对的：</p>

<pre>
<code><span style="color:#ffa07a">&lt;</span><span style="color:#ffa07a">img</span><span style="color:#ffa07a"> </span><span style="color:#ffa07a">src</span><span style="color:#ffa07a">=</span><span style="color:#abe338">{HeadImage}</span><span style="color:#ffa07a"> </span><span style="color:#ffa07a">alt</span><span style="color:#ffa07a">=</span><span style="color:#abe338">&quot;Head Image&quot;</span><span style="color:#ffa07a"> /&gt;</span>{% endhighlight %}

<p>需要修改为：</p>

<pre>
<code>&lt;img src={HeadImage} alt=&quot;Fairy Avatar&quot; /&gt;{% endhighlight %}

<p>&nbsp;<code>alt</code> 属性中避免使用 &quot;image&quot;、&quot;photo&quot;、&quot;picture&quot; 或任何其他指定的自定义词语，因为屏幕阅读器已经会自动将 <code>img</code> 标签读作图片。</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

