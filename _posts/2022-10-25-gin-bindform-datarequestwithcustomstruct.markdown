---
layout: post
title: "gin-将表单数据请求与自定义结构绑定 Bind form-data request with custom struct"
date: "2022-10-25"
categories: 
---
<p><a href="https://gin-gonic.com/docs/examples/bind-form-data-request-with-custom-struct/">官网教程</a></p>

<p>示例：</p>

<div class="highlight">
<pre style="background-color:#f8f8f8;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-go" data-lang="go"><span style="color:#204a87;font-weight:700">type</span> <span style="color:#000">StructA</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#000">FieldA</span> <span style="color:#204a87;font-weight:700">string</span> <span style="color:#4e9a06">`form:&quot;field_a&quot;`</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">type</span> <span style="color:#000">StructB</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#000">NestedStruct</span> <span style="color:#000">StructA</span>
    <span style="color:#000">FieldB</span> <span style="color:#204a87;font-weight:700">string</span> <span style="color:#4e9a06">`form:&quot;field_b&quot;`</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">type</span> <span style="color:#000">StructC</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#000">NestedStructPointer</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">StructA</span>
    <span style="color:#000">FieldC</span> <span style="color:#204a87;font-weight:700">string</span> <span style="color:#4e9a06">`form:&quot;field_c&quot;`</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">type</span> <span style="color:#000">StructD</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#000">NestedAnonyStruct</span> <span style="color:#204a87;font-weight:700">struct</span> <span style="color:#000;font-weight:700">{</span>
        <span style="color:#000">FieldX</span> <span style="color:#204a87;font-weight:700">string</span> <span style="color:#4e9a06">`form:&quot;field_x&quot;`</span>
    <span style="color:#000;font-weight:700">}</span>
    <span style="color:#000">FieldD</span> <span style="color:#204a87;font-weight:700">string</span> <span style="color:#4e9a06">`form:&quot;field_d&quot;`</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">GetDataB</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#204a87;font-weight:700">var</span> <span style="color:#000">b</span> <span style="color:#000">StructB</span>
    <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Bind</span><span style="color:#000;font-weight:700">(</span><span style="color:#ce5c00;font-weight:700">&amp;</span><span style="color:#000">b</span><span style="color:#000;font-weight:700">)</span>
    <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">200</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">H</span><span style="color:#000;font-weight:700">{</span>
        <span style="color:#4e9a06">&quot;a&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">b</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">NestedStruct</span><span style="color:#000;font-weight:700">,</span>
        <span style="color:#4e9a06">&quot;b&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">b</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">FieldB</span><span style="color:#000;font-weight:700">,</span>
    <span style="color:#000;font-weight:700">})</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">GetDataC</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#204a87;font-weight:700">var</span> <span style="color:#000">b</span> <span style="color:#000">StructC</span>
    <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Bind</span><span style="color:#000;font-weight:700">(</span><span style="color:#ce5c00;font-weight:700">&amp;</span><span style="color:#000">b</span><span style="color:#000;font-weight:700">)</span>
    <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">200</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">H</span><span style="color:#000;font-weight:700">{</span>
        <span style="color:#4e9a06">&quot;a&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">b</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">NestedStructPointer</span><span style="color:#000;font-weight:700">,</span>
        <span style="color:#4e9a06">&quot;c&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">b</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">FieldC</span><span style="color:#000;font-weight:700">,</span>
    <span style="color:#000;font-weight:700">})</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">GetDataD</span><span style="color:#000;font-weight:700">(</span><span style="color:#000">c</span> <span style="color:#ce5c00;font-weight:700">*</span><span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Context</span><span style="color:#000;font-weight:700">)</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#204a87;font-weight:700">var</span> <span style="color:#000">b</span> <span style="color:#000">StructD</span>
    <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Bind</span><span style="color:#000;font-weight:700">(</span><span style="color:#ce5c00;font-weight:700">&amp;</span><span style="color:#000">b</span><span style="color:#000;font-weight:700">)</span>
    <span style="color:#000">c</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">JSON</span><span style="color:#000;font-weight:700">(</span><span style="color:#0000cf;font-weight:700">200</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">H</span><span style="color:#000;font-weight:700">{</span>
        <span style="color:#4e9a06">&quot;x&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">b</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">NestedAnonyStruct</span><span style="color:#000;font-weight:700">,</span>
        <span style="color:#4e9a06">&quot;d&quot;</span><span style="color:#000;font-weight:700">:</span> <span style="color:#000">b</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">FieldD</span><span style="color:#000;font-weight:700">,</span>
    <span style="color:#000;font-weight:700">})</span>
<span style="color:#000;font-weight:700">}</span>

<span style="color:#204a87;font-weight:700">func</span> <span style="color:#000">main</span><span style="color:#000;font-weight:700">()</span> <span style="color:#000;font-weight:700">{</span>
    <span style="color:#000">r</span> <span style="color:#ce5c00;font-weight:700">:=</span> <span style="color:#000">gin</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Default</span><span style="color:#000;font-weight:700">()</span>
    <span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/getb&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">GetDataB</span><span style="color:#000;font-weight:700">)</span>
    <span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/getc&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">GetDataC</span><span style="color:#000;font-weight:700">)</span>
    <span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">GET</span><span style="color:#000;font-weight:700">(</span><span style="color:#4e9a06">&quot;/getd&quot;</span><span style="color:#000;font-weight:700">,</span> <span style="color:#000">GetDataD</span><span style="color:#000;font-weight:700">)</span>

    <span style="color:#000">r</span><span style="color:#000;font-weight:700">.</span><span style="color:#000">Run</span><span style="color:#000;font-weight:700">()</span>
<span style="color:#000;font-weight:700">}</span>
</code></pre>

<p>修改端口然后运行就会：</p>

<p><img height="347" src="/uploads/ckeditor/pictures/613/image-20221025090934-1.png" width="1232" /></p>

<p>在浏览器进行查看：</p>

<p><img height="175" src="/uploads/ckeditor/pictures/614/image-20221025091019-2.png" width="614" /></p>

<p><img height="175" src="/uploads/ckeditor/pictures/615/image-20221025091030-3.png" width="614" /><img height="175" src="/uploads/ckeditor/pictures/616/image-20221025091045-4.png" width="614" /></p>
</div>

