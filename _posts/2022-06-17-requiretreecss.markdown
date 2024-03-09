---
layout: post
title: "*= require_tree . 编译整个项目的css"
date: "2022-06-17"
categories: 
---
<p>{% highlight %}前后端分开就需要 注意后端与前端的样式是不同的，需要进行区分，前端设置为root 那么后端进行加载css就不需要这个tree 否则会导致样式的改变{% endhighlight %}</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">*= require_tree .{% endhighlight %}

<p>&nbsp;</p>

