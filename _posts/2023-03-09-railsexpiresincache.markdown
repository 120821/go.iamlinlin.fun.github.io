---
layout: post
title: "rails expires_in (cache) "
date: "2023-03-09"
categories: 
---
<p><a href="https://api.rubyonrails.org/classes/ActionController/ConditionalGet.html#method-i-expires_in">https://api.rubyonrails.org/classes/ActionController/ConditionalGet.html#method-i-expires_in</a></p>

<p>作用：设置 HTTP 1.1 Cache-Control 标头。&nbsp; 默认发出私有指令，因此中间缓存不得缓存响应。</p>

<p>示例：</p>

<pre>
<code>expires_in 20.minutes
expires_in 3.hours, public: true
expires_in 3.hours, public: true, must_revalidate: true
</code></pre>

<p><code>（</code>此方法将覆盖现有的 Cache-Control 标头。&nbsp; 有关更多可能性，请参见 <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html">www.w3.org/Protocols/rfc2616/rfc2616-sec14.html</a>。<code>）</code></p>

<p>过时内容的 HTTP 缓存控制扩展。&nbsp; 请参阅<a href="http://tools.ietf.org/html/rfc5861"> tools.ietf.org/html/rfc5861</a> 它有助于缓存资产并在重新验证和/或返回错误时提供服务。</p>

<pre>
<code>expires_in 3.hours, public: true, stale_while_revalidate: 60.seconds
expires_in 3.hours, public: true, stale_while_revalidate: 60.seconds, stale_if_error: 5.minutes
</code></pre>

<p>HTTP Cache-Control Extensions 其他值：<a href="http://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control">developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control </a>任何其他键值对都连接到响应中的 Cache-Control 标头：</p>

<pre>
<code>expires_in 3.hours, public: true, &quot;s-maxage&quot;: 3.hours, &quot;no-transform&quot;: true</code></pre>

<p>该方法还将确保 HTTP 日期标头以实现客户端兼容性。</p>

<p>&nbsp;</p>

