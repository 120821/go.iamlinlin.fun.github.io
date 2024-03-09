---
layout: post
title: "First argument in form cannot contain nil or be empty - Rails 4"
date: "2022-11-22"
categories: 
---
<p><a href="https://stackoverflow.com/questions/18853721/first-argument-in-form-cannot-contain-nil-or-be-empty-rails-4">参考</a></p>

<p>引起错误是因为</p>

<pre>
<code>&lt;%= form_for nil do |f| %&gt;
&lt;%= form_for [] do |f| %&gt;</code></pre>

<p>解决：</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">&lt;%= form_for <span class="hljs-title class_">Contact</span>.new <span class="hljs-keyword">do</span> |<span class="hljs-params">f</span>| %&gt;</code></pre>

<p>或者：</p>

<p>controller增加：</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby"><span class="hljs-keyword">def</span> <span class="hljs-title function_">new</span>
    <span class="hljs-variable">@contact</span> = Contact.new
<span class="hljs-keyword">end</span></code></pre>

