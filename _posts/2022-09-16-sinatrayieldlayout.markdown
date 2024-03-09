---
layout: post
title: "sinatra yield layout "
date: "2022-09-16"
categories: 
---
<p><a href="http://https://sinatrarb.com/intro.html">http://https://sinatrarb.com/intro.html</a></p>

<p>yield 进行嵌套渲染</p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">erb</span> <span class="ss">:post</span><span class="p">,</span> <span class="ss">:layout</span> <span class="o">=&gt;</span> <span class="kp">false</span> <span class="k">do</span>
  <span class="n">erb</span> <span class="ss">:index</span>
<span class="k">end</span>
{% endhighlight %}

<p>等同于：<code class="highlighter-rouge">erb :index, :layout =&gt; :post</code></p>

<p><code>当然可以进行多层嵌套：</code></p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">erb</span> <span class="ss">:main_layout</span><span class="p">,</span> <span class="ss">:layout</span> <span class="o">=&gt;</span> <span class="kp">false</span> <span class="k">do</span>
  <span class="n">erb</span> <span class="ss">:admin_layout</span> <span class="k">do</span>
    <span class="n">erb</span> <span class="ss">:user</span>
  <span class="k">end</span>
<span class="k">end</span>
{% endhighlight %}

<p>这样方便使用组件，等同于</p>

<pre class="highlight">
<code><span class="n">erb</span> <span class="ss">:admin_layout</span><span class="p">,</span> <span class="ss">:layout</span> <span class="o">=&gt;</span> <span class="ss">:main_layout</span> <span class="k">do</span>
  <span class="n">erb</span> <span class="ss">:user</span>
<span class="k">end</span>
{% endhighlight %}

<p>&nbsp;</p>
</div>

<p>&nbsp;</p>
</div>

