---
layout: post
title: "sinatrarb的使用 hello world"
date: "2022-09-15"
categories: 
---
<p>官网：<a href="https://sinatrarb.com/">https://sinatrarb.com/</a></p>

<p>Sinatra 是一种 DSL，用于在 Ruby 中轻松创建 Web 应用程序：</p>

<pre id="sinatra-joke">
<code id="sinatra-syntax"> <span id="require">require </span><span class="code-quotes">&#39;</span><span class="code-text">sinatra</span><span class="code-quotes">&#39;</span>
    <span id="code-method-name">get </span><span class="code-quotes">&#39;</span><span class="code-text">/frank-says</span><span class="code-quotes">&#39; </span><span class="code-block">do</span>
      <span class="code-quotes">&#39;</span><span class="code-text">Put this in your pipe &amp; smoke it!</span><span class="code-quotes">&#39;</span>
    <span class="code-block">end</span>{% endhighlight %}

<p><code>创建新的文件夹，创建新的文件</code></p>

<pre class="highlight">
<code><span class="c1"># myapp.rb</span>
<span class="nb">require</span> <span class="s1">&#39;sinatra&#39;</span>

<span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span>
  <span class="s1">&#39;Hello world!&#39;</span>
<span class="k">end</span>
{% endhighlight %}

<p>然后安装gem，并运行</p>

<p>gem install sinatra</p>

<p>ruby myapp.rb</p>

<p><img height="475" src="/uploads/ckeditor/pictures/401/image-20220915113426-1.png" width="1135" /></p>

<p>APP运行在4567页面：<img height="95" src="/uploads/ckeditor/pictures/402/image-20220915113518-2.png" width="466" /></p>

<p>更改的代码在您重新启动服务器之前不会生效。 每次更改或使用 sinatra/reloader 时请重新启动服务器。 建议同时运行 gem install thin，如果可用，Sinatra 会选择它。</p>

