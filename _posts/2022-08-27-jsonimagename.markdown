---
layout: post
title: "批量生成json image name"
date: "2022-08-27"
categories: 
---
<p>生成json</p>

<pre><code>require &#39;json&#39;<br />
(1..445).each do |i|<br />
&nbsp; content = {<br />
&nbsp;&nbsp;&nbsp; &quot;image&quot; =&gt; &quot;nft-data.raindrop.link/imgs/srvf-life/#{i}.jpg&quot;,<br />
&nbsp;&nbsp;&nbsp; &quot;name&quot; =&gt; &quot;Some NFT ##{i}&quot;<br />
&nbsp; }<br />
&nbsp; File.open(&quot;json/#{i}&quot;,&quot;w&quot;) do |f|<br />
&nbsp;&nbsp;&nbsp; f.write(content.to_json)<br />
&nbsp; end<br />
end<br />
&nbsp;&nbsp;&nbsp;</code></pre>

<div class="notranslate" style="all: initial;">&nbsp;</div>

