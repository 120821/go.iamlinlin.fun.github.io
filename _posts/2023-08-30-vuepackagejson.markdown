---
layout: post
title: "vue package.json ^的作用"
date: "2023-08-30"
categories: 
---
<p>^用来确定版本的范围，不加^就是精确匹配。例如：</p>

<pre>
<code><span style="color:#abe338">119 </span>    <span style="color:#abe338">&quot;vue-style-loader&quot;</span>: <span style="color:#abe338">&quot;^4.1.0&quot;</span>,
<span style="color:#abe338">120 </span>    <span style="color:#abe338">&quot;vue-template-compiler&quot;</span>: <span style="color:#abe338">&quot;2.6.12&quot;</span>,{% endhighlight %}

<p>第119行，有^,那么就可以更新到4.x.x版本，第120行就没有^,只能精确匹配2.6.12.</p>

