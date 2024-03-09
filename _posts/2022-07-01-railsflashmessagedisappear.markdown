---
layout: post
title: "rails flash message disappear"
date: "2022-07-01"
categories: 
---
<p>参考：https://stackoverflow.com/questions/4613952/why-flash-message-wont-disappear</p>

<pre class="default s-code-block">
<code class="hljs language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">type</span>=<span class="hljs-string">&quot;text/javascript&quot;</span>&gt;</span><span class="language-javascript">
  $(<span class="hljs-variable language_">document</span>).<span class="hljs-title function_">ready</span>(<span class="hljs-keyword">function</span>(){
    <span class="hljs-built_in">setTimeout</span>(<span class="hljs-keyword">function</span>(){
    $(<span class="hljs-string">&#39;#flash&#39;</span>).<span class="hljs-title function_">fadeOut</span>();
    }, <span class="hljs-number">2000</span>);
  })
</span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
</code></pre>

<p><span class="hljs-tag">然后在视图页面增加id</code></p>

<pre><code>&nbsp; &lt;% flash.each do |type, msg| %&gt;<br />
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div class=&quot;alert alert-success&quot;&gt;<br />
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;div <strong>id=&quot;flash&quot;</strong> class=&quot;alert alert-success&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= msg %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;% end %&gt;</code></pre>

