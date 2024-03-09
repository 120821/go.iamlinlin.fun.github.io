---
layout: post
title: "Uncaught ReferenceError: $ is not defined rails"
date: "2022-06-18"
categories: 
---
<p>参考：https://stackoverflow.com/questions/29327004/uncaught-referenceerror-is-not-defined-rails</p>

<p>首先，查看Gemfile 是否存在</p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript">gem <span class="hljs-string">&#39;jquery-rails&#39;</span></code></pre>

<p><code class="hljs language-javascript"><span class="hljs-string">接着，看一下</span></code>assets/javascripts/application.js</p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript"><span class="hljs-comment">//= require jquery</span>
<span class="hljs-comment">//= require jquery_ujs</span>
</code></pre>

<p><code class="hljs language-javascript"><span class="hljs-comment">如果这都是存在的，还是出现报错，那么查看</span></code>application.html.erb</p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript">&lt;%= javascript_include_tag <span class="hljs-string">&quot;application&quot;</span> <span class="hljs-string">&#39;data-turbolinks-track&#39;</span> =&gt; <span class="hljs-literal">true</span> %&gt;
</code></pre>

<p>找到后进行替换：</p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript">&lt;%= javascript_include_tag <span class="hljs-string">&quot;application&quot;</span> %&gt;</code></pre>

<p><code class="hljs language-javascript">这样就不出错了</code></p>

