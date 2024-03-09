---
layout: post
title: "sinatra get params name"
date: "2022-09-19"
categories: 
---
<p><a href="https://webapps-for-beginners.rubymonstas.org/sinatra/params.html">https://webapps-for-beginners.rubymonstas.org/sinatra/params.html</a></p>

<p>在文件末尾添加以下路由（请求处理程序）到您的程序：</p>

<pre class="highlight ruby">
{% highlight %}<span class="n">get</span> <span class="s2">&quot;/monstas/:name&quot;</span> <span class="k">do</span>
  <span class="s2">&quot;Hello </span><span class="si">#{</span><span class="n">params</span><span class="p">[</span><span class="s2">&quot;name&quot;</span><span class="p">]</span><span class="si">}</span><span class="s2">!&quot;</span>
<span class="k">end</span>
{% endhighlight %}

<p>重新启动您的 Sinatra 应用程序，然后将您的浏览器指向<a href="http://localhost:4567/monstas/monstas">http://localhost:4567/monstas/monstas</a>.</p>

