---
layout: post
title: "Match an option in select form with boolean values"
date: "2022-06-30"
categories: 
---
<p>参考：https://stackoverflow.com/questions/11430969/match-an-option-in-select-form-with-boolean-values</p>

<pre class="default s-code-block">
<code class="hljs language-lua">f.<span class="hljs-built_in">select</span> :active, <span class="hljs-string">[[&#39;Active&#39;, true], [&#39;Inactive&#39;, false]]</span></code></pre>

<p><code class="hljs language-lua"><span class="hljs-string">将会得到：</span></code></p>

<pre class="default s-code-block">
<code class="hljs language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">select</span> <span class="hljs-attr">name</span>=<span class="hljs-string">&quot;model[active]&quot;</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">option</span> <span class="hljs-attr">value</span>=<span class="hljs-string">&quot;true&quot;</span>&gt;</span>Active<span class="hljs-tag">&lt;/<span class="hljs-name">option</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">option</span> <span class="hljs-attr">value</span>=<span class="hljs-string">&quot;false&quot;</span>&gt;</span>Inactive<span class="hljs-tag">&lt;/<span class="hljs-name">option</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">select</span>&gt;</span>
</code></pre>

