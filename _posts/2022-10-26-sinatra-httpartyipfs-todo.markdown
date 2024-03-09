---
layout: post
title: "sinatra - httparty 获取ipfs数据 - TODO"
date: "2022-10-26"
categories: 
---
<p><a href="https://sinatrarb.com/intro.html">https://sinatrarb.com/intro.html</a></p>

<div class="language-ruby highlighter-rouge">
<div class="highlight">
<pre class="highlight">
<code><span class="n">get</span> <span class="s1">&#39;/foo&#39;</span> <span class="k">do</span>
  <span class="n">status</span> <span class="mi">418</span>
  <span class="n">headers</span> <span class="p">\</span>
    <span class="s2">&quot;Allow&quot;</span>   <span class="o">=&gt;</span> <span class="s2">&quot;BREW, POST, GET, PROPFIND, WHEN&quot;</span><span class="p">,</span>
    <span class="s2">&quot;Refresh&quot;</span> <span class="o">=&gt;</span> <span class="s2">&quot;Refresh: 20; https://ietf.org/rfc/rfc2324.txt&quot;</span>
  <span class="n">body</span> <span class="s2">&quot;I&#39;m a teapot!&quot;</span>
<span class="k">end</span>
</code></pre>
</div>
</div>

<p>尚未完善：</p>

<pre>
<code>get &#39;/ipfs/:cid&#39; do
&nbsp; logger.info &quot;=== request.path_info is #{request.path_info} request.fullpath is #{request.fullpath} request.url is #{request.url}&quot;

&nbsp; a = &quot;https://cloudflare-ipfs.com/&quot; + request.fullpath

&nbsp; logger.info &quot;=== a is #{a}&quot;

&nbsp; response = HTTParty.get a

&nbsp; logger.info &quot;=== httparty cloudflare response is #{response}&quot;

&nbsp; logger.info &quot;=== response.headers is #{response.headers}&quot;

&nbsp; logger.info &quot;=== response.body is #{response.body}&quot;
&nbsp; status 200

&nbsp; headers \

&nbsp;&nbsp;&nbsp; response.headers

&nbsp; body response.body

end</code></pre>

<p>解决方法：</p>

<p>不能完全使用headers， 需要进行部分引用。</p>

<p>具体为：</p>

<p>TODO（电脑还没好。）</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

