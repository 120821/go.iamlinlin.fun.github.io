---
layout: post
title: "gin - 绑定Uri bind uri"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/bind-uri/">https://gin-gonic.com/docs/examples/bind-uri/</a></p>

<p><a href="https://github.com/gin-gonic/gin/issues/846">https://github.com/gin-gonic/gin/issues/846</a></p>

<p>示例：</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">package</span> <span style="color:#000">main</span>

<span style="color:#204a87;font-weight:700">import</span> <span style="color:#4e9a06">&quot;github.com/gin-gonic/gin&quot;</span>

<span style="color:#204a87;font-weight:700">type</span> <span style="color:#000">Person</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">ID</span>   <span style="color:#204a87;font-weight:700">string</span> <span style="color:#4e9a06">`uri:&quot;id&quot; binding:&quot;required,uuid&quot;`</span>
	<span style="color:#000">Name</span> <span style="color:#204a87;font-weight:700">string</span> <span style="color:#4e9a06">`uri:&quot;name&quot; binding:&quot;required&quot;`</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">route</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>
	<span style="color:#000">route</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/:name/:id&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#204a87;font-weight:700">var</span> <span style="color:#000">person</span> <span style="color:#000">Person</span>
		<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ShouldBindUri</span><span style="color:#000;font-weight:700">(</span><span style="color:#ce5c00;font-weight:700">&amp;</span><span style="color:#000">person</span><span style="color:#000;font-weight:700">);</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">!=</span> <span style="color:#204a87;font-weight:700">nil</span> <span style="color:#000;font-weight:700">{</span>
			<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">400</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">H</span><span style="color:#000;font-weight:700">{</span><span style="color:#4e9a06">&quot;msg&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">err</span><span style="color:#000;font-weight:700">})</span>
			<span style="color:#204a87;font-weight:700">return</span>
		<span style="color:#000;font-weight:700">}</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">200</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">H</span><span style="color:#000;font-weight:700">{</span><span style="color:#4e9a06">&quot;name&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">person</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Name</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;uuid&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">person</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ID</span><span style="color:#000;font-weight:700">})</span>
	<span style="color:#000;font-weight:700">})</span>
	<span style="color:#000">route</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8088&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
</code></pre>
</div>

<p>测试：</p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-sh" data-lang="sh">$ curl -v localhost:8088/thinkerou/987fbc97-4bed-5078-9f07-9141ba07c9f3
$ curl -v localhost:8088/thinkerou/not-uuid
</code></pre>

<p><img height="732" src="/uploads/ckeditor/pictures/622/image-20221025092927-1.png" width="1654" /></p>

<p><img height="328" src="/uploads/ckeditor/pictures/623/image-20221025092940-2.png" width="1428" /></p>

