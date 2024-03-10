---
layout: post
title: "sinatra session"
date: "2022-09-16"
categories: 
---
<p><a href="https://sinatrarb.com/intro.html">https://sinatrarb.com/intro.html</a></p>
<p>session用于在请求期间保持状态，如果激活 ，每个用户都会有一个session hash</p>
<div class="language-ruby highlighter-rouge">
<pre class="highlight">
{% highlight html %}<span class="n">enable</span> <span class="ss">:sessions</span>
<span class="n">get</span> <span class="s1">&#39;/&#39;</span> <span class="k">do</span>
<span class="s2">&quot;value = &quot;</span> <span class="o">&lt;&lt;</span> <span class="n">session</span><span class="p">[</span><span class="ss">:value</span><span class="p">].</span><span class="nf">inspect</span>
<span class="k">end</span>
<span class="n">get</span> <span class="s1">&#39;/:value&#39;</span> <span class="k">do</span>
<span class="n">session</span><span class="p">[</span><span class="s1">&#39;value&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">params</span><span class="p">[</span><span class="s1">&#39;value&#39;</span><span class="p">]</span>
<span class="k">end</span>
{% endhighlight %}
<p>{% highlight html %}创建session秘钥{% endhighlight %}</p>
<pre class="highlight">
{% highlight html %}ruby -e &quot;require &#39;securerandom&#39;; puts SecureRandom.hex(64)&quot;{% endhighlight %}
<p>使用 sysrandom gem 更喜欢使用系统 RNG 工具来生成随机值，而不是 MRI Ruby 当前默认使用的用户空间 OpenSSL：</p>
<pre class="highlight">
{% highlight html %}$ gem install sysrandom
Building native extensions.  This could take a while...
Successfully installed sysrandom-1.x
1 gem installed
$ ruby -e &quot;require &#39;sysrandom/securerandom&#39;; puts SecureRandom.hex(64)&quot;
99ae8af...snip...ec0f262ac{% endhighlight %}
<p>&nbsp;</p>
</div>
