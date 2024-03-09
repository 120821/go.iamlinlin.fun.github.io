---
layout: post
title: "ruby 异常处理 begin rescue end"
date: "2022-06-09"
categories: 
---
<blockquote>
<p>begin</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; 代码1</p>

<p>rescue</p>

<p>&nbsp;　代码2</p>

<p>end</p>

<p>如果执行 代码1 发生异常 则转至 代码2</p>

<p>若正常，则执行完跳出</p>
</blockquote>

<p>有2种， 经过else或者不经过else</p>

<pre>
<code>linlin@linlin-i5:/workspace/LUELUELUE-operation-backend$ bundle exec rails c
Loading development environment (Rails 6.1.5.1)
irb: warn: can&#39;t alias context from irb_context.
irb(main):001:1* begin
irb(main):002:1*   1/0
irb(main):003:1* rescue =&gt; e
irb(main):004:1*   puts &quot;in rescue  error is:#{e}&quot;
irb(main):005:1* else
irb(main):006:1*   puts &quot;in else&quot;
irb(main):007:0&gt; end
in rescue  error is:divided by 0
=&gt; nil
irb(main):008:0&gt; 

</code></pre>

<pre>
<code>irb(main):008:1* begin
irb(main):009:1*   1/1
irb(main):010:1* rescue =&gt; e
irb(main):011:1*   puts &quot;in rescue  error is:#{e}&quot;
irb(main):012:1* else
irb(main):013:1*   puts &quot;in else&quot;
irb(main):014:0&gt; end
in else
=&gt; nil
irb(main):015:0&gt; 

</code></pre>

<p>&nbsp;</p>

