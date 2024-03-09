---
layout: post
title: "gin - 绑定 html 复选框 Bind html checkboxes"
date: "2022-10-25"
categories: 
---
<p><a href="https://github.com/gin-gonic/gin/issues/129#issuecomment-124260092">https://github.com/gin-gonic/gin/issues/129#issuecomment-124260092</a></p>

<p><a href="https://gin-gonic.com/docs/examples/bind-html-checkbox/">https://gin-gonic.com/docs/examples/bind-html-checkbox/</a></p>

<p>.go 文件（例如 main.go）</p>

<pre>
<code>package main

import (

&nbsp;&nbsp;&nbsp; &quot;github.com/gin-gonic/gin&quot;

)

type myForm struct {

&nbsp;&nbsp;&nbsp; Colors []string `form:&quot;colors[]&quot;`

}

func main() {

&nbsp;&nbsp;&nbsp; r := gin.Default()

&nbsp;&nbsp;&nbsp; r.LoadHTMLGlob(&quot;views/*&quot;)

&nbsp;&nbsp;&nbsp; r.GET(&quot;/&quot;, indexHandler)

&nbsp;&nbsp;&nbsp; r.POST(&quot;/&quot;, formHandler)

&nbsp;&nbsp;&nbsp; r.Run(&quot;:8080&quot;)

}

func indexHandler(c *gin.Context) {

&nbsp;&nbsp;&nbsp; c.HTML(200, &quot;form.html&quot;, nil)

}

func formHandler(c *gin.Context) {

&nbsp;&nbsp;&nbsp; var fakeForm myForm

&nbsp;&nbsp;&nbsp; c.Bind(&amp;fakeForm)

&nbsp;&nbsp;&nbsp; c.JSON(200, gin.H{&quot;color&quot;: fakeForm.Colors})

}</code></pre>

<p>增加视图文件：views/form.html</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-html" data-lang="html"><span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">form</span> <span style="color:#c4a000">action</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;/&quot;</span> <span style="color:#c4a000">method</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;POST&quot;</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">p</span><span style="color:#000;font-weight:700">&gt;</span>Check some colors<span style="color:#000;font-weight:700">&lt;/</span><span style="color:#204a87;font-weight:700">p</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">label</span> <span style="color:#c4a000">for</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;red&quot;</span><span style="color:#000;font-weight:700">&gt;</span>Red<span style="color:#000;font-weight:700">&lt;/</span><span style="color:#204a87;font-weight:700">label</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">input</span> <span style="color:#c4a000">type</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;checkbox&quot;</span> <span style="color:#c4a000">name</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;colors[]&quot;</span> <span style="color:#c4a000">value</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;red&quot;</span> <span style="color:#c4a000">id</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;red&quot;</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">label</span> <span style="color:#c4a000">for</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;green&quot;</span><span style="color:#000;font-weight:700">&gt;</span>Green<span style="color:#000;font-weight:700">&lt;/</span><span style="color:#204a87;font-weight:700">label</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">input</span> <span style="color:#c4a000">type</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;checkbox&quot;</span> <span style="color:#c4a000">name</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;colors[]&quot;</span> <span style="color:#c4a000">value</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;green&quot;</span> <span style="color:#c4a000">id</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;green&quot;</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">label</span> <span style="color:#c4a000">for</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;blue&quot;</span><span style="color:#000;font-weight:700">&gt;</span>Blue<span style="color:#000;font-weight:700">&lt;/</span><span style="color:#204a87;font-weight:700">label</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">input</span> <span style="color:#c4a000">type</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;checkbox&quot;</span> <span style="color:#c4a000">name</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;colors[]&quot;</span> <span style="color:#c4a000">value</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;blue&quot;</span> <span style="color:#c4a000">id</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;blue&quot;</span><span style="color:#000;font-weight:700">&gt;</span>
    <span style="color:#000;font-weight:700">&lt;</span><span style="color:#204a87;font-weight:700">input</span> <span style="color:#c4a000">type</span><span style="color:#ce5c00;font-weight:700">=</span><span style="color:#4e9a06">&quot;submit&quot;</span><span style="color:#000;font-weight:700">&gt;</span>
<span style="color:#000;font-weight:700">&lt;/</span><span style="color:#204a87;font-weight:700">form</span><span style="color:#000;font-weight:700">&gt;</span>
</code></pre>
</div>

<p>运行：</p>

<p><img height="175" src="/uploads/ckeditor/pictures/617/image-20221025091820-1.png" width="614" /></p>

<p>选择红色提交：</p>

<p><img height="175" src="/uploads/ckeditor/pictures/618/image-20221025091842-2.png" width="614" /></p>

<p><img height="432" src="/uploads/ckeditor/pictures/619/image-20221025091855-3.png" width="1204" /></p>

