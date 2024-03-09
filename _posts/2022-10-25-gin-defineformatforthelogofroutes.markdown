---
layout: post
title: "gin - 定义路线日志的格式 Define format for the log of routes"
date: "2022-10-25"
categories: 
---
<p>&nbsp;</p>

<p>路由的默认日志是：</p>

<pre>
<code>[GIN-debug] POST   /foo                      --&gt; main.main.func1 (3 handlers)
[GIN-debug] GET    /bar                      --&gt; main.main.func2 (3 handlers)
[GIN-debug] GET    /status                   --&gt; main.main.func3 (3 handlers)
{% endhighlight %}

<p>如果您想以给定格式（例如 JSON、键值或其他）记录此信息，则可以使用 gin.DebugPrintRouteFunc 定义此格式。&nbsp; 在下面的示例中，我们使用标准日志包记录所有路由，但您可以使用其他适合您需求的日志工具。</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">import</span> <span style="color:#000;font-weight:700">(</span>
	<span style="color:#4e9a06">&quot;log&quot;</span>
	<span style="color:#4e9a06">&quot;net/http&quot;</span>
	<span style="color:#4e9a06">&quot;github.com/gin-gonic/gin&quot;</span>
<span style="color:#000;font-weight:700">)</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">r</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>
	<span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">DebugPrintRouteFunc</span> <span style="color:#000;font-weight:700">=</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">httpMethod</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">absolutePath</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">handlerName</span> <span style="color:#204a87;font-weight:700">string</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">nuHandlers</span> <span style="color:#204a87;font-weight:700">int</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Printf</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;endpoint %v %v %v %v\n&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">httpMethod</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">absolutePath</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">handlerName</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">nuHandlers</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">}</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">POST</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/foo&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">StatusOK</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;foo&quot;</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">})</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/bar&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">StatusOK</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;bar&quot;</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">})</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/status&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">StatusOK</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;ok&quot;</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">})</span>

	<span style="color:#8f5902;font-style:italic">// Listen and Server in http://0.0.0.0:8080
</span>	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">()</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p><code>运行：</code></p>

<p><img height="132" src="/uploads/ckeditor/pictures/636/image-20221025103252-1.png" width="498" /></p>

<p><img height="132" src="/uploads/ckeditor/pictures/637/image-20221025103317-2.png" width="498" /></p>

<p>&nbsp;</p>
</div>

