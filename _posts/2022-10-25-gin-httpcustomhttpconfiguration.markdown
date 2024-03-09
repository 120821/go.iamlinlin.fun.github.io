---
layout: post
title: "gin - 自定义 HTTP 配置 Custom HTTP configuration"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/custom-http-config/">https://gin-gonic.com/docs/examples/custom-http-config/</a></p>

<p>直接使用：<code>http.ListenAndServe()，示例：</code></p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">router</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>
	<span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ListenAndServe</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">router</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p>或者这样：</p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">router</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>

	<span style="color:#000">s</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#ce5c00;font-weight:700">&amp;</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Server</span><span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">Addr</span><span style="color:#000;font-weight:700">:</span>           <span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">,</span>
		<span style="color:#000">Handler</span><span style="color:#000;font-weight:700">:</span>        <span style="color:#000">router</span><span style="color:#000;font-weight:700">,</span>
		<span style="color:#000">ReadTimeout</span><span style="color:#000;font-weight:700">:</span>    <span style="color:#0000cf;font-weight:700">10</span> <span style="color:#ce5c00;font-weight:700">*</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Second</span><span style="color:#000;font-weight:700">,</span>
		<span style="color:#000">WriteTimeout</span><span style="color:#000;font-weight:700">:</span>   <span style="color:#0000cf;font-weight:700">10</span> <span style="color:#ce5c00;font-weight:700">*</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Second</span><span style="color:#000;font-weight:700">,</span>
		<span style="color:#000">MaxHeaderBytes</span><span style="color:#000;font-weight:700">:</span> <span style="color:#0000cf;font-weight:700">1</span> <span style="color:#ce5c00;font-weight:700">&lt;&lt;</span> <span style="color:#0000cf;font-weight:700">20</span><span style="color:#000;font-weight:700">,</span>
	<span style="color:#000;font-weight:700">}</span>
	<span style="color:#000">s</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ListenAndServe</span><span style="color:#000;font-weight:700">()</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p><img height="190" src="/uploads/ckeditor/pictures/629/image-20221025100336-1.png" width="1216" /></p>

