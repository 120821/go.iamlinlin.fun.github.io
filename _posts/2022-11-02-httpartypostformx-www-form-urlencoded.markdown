---
layout: post
title: "httparty post form x-www-form-urlencoded"
date: "2022-11-02"
categories: 
---
<p><a href="https://stackoverflow.com/questions/45463812/ruby-httparty-post-request">https://stackoverflow.com/questions/45463812/ruby-httparty-post-request</a></p>

<p>示例：</p>

<pre class="default s-code-block">
<code class="hljs language-php">HTTParty.<span class="hljs-title function_ invoke__">post</span>(<span class="hljs-string">&quot;https://myurl/api/add_lead&quot;</span>, {
  <span class="hljs-attr">body</span>: <span class="hljs-string">&quot;first_name=test&amp;phone=123456789&amp;email=email@email.com&amp;ipaddress=192.168.0.0&quot;</span>,
  <span class="hljs-attr">headers</span>: {
    <span class="hljs-string">&#39;Content-Type&#39;</span> =&gt; <span class="hljs-string">&#39;application/x-www-form-urlencoded&#39;</span>,
    <span class="hljs-string">&#39;charset&#39;</span> =&gt; <span class="hljs-string">&#39;utf-8&#39;</span>
  }
})</code></pre>

