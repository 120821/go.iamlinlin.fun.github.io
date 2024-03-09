---
layout: post
title: "ipfs - content-type的使用"
date: "2022-10-31"
categories: 
---
<p>远程的ipfs不能把所有的header返回，只获取其中的content-type就可以了</p>

<p>ipfs使用：</p>

<p>url = &quot;https://cloudflare-ipfs.com/&quot; + &quot;ipfs/&quot; + cid + request.fullpath</p>

<p>可以进行查看ipfs的内容</p>

<p>使用sinatra就可以进行这样的header替换</p>

{% highlight %}&nbsp; {% highlight %}get &#39;/ipfs/*&#39; do<br />
&nbsp;&nbsp;&nbsp; logger.info &quot;== request.referer: #{request.referrer}, inspect: #{request.referrer == nil}&quot;

&nbsp;&nbsp;&nbsp; url = &#39;&#39;<br />
&nbsp;&nbsp;&nbsp; if request.referrer != nil<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url = request.referrer + request.fullpath.gsub(&#39;/ipfs&#39;, &#39;&#39;)<br />
&nbsp;&nbsp;&nbsp; else<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url = &quot;https://cloudflare-ipfs.com/&quot; + request.fullpath<br />
&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp; logger.info &quot;=== url is: #{url}&quot;<br />
&nbsp;&nbsp;&nbsp; response = HTTParty.get url

&nbsp;&nbsp;&nbsp; status 200{% endhighlight %}

{% highlight %}&nbsp;&nbsp;&nbsp; # 这里特别重要<br />
&nbsp;&nbsp;&nbsp; my_headers = {&#39;content-type&#39; =&gt; response.headers[&#39;content-type&#39;]}<br />
&nbsp;&nbsp;&nbsp; headers my_headers

&nbsp;&nbsp;&nbsp; body response.body<br />
&nbsp; end{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

