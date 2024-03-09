---
layout: post
title: "gin - 使用模板构建单个二进制文件 Build a single binary with templates--todo"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/bind-single-binary-with-template/">https://gin-gonic.com/docs/examples/bind-single-binary-with-template/</a></p>

<p>使用第三方包：您可以使用第三方包通过 <a href="https://github.com/jessevdk/go-assets">go-assets </a>将服务器构建到包含模板的单个二进制文件中。</p>

<p><a href="https://github.com/gin-gonic/examples/tree/master/assets-in-binary/example01">https://github.com/gin-gonic/examples/tree/master/assets-in-binary/example01</a></p>

<p>使用：</p>

<p>1.准备包：</p>

<pre>
go get github.com/gin-gonic/gin
go get github.com/jessevdk/go-assets-builder</pre>

<p>2.生成 assets.go</p>

<p>go-assets-builder html -o assets.go</p>

<p>3.构建服务器</p>

<pre>
go build -o assets-in-binary</pre>

<p>4.运行：./assets-in-binary</p>

<p>因为我太多的文件，使用出错：<img height="856" src="/uploads/ckeditor/pictures/624/image-20221025094015-1.png" width="979" /></p>

<p>示例：</p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">r</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">New</span><span style="color:#000;font-weight:700">()</span>

	<span style="color:#000">t</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">loadTemplate</span><span style="color:#000;font-weight:700">()</span>
	<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">!=</span> <span style="color:#204a87;font-weight:700">nil</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#204a87">panic</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">err</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">}</span>
	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">SetHTMLTemplate</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">t</span><span style="color:#000;font-weight:700">)</span>

	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">HTML</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">http</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">StatusOK</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;/html/index.tmpl&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">nil</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#000;font-weight:700">})</span>
	<span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#8f5902;font-style:italic">// loadTemplate loads templates embedded by go-assets-builder
</span><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">loadTemplate</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">(</span><span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">template</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Template</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">error</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
	<span style="color:#000">t</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">template</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">New</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;&quot;</span><span style="color:#000;font-weight:700">)</span>
	<span style="color:#204a87;font-weight:700">for</span> <span style="color:#000">name</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">file</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#204a87;font-weight:700">range</span> <span style="color:#000">Assets</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Files</span> <span style="color:#000;font-weight:700">{</span>
		<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">file</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">IsDir</span><span style="color:#000;font-weight:700">()</span> <span style="color:#ce5c00;font-weight:700">||</span> <span style="color:#000;font-weight:700">!</span><span style="color:#000">strings</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">HasSuffix</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">name</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;.tmpl&quot;</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
			<span style="color:#204a87;font-weight:700">continue</span>
		<span style="color:#000;font-weight:700">}</span>
		<span style="color:#000">h</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">ioutil</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ReadAll</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">file</span><span style="color:#000;font-weight:700">)</span>
		<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">!=</span> <span style="color:#204a87;font-weight:700">nil</span> <span style="color:#000;font-weight:700">{</span>
			<span style="color:#204a87;font-weight:700">return</span> <span style="color:#204a87;font-weight:700">nil</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">err</span>
		<span style="color:#000;font-weight:700">}</span>
		<span style="color:#000">t</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">err</span> <span style="color:#000;font-weight:700">=</span> <span style="color:#000">t</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">New</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">name</span><span style="color:#000;font-weight:700">).</span><span style="color:#000">Parse</span><span style="color:#000;font-weight:700">(</span><span style="color:#204a87">string</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">h</span><span style="color:#000;font-weight:700">))</span>
		<span style="color:#204a87;font-weight:700">if</span> <span style="color:#000">err</span> <span style="color:#ce5c00;font-weight:700">!=</span> <span style="color:#204a87;font-weight:700">nil</span> <span style="color:#000;font-weight:700">{</span>
			<span style="color:#204a87;font-weight:700">return</span> <span style="color:#204a87;font-weight:700">nil</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">err</span>
		<span style="color:#000;font-weight:700">}</span>
	<span style="color:#000;font-weight:700">}</span>
	<span style="color:#204a87;font-weight:700">return</span> <span style="color:#000">t</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">nil</span>
<span style="color:#000;font-weight:700">}</span>
</code></pre>

<p><img height="400" src="/uploads/ckeditor/pictures/626/image-20221025095635-2.png" width="1516" /></p>

