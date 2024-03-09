---
layout: post
title: "httparty - post header "
date: "2022-11-02"
categories: 
---
<p><a href="https://stackoverflow.com/questions/24691483/passing-headers-and-query-params-in-httparty">https://stackoverflow.com/questions/24691483/passing-headers-and-query-params-in-httparty</a></p>

<p>示例：</p>

<pre class="lang-rb s-code-block">
<code class="hljs language-ruby">query = { 
  <span class="hljs-string">&quot;method&quot;</span>     =&gt; <span class="hljs-string">&quot;neworder&quot;</span>,
  <span class="hljs-string">&quot;nonce&quot;</span>      =&gt; <span class="hljs-number">1404996028</span>,
  <span class="hljs-string">&quot;order_type&quot;</span> =&gt; <span class="hljs-string">&quot;buy&quot;</span>,
  <span class="hljs-string">&quot;quantity&quot;</span>   =&gt; <span class="hljs-number">1</span>,
  <span class="hljs-string">&quot;rate&quot;</span>       =&gt; <span class="hljs-number">1</span>
}
headers = { 
  <span class="hljs-string">&quot;key&quot;</span>  =&gt; <span class="hljs-string">&quot;8781974720909019987&quot;</span>,
  <span class="hljs-string">&quot;sign&quot;</span> =&gt; <span class="hljs-string">&quot;0a3888ac7f8e411ad73a0a503c55db70a291bfb9f9a47147d5200882674f717f6ede475669f3453&quot;</span> 
}

HTTParty.post(
  <span class="hljs-string">&quot;https://www.acb.com/api/v2/market/LTC_BTC/&quot;</span>, 
  <span class="hljs-symbol">:query</span> =&gt; query,
  <span class="hljs-symbol">:headers</span> =&gt; headers
)</code></pre>

<p>&nbsp;</p>

