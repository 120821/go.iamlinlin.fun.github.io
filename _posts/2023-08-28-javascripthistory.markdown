---
layout: post
title: "javascript history 的简单使用"
date: "2023-08-28"
categories: 
---
<p>在点击链接的时候，可以使用history进行页面的返回：</p>

<p>在rails可以这样：</p>

<pre>
<code>&lt;%= button_tag <span style="color:#abe338">&#39;返回&#39;</span>, <span style="color:#dcc6e0">class</span>: &#39;<span style="color:#00e0e0">btn</span> <span style="color:#00e0e0">btn</span>-<span style="color:#00e0e0">primary</span>&#39;, <span style="color:#00e0e0">style</span>: &#39;<span style="color:#00e0e0">width</span>: 150<span style="color:#00e0e0">px</span>; <span style="color:#abe338">float:</span> left; background-<span style="color:#abe338">color:</span> white; <span style="color:#abe338">color:</span> <span style="color:#d4d0ab">#0d6efd;&#39;, onclick: &#39;goBack()&#39; %&gt;</span>{% endhighlight %}

<p>然后加入js即可：</p>

<pre>
<code><span style="color:#dcc6e0">function</span> <span style="color:#00e0e0">goBack</span>() {
  history.back();
}
{% endhighlight %}

