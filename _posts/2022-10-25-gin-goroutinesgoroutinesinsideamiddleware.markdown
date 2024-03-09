---
layout: post
title: "gin - 中间件中的 Goroutines （Goroutines inside a middleware）"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/goroutines-inside-a-middleware/">https://gin-gonic.com/docs/examples/goroutines-inside-a-middleware/</a></p>

<p>在中间件或处理程序中启动新的 Goroutines 时，您不应该使用其中的原始上下文，您必须使用只读副本。</p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">r</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/long_async&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#8f5902;font-style:italic">// create copy to be used inside the goroutine
</span>		<span style="color:#000">cCp</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Copy</span><span style="color:#000;font-weight:700">()</span>
		<span style="color:#204a87;font-weight:700">go</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
			<span style="color:#8f5902;font-style:italic">// simulate a long task with time.Sleep(). 5 seconds
</span>			<span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Sleep</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">5</span> <span style="color:#ce5c00;font-weight:700">*</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Second</span><span style="color:#000;font-weight:700">)</span>

			<span style="color:#8f5902;font-style:italic">// note that you are using the copied context &quot;cCp&quot;, IMPORTANT
</span>			<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Println</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;Done! in path &quot;</span> <span style="color:#ce5c00;font-weight:700">+</span> <span style="color:#000">cCp</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Request</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">URL</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Path</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000;font-weight:700">}()</span>
	<span style="color:#000;font-weight:700">})</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/long_sync&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#8f5902;font-style:italic">// simulate a long task with time.Sleep(). 5 seconds
</span>		<span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Sleep</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">5</span> <span style="color:#ce5c00;font-weight:700">*</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Second</span><span style="color:#000;font-weight:700">)</span>

		<span style="color:#8f5902;font-style:italic">// since we are NOT using a goroutine, we do not have to copy the context
</span>		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Println</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;Done! in path &quot;</span> <span style="color:#ce5c00;font-weight:700">+</span> <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Request</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">URL</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Path</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">})</span>

	<span style="color:#8f5902;font-style:italic">// Listen and serve on 0.0.0.0:8080
</span>	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p><img height="379" src="/uploads/ckeditor/pictures/638/image-20221025103725-1.png" width="1203" /></p>

