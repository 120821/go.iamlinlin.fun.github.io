---
layout: post
title: "sinatrarb fliter"
date: "2022-09-16"
categories: 
---
<p><a href="https://sinatrarb.com/intro.html">https://sinatrarb.com/intro.html</a></p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">在路由使用fliter
before</span> <span class="ss">:agent</span> <span class="o">=&gt;</span> <span class="sr">/Songbird/</span> <span class="k">do</span>
  <span class="c1"># ...</span>
<span class="k">end</span>

<span class="n">after</span> <span class="s1">&#39;/blog/*&#39;</span><span class="p">,</span> <span class="ss">:host_name</span> <span class="o">=&gt;</span> <span class="s1">&#39;example.com&#39;</span> <span class="k">do</span>
  <span class="c1"># ...</span>
<span class="k">end</span>
</code></pre>

<p><code>例如：</code></p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">before</span> <span class="k">do</span>
  <span class="vi">@note</span> <span class="o">=</span> <span class="s1">&#39;Hi!&#39;</span>
  <span class="n">request</span><span class="p">.</span><span class="nf">path_info</span> <span class="o">=</span> <span class="s1">&#39;/foo/bar/baz&#39;</span>
<span class="k">end</span>

<span class="n">get</span> <span class="s1">&#39;/foo/*&#39;</span> <span class="k">do</span>
  <span class="vi">@note</span> <span class="c1">#=&gt; &#39;Hi!&#39;</span>
  <span class="n">params</span><span class="p">[</span><span class="s1">&#39;splat&#39;</span><span class="p">]</span> <span class="c1">#=&gt; &#39;bar/baz&#39;</span>
<span class="k">end</span>
</code></pre>

<p><code><span class="k">或者进行身份验证：</span></code></p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">before</span> <span class="s1">&#39;/protected/*&#39;</span> <span class="k">do</span>
  <span class="n">authenticate!</span>
<span class="k">end</span>

<span class="n">after</span> <span class="s1">&#39;/create/:slug&#39;</span> <span class="k">do</span> <span class="o">|</span><span class="n">slug</span><span class="o">|</span>
  <span class="n">session</span><span class="p">[</span><span class="ss">:last_slug</span><span class="p">]</span> <span class="o">=</span> <span class="n">slug</span>
<span class="k">end</span>
</code></pre>
</div>
</div>
</div>

