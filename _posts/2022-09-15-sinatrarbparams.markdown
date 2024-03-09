---
layout: post
title: "sinatrarb的使用 路由  params"
date: "2022-09-15"
categories: 
---
<div class="language-ruby highlighter-rouge">
<pre class="highlight">
带有斜杠的路由与没有斜杠的路由不同：</pre>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">get</span> <span class="s1">&#39;/foo&#39;</span> <span class="k">do</span>
  <span class="c1"># Does not match &quot;GET /foo/&quot;</span>
<span class="k">end</span>
</code></pre>
</div>

<pre class="highlight">
外部模式可能包括命名参数，可通过 params hash访问：
<code><span class="n">ruby myapp.rb
get</span> <span class="s1">&#39;/hello/:name&#39;</span> <span class="k">do</span>
  <span class="c1"># matches &quot;GET /hello/foo&quot; and &quot;GET /hello/bar&quot;</span>
  <span class="c1"># params[&#39;name&#39;] is &#39;foo&#39; or &#39;bar&#39;</span>
  <span class="s2">&quot;Hello </span><span class="si">#{</span><span class="n">params</span><span class="p">[</span><span class="s1">&#39;name&#39;</span><span class="p">]</span><span class="si">}</span><span class="s2">!&quot;</span>
<span class="k">end</span>
</code></pre>

<p><img height="100" src="/uploads/ckeditor/pictures/403/image-20220915115242-1.png" width="506" /></p>

<p>还可以通过块参数访问命名参数：</p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">get</span> <span class="s1">&#39;/hello/:name&#39;</span> <span class="k">do</span> <span class="o">|</span><span class="n">n</span><span class="o">|</span>
  <span class="c1"># matches &quot;GET /hello/foo&quot; and &quot;GET /hello/bar&quot;</span>
  <span class="c1"># params[&#39;name&#39;] is &#39;foo&#39; or &#39;bar&#39;</span>
  <span class="c1"># n stores params[&#39;name&#39;]</span>
  <span class="s2">&quot;Hello </span><span class="si">#{</span><span class="n">n</span><span class="si">}</span><span class="s2">!&quot;</span>
<span class="k">end</span>
</code></pre>

<p><img height="87" src="/uploads/ckeditor/pictures/405/image-20220915115711-2.png" width="326" /></p>

<p><img height="100" src="/uploads/ckeditor/pictures/404/image-20220915115657-1.png" width="506" /></p>

<p>路由模式还可能包括 splat（或通配符）参数，可通过 params[&#39;splat&#39;] 数组访问：</p>

<p>&nbsp;</p>

<p>使用class方法</p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="k">class</span> <span class="nc">Stream</span>
  <span class="k">def</span> <span class="nf">each</span>
    <span class="mi">100</span><span class="p">.</span><span class="nf">times</span> <span class="p">{</span> <span class="o">|</span><span class="n">i</span><span class="o">|</span> <span class="k">yield</span> <span class="s2">&quot;</span><span class="si">#{</span><span class="n">i</span><span class="si">}</span><span class="se">\n</span><span class="s2">&quot;</span> <span class="p">}</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="n">get</span><span class="p">(</span><span class="s1">&#39;/&#39;</span><span class="p">)</span> <span class="p">{</span> <span class="no">Stream</span><span class="p">.</span><span class="nf">new</span> <span class="p">}</span>
</code></pre>

<p><img height="134" src="/uploads/ckeditor/pictures/406/image-20220915135506-1.png" width="1597" /></p>
</div>

<p>首先创建新的目录：views，创建新的文件：views/index.erb, erb文件的调用（前几步应该有创建目录views、public）</p>

<div class="language-ruby highlighter-rouge">
<pre class="highlight">
<code><span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span>
  <span class="n">erb</span> <span class="ss">:index</span>
<span class="k">end</span>
</code></pre>

<p>也可以直接传入模板内容，而不是模板名称：</p>

<pre class="highlight">
<code><span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span>
  <span class="n">code</span> <span class="o">=</span> <span class="s2">&quot;&lt;%= Time.now %&gt;&quot;</span>
  <span class="n">erb</span> <span class="n">code</span>
<span class="k">end</span>
</code></pre>

<p><img height="134" src="/uploads/ckeditor/pictures/407/image-20220915141420-2.png" width="469" /></p>
</div>

<p>layout的使用：</p>

<pre class="highlight">
<code><span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span>
  <span class="n">erb</span> <span class="ss">:index</span><span class="p">,</span> <span class="ss">:layout</span> <span class="o">=&gt;</span> <span class="ss">:post</span>
<span class="k">end</span>
</code></pre>

<p>这将呈现嵌入在 views/post.erb 中的 views/index.erb（默认为 views/layout.erb，如果存在）。</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
</div>

