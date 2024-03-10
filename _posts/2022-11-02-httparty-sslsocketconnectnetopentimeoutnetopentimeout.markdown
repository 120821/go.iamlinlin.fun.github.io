---
layout: post
title: "httparty - `ssl_socket_connect': Net::OpenTimeout (Net::OpenTimeout)"
date: "2022-11-02"
categories: 
---
<p><a href="https://www.exceptionalcreatures.com/bestiary/Net/OpenTimeout">https://www.exceptionalcreatures.com/bestiary/Net/OpenTimeout</a></p>
<p>是因为时间超时了，时间是可以自己设置的：</p>
<div class="highlight">
<pre class="highlight ruby">
{% highlight html %}<span class="c1"># net_timeout_1.rb</span>
<span class="nb">require</span> <span class="s1">&#39;net/http&#39;</span>
<span class="c1"># create a new http connection object, the connection isn&#39;t made yet</span>
<span class="n">c</span> <span class="o">=</span> <span class="no">Net</span><span class="o">::</span><span class="no">HTTP</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="s2">&quot;www.example.com&quot;</span><span class="p">)</span>
<span class="c1"># set the open timeout to 1ms</span>
<span class="c1"># i.e. if we can&#39;t open a connection within 1ms this will cause a</span>
<span class="c1"># Net::OpenTimeout error when the request is made</span>
<span class="n">c</span><span class="p">.</span><span class="nf">open_timeout</span> <span class="o">=</span> <span class="mf">0.001</span>
<span class="c1"># make a get request after opening a connection</span>
<span class="n">response</span> <span class="o">=</span> <span class="n">c</span><span class="p">.</span><span class="nf">request_get</span><span class="p">(</span><span class="s2">&quot;/index.html&quot;</span><span class="p">)</span>
<span class="c1"># print the response status code</span>
<span class="nb">puts</span> <span class="s2">&quot;RESPONSE STATUS CODE: </span><span class="si">#{</span><span class="n">response</span><span class="p">.</span><span class="nf">code</span><span class="si">}</span><span class="s2">&quot;</span>
{% endhighlight %}
<p>运行：</p>
<div class="highlight">
<pre class="highlight shell">
{% highlight html %}<span class="nv">$ </span>ruby net_timeout_1.rb
<span class="c"># =&gt; ../net/http.rb:904:in `initialize&#39;: execution expired (Net::OpenTimeout)</span>
{% endhighlight %}
<p>httparty允许设置时间：</p>
<div class="highlight">
<pre class="highlight ruby">
{% highlight html %}<span class="c1"># use an open_timeout of 100ms</span>
<span class="no">HTTParty</span><span class="p">.</span><span class="nf">get</span><span class="p">(</span><span class="s1">&#39;http://www.example.com&#39;</span><span class="p">,</span> <span class="p">{</span> <span class="ss">open_timeout: </span><span class="mf">0.1</span> <span class="p">})</span>
<span class="c1"># use it in a custom client</span>
<span class="k">class</span> <span class="nc">SaneHTTPClient</span>
<span class="kp">include</span> <span class="no">HTTParty</span>
<span class="n">open_timeout</span> <span class="mi">1</span>
<span class="k">end</span>
<span class="no">SaneHTTPClient</span><span class="p">.</span><span class="nf">get</span><span class="p">(</span><span class="s2">&quot;www.example.com&quot;</span><span class="p">)</span>
{% endhighlight %}
</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
