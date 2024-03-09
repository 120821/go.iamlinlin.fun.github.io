---
layout: post
title: "ruby - `:key => "value"` 和 `key: "value"` 哈希表示法之间的区别"
date: "2022-11-02"
categories: 
---
<p><a href="https://stackoverflow.com/questions/8675206/is-there-any-difference-between-the-key-value-and-key-value-hash-no">https://stackoverflow.com/questions/8675206/is-there-any-difference-between-the-key-value-and-key-value-hash-no</a></p>

<p><a href="https://ruby-china.org/topics/21096">https://ruby-china.org/topics/21096</a></p>

<p><a href="https://www.runoob.com/ruby/ruby-hash.html">https://www.runoob.com/ruby/ruby-hash.html</a></p>

<p><code>key: value</code> 格式的 key 只能是 symbol。不能是数字。</p>

<p>哈希（Hash）是类似 &quot;key&quot; =&gt; &quot;value&quot; 这样的键值对集合。哈希类似于一个数组，只不过它的索引不局限于使用数字。</p>

<p>Hash 的索引（或者叫&quot;键&quot;）几乎可以是任何对象。</p>

<p>示例：这样是正确的：</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">h = { <span class="hljs-symbol">:</span><span class="hljs-variable">$in</span> =&gt; array }
h = { <span class="hljs-symbol">:<span class="hljs-string">&#39;a.b&#39;</span></span> =&gt; <span class="hljs-string">&#39;c&#39;</span> }
h[<span class="hljs-symbol">:s</span>] = <span class="hljs-number">42</span>
</code></pre>

<p>您还可以将任何内容用作 =&gt; 的键，因此您可以这样做：</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">h = { C.new =&gt; <span class="hljs-number">11</span> }
h = { <span class="hljs-number">23</span> =&gt; <span class="hljs-string">&#39;pancakes house?&#39;</span> }
</code></pre>

<p>但是不可以：</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">h = { C.<span class="hljs-symbol">new:</span> <span class="hljs-number">11</span> }
h = { <span class="hljs-number">23</span>: <span class="hljs-string">&#39;pancakes house?&#39;</span> }
</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

