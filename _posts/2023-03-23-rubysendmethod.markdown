---
layout: post
title: "ruby send method"
date: "2023-03-23"
categories: 
---
<p><a href="https://apidock.com/ruby/Object/send">https://apidock.com/ruby/Object/send</a></p>

<p>调用由符号标识的方法，将指定的任何参数传递给它。&nbsp; 如果名称 send 与 obj 中的现有方法冲突，则可以使用 send。&nbsp; 当该方法由字符串标识时，该字符串将转换为符号。</p>

<pre>
<code>class Klass
  def hello(*args)
    &quot;Hello &quot; + args.join(&#39; &#39;)
  end
end
k = Klass.<a href="https://apidock.com/ruby/Object/new/class">new</a>
k.<a href="https://apidock.com/ruby/Object/send">send</a> :hello, &quot;gentle&quot;, &quot;readers&quot;   #=&gt; &quot;Hello gentle readers&quot;</code></pre>

