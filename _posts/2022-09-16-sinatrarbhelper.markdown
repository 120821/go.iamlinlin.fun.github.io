---
layout: post
title: "sinatrarb helper"
date: "2022-09-16"
categories: 
---
<p><a href="https://sinatrarb.com/intro.html">https://sinatrarb.com/intro.html</a></p>
<div class="language-ruby highlighter-rouge">
<pre class="highlight">
{% highlight html %}<span class="n">1.在顶部使用
helpers</span> <span class="k">do</span>
<span class="k">def</span> <span class="nf">bar</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span>
<span class="s2">&quot;</span><span class="si">#{</span><span class="nb">name</span><span class="si">}</span><span class="s2">bar&quot;</span>
<span class="k">end</span>
<span class="k">end</span>
<span class="n">get</span> <span class="s1">&#39;/:name&#39;</span> <span class="k">do</span>
<span class="n">bar</span><span class="p">(</span><span class="n">params</span><span class="p">[</span><span class="s1">&#39;name&#39;</span><span class="p">])</span>
<span class="k">end</span>
{% endhighlight %}
<p>2.或者，可以在模块中单独定义辅助方法：</p>
<div class="language-ruby highlighter-rouge">
<pre class="highlight">
{% highlight html %}<span class="k">module</span> <span class="nn">FooUtils</span>
<span class="k">def</span> <span class="nf">foo</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span> <span class="s2">&quot;</span><span class="si">#{</span><span class="nb">name</span><span class="si">}</span><span class="s2">foo&quot;</span> <span class="k">end</span>
<span class="k">end</span>
<span class="k">module</span> <span class="nn">BarUtils</span>
<span class="k">def</span> <span class="nf">bar</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span> <span class="s2">&quot;</span><span class="si">#{</span><span class="nb">name</span><span class="si">}</span><span class="s2">bar&quot;</span> <span class="k">end</span>
<span class="k">end</span>
<span class="n">helpers</span> <span class="no">FooUtils</span><span class="p">,</span> <span class="no">BarUtils</span>
{% endhighlight %}
</div>
</div>
