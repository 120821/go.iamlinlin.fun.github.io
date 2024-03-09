---
layout: post
title: "gin - Controlling Log output coloring"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/controlling-log-output-coloring/">https://gin-gonic.com/docs/examples/controlling-log-output-coloring/</a></p>

<p>不着色日志：</p>

<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#8f5902;font-style:italic">// Disable log&#39;s color
</span>    <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">DisableConsoleColor</span><span style="color:#000;font-weight:700">()</span>
    
    <span style="color:#8f5902;font-style:italic">// Creates a gin router with default middleware:
</span>    <span style="color:#8f5902;font-style:italic">// logger and recovery (crash-free) middleware
</span>    <span style="color:#000">router</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>
    
    <span style="color:#000">router</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/ping&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
        <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">String</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">200</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;pong&quot;</span><span style="color:#000;font-weight:700">)</span>
    <span style="color:#000;font-weight:700">})</span>
    
    <span style="color:#000">router</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}

<p>着色日志：</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#8f5902;font-style:italic">// Force log&#39;s color
</span>    <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">ForceConsoleColor</span><span style="color:#000;font-weight:700">()</span>
    
    <span style="color:#8f5902;font-style:italic">// Creates a gin router with default middleware:
</span>    <span style="color:#8f5902;font-style:italic">// logger and recovery (crash-free) middleware
</span>    <span style="color:#000">router</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>
    
    <span style="color:#000">router</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/ping&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#204a87;font-weight:700">func</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
        <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">String</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">200</span><span style="color:#000;font-weight:700">,</span> <span style="color:#4e9a06">&quot;pong&quot;</span><span style="color:#000;font-weight:700">)</span>
    <span style="color:#000;font-weight:700">})</span>
    
    <span style="color:#000">router</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;:8080&quot;</span><span style="color:#000;font-weight:700">)</span>
<span style="color:#000;font-weight:700">}</span>
{% endhighlight %}
</div>

<p><img height="126" src="/uploads/ckeditor/pictures/625/image-20221025095536-1.png" width="756" /></p>

<p>着色日志：</p>

<p><img height="373" src="/uploads/ckeditor/pictures/627/image-20221025095802-2.png" width="1216" /></p>

<p>不着色日志：</p>

<p><img height="305" src="/uploads/ckeditor/pictures/628/image-20221025095909-3.png" width="1216" /></p>

