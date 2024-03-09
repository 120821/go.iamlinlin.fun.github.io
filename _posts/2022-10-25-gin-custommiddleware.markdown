---
layout: post
title: "gin -自定义中间件 Custom Middleware"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/custom-middleware/">https://gin-gonic.com/docs/examples/custom-middleware/</a></p>

<p>引入：</p>

<pre><code>import (<br />
&nbsp; &quot;log&quot;<br />
&nbsp; &quot;github.com/gin-gonic/gin&quot;<br />
&nbsp; &quot;time&quot;<br />
)</code></pre>

<p>示例：</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">Logger</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">HandlerFunc</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#204a87;font-weight:700">return</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">t</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Now</span><span style="color:#000;font-weight:700">()</span>

		<span style="color:#8f5902;font-style:italic">// Set example variable
</span>		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Set</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;example&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;12345&quot;</span><span style="color:#000;font-weight:700">)</span>

		<span style="color:#8f5902;font-style:italic">// before request
</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Next</span><span style="color:#000;font-weight:700">()</span>

		<span style="color:#8f5902;font-style:italic">// after request
</span>		<span style="color:#000">latency</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">time</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Since</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">t</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Print</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">latency</span><span style="color:#000;font-weight:700">)</span>

		<span style="color:#8f5902;font-style:italic">// access the status we are sending
</span>		<span style="color:#000">status</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Writer</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Status</span><span style="color:#000;font-weight:700">()</span>
		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Println</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">status</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">}</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">r</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">New</span><span style="color:#000;font-weight:700">()</span>
	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Use</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">Logger</span><span style="color:#000;font-weight:700">())</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/test&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">example</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">MustGet</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;example&quot;</span><span style="color:#000;font-weight:700">).(</span><span style="color:#204a87;font-weight:700">string</span><span style="color:#000;font-weight:700">)</span>

		<span style="color:#8f5902;font-style:italic">// it would print: &quot;12345&quot;
</span>		<span style="color:#000">log</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Println</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">example</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">})</span>

	<span style="color:#8f5902;font-style:italic">// Listen and serve on 0.0.0.0:8080
</span>	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
</code></pre>

<p><img height="278" src="/uploads/ckeditor/pictures/633/image-20221025102411-1.png" width="1109" /></p>
</div>

