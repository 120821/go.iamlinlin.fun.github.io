---
layout: post
title: "nokogiri - 根据css对数据处理"
date: "2022-10-26"
categories: 
---
<p><a href="https://github.com/sparklemotion/nokogiri">https://github.com/sparklemotion/nokogiri</a></p>

<p><a href="http://ruby.bastardsbook.com/chapters/html-parsing/">教程</a>&nbsp;&nbsp;&nbsp;<a href="https://nokogiri.org/tutorials/toc.html">完整教程</a>&nbsp; <a href="https://stackoverflow.com/questions/40961490/in-ruby-with-sinatra-how-to-get-i-response-with-get-method-on-rest-client">https://stackoverflow.com/questions/40961490/in-ruby-with-sinatra-how-to-get-i-response-with-get-method-on-rest-client</a></p>

<p>安装：</p>

{% highlight %}
gem install nokogiri{% endhighlight %}

<p>然后bundle即可</p>

<p>获得html的内容：</p>

<p>&nbsp;</p>

<p>常用的使用a链接获得数据：</p>

<p>存在这样的html：</p>

{% highlight %}
<code class="prettyprint lang-html"><span class="tag">&lt;a</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">&quot;http://www.google.com&quot;</span><span class="tag">&gt;</span><span class="pln">Click here</span><span class="tag">&lt;/a&gt;</span>{% endhighlight %}

<p><code class="prettyprint lang-html"><span class="tag">就可以使用这样的方法进行获得需要的内容：</span>{% endhighlight %}</p>

{% highlight %}
<code class="prettyprint"><span class="com"># set URL to point to where the page exists</span><span class="pln">
page </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Nokogiri</span><span class="pun">::</span><span class="pln">HTML</span><span class="pun">(</span><span class="pln">open</span><span class="pun">(</span><span class="pln">PAGE_URL</span><span class="pun">))</span><span class="pln">
links </span><span class="pun">=</span><span class="pln"> page</span><span class="pun">.</span><span class="pln">css</span><span class="pun">(</span><span class="str">&quot;a&quot;</span><span class="pun">)</span><span class="pln">
puts links</span><span class="pun">.</span><span class="pln">length   </span><span class="com"># =&gt; 6</span><span class="pln">
puts links</span><span class="pun">[</span><span class="lit">0</span><span class="pun">].</span><span class="pln">text   </span><span class="com"># =&gt; Click here</span><span class="pln">
puts links</span><span class="pun">[</span><span class="lit">0</span><span class="pun">][</span><span class="str">&quot;href&quot;</span><span class="pun">]</span><span class="pln"> </span><span class="com"># =&gt; http://www.google.com</span>{% endhighlight %}

<p>也可以使用多层的关系：</p>

{% highlight %}
<code class="prettyprint"><span class="pln">page</span><span class="pun">.</span><span class="pln">css</span><span class="pun">(</span><span class="str">&#39;p&#39;</span><span class="pun">).</span><span class="pln">css</span><span class="pun">(</span><span class="str">&quot;a[data-category=news]&quot;</span><span class="pun">).</span><span class="pln">css</span><span class="pun">(</span><span class="str">&quot;strong&quot;</span><span class="pun">)</span>{% endhighlight %}

<p>In your case, after {% highlight %}response = RestClient.get get_url...{% endhighlight %} you should have variable {% highlight %}response{% endhighlight %} and ability to call {% highlight %}response.headers{% endhighlight %}, {% highlight %}response.code{% endhighlight %} or {% highlight %}response.body{% endhighlight %}.</p>

<p><span class="comment-copy">You can pass {% highlight %}response.body{% endhighlight %} to nokogiri: {% highlight %}Nokogiri::HTML(response.body).at(&#39;body&#39;){% endhighlight %}</span></p>

<p>以下是解析和查询文档的示例用法（不是很清晰，可以看顶部的教程）：</p>

{% highlight %}
{% highlight %}#! /usr/bin/env ruby

require &#39;nokogiri&#39;

require &#39;open-uri&#39;

# Fetch and parse HTML document

doc = Nokogiri::HTML(URI.open(&#39;https://nokogiri.org/tutorials/installing_nokogiri.html&#39;))

# Search for nodes by css

doc.css(&#39;nav ul.menu li a&#39;, &#39;article h2&#39;).each do |link|

&nbsp; puts link.content

end

# Search for nodes by xpath

doc.xpath(&#39;//nav//ul//li/a&#39;, &#39;//article//h2&#39;).each do |link|

&nbsp; puts link.content

end

# Or mix and match

doc.search(&#39;nav ul.menu li a&#39;, &#39;//article//h2&#39;).each do |link|

&nbsp; puts link.content

end{% endhighlight %}

