---
layout: post
title: "rails pipline--undefined method `start_with?' for /\.(?:svg|eot|woff|ttf)$/:Regexp"
date: "2022-06-15"
categories: 
---
<p>如果在使用的时候，出现大量的报错 ，可以查看该文件：<code>config/initializer/assets.rb</code></p>

<p><code>把这一行：</code></p>

<pre class="default s-code-block">
<code class="hljs language-javascript"><span class="hljs-title class_">Rails</span>.<span class="hljs-property">application</span>.<span class="hljs-property">config</span>.<span class="hljs-property">assets</span>.<span class="hljs-property">precompile</span> &lt;&lt; <span class="hljs-regexp">/\.(?:svg|eot|woff|ttf)$/</span>
</code></pre>

<p>修改为：</p>

<pre class="default s-code-block">
<code class="hljs language-css">Rails<span class="hljs-selector-class">.application</span><span class="hljs-selector-class">.config</span><span class="hljs-selector-class">.assets</span><span class="hljs-selector-class">.precompile</span> &lt;&lt; <span class="hljs-selector-attr">[<span class="hljs-string">&quot;*.svg&quot;</span>, <span class="hljs-string">&quot;*.eot&quot;</span>, <span class="hljs-string">&quot;*.woff&quot;</span>, <span class="hljs-string">&quot;*.ttf&quot;</span>]</span></code></pre>

<p><code class="hljs language-css"><span class="hljs-selector-attr">然后进行数据的引用，使用这些方法：</span></code></p>

<pre class="default s-code-block">
<code class="hljs language-css"><span class="hljs-keyword">@font-face</span> {
  <span class="hljs-attribute">font-family</span>: <span class="hljs-string">&#39;Icomoon&#39;</span>;
  <span class="hljs-attribute">src</span>:<span class="hljs-built_in">url</span>(<span class="hljs-string">&#39;icomoon.eot&#39;</span>);
  <span class="hljs-attribute">src</span>:<span class="hljs-built_in">url</span>(<span class="hljs-string">&#39;icomoon.eot?#iefix&#39;</span>) <span class="hljs-built_in">format</span>(<span class="hljs-string">&#39;embedded-opentype&#39;</span>),
    <span class="hljs-built_in">url</span>(<span class="hljs-string">&#39;icomoon.svg#icomoon&#39;</span>) <span class="hljs-built_in">format</span>(<span class="hljs-string">&#39;svg&#39;</span>),
    <span class="hljs-built_in">url</span>(<span class="hljs-string">&#39;icomoon.woff&#39;</span>) <span class="hljs-built_in">format</span>(<span class="hljs-string">&#39;woff&#39;</span>),
    <span class="hljs-built_in">url</span>(<span class="hljs-string">&#39;icomoon.ttf&#39;</span>) <span class="hljs-built_in">format</span>(<span class="hljs-string">&#39;truetype&#39;</span>);
  <span class="hljs-attribute">font-weight</span>: normal;
  <span class="hljs-attribute">font-style</span>: normal;
}
</code></pre>

<p>assett_pipline 会自动生成文件：</p>

<pre class="default s-code-block">
<code class="hljs language-css">比如 （文件名加上一大串编译的数据）
</code></pre>

<p>view-source:http://localhost:3000/assets/front_ends.debug-76a96472ce5d1ea55449f99f1c2a9217a64e1103875d2803b156469884144372.css</p>

