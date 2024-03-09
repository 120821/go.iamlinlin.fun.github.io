---
layout: post
title: "vue3 router-link 和 a标签 hover效果不一致"
date: "2023-11-21"
categories: 
---
<p><code>理解：router-link</code> 是 Vue Router 提供的组件，用于在 Vue.js 应用程序中进行路由导航。它在底层是通过 JavaScript 实现的，并且不直接映射到 <code>&lt;a&gt;</code> 标签。</p>

<p>在使用router-link的时候，设置的：</p>

<pre>
<code><span style="color:#dcc6e0">a</span>:hover {
  <span style="color:#ffd700">text-decoration</span>: none;
}{% endhighlight %}

<p>并不能生效，需要另外设置class:</p>

<p>例如：</p>

<pre>
<code><span style="color:#ffa07a">.no-hover-underline</span>,
<span style="color:#ffa07a">.no-hover-underline</span>:hover {
  <span style="color:#ffd700">text-decoration</span>: none;
}{% endhighlight %}

<p>然后使用：</p>

<pre>
<code>&lt;router-link to=&quot;/&quot; class=&quot;no-hover-underline&quot;&gt;Home&lt;/router-link&gt;{% endhighlight %}

<p>或者：</p>

<pre>
<code>&lt;router-link :to=&quot;route&quot; :class=&quot;{ &#39;no-hover-underline&#39;: true }&quot;&gt;Link&lt;/router-link&gt;{% endhighlight %}

