---
layout: post
title: "How to expire a cookie in 30 minutes using jQuery"
date: "2022-09-15"
categories: 
---
<p><a href="https://stackoverflow.com/questions/1830246/how-to-expire-a-cookie-in-30-minutes-using-jquery">https://stackoverflow.com/questions/1830246/how-to-expire-a-cookie-in-30-minutes-using-jquery</a></p>

<p>30 分钟是 30 * 60 * 1000 毫秒。&nbsp; 将其添加到当前日期以指定未来 30 分钟的到期日期。</p>

<pre class="lang-js s-code-block">
<code class="hljs language-javascript"> <span class="hljs-keyword">var</span> date = <span class="hljs-keyword">new</span> <span class="hljs-title class_">Date</span>();
 <span class="hljs-keyword">var</span> minutes = <span class="hljs-number">30</span>;
 date.<span class="hljs-title function_">setTime</span>(date.<span class="hljs-title function_">getTime</span>() + (minutes * <span class="hljs-number">60</span> * <span class="hljs-number">1000</span>));
 $.<span class="hljs-title function_">cookie</span>(<span class="hljs-string">&quot;example&quot;</span>, <span class="hljs-string">&quot;foo&quot;</span>, { <span class="hljs-attr">expires</span>: date });</code></pre>

<p><img height="438" src="/uploads/ckeditor/pictures/400/image-20220915102614-1.png" width="445" /></p>

