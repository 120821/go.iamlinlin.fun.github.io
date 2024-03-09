---
layout: post
title: "rails The ARGV and ENV "
date: "2022-12-23"
categories: 
---
<p>参考：<a href="https://medium.com/rubycademy/command-line-arguments-in-ruby-part-i-8a89479cb70f">https://medium.com/rubycademy/command-line-arguments-in-ruby-part-i-8a89479cb70f</a></p>

<p>1.使用ARGV，</p>

<p>书写脚本<code>list_argv.rb，然后运行ruby list_argv.rb</code></p>

<pre>
<strong>$&gt; cat list_argv.rb
</strong>p ARGV.class
p ARGV
<strong>$&gt; ruby list_argv.rb arg1 arg2 arg3
</strong>Array
[&quot;arg1&quot;, &quot;arg2&quot;, &quot;arg3&quot;]</pre>

<p>返回的结果：</p>

<pre>
[&quot;arg1&quot;, &quot;arg2&quot;, &quot;arg3&quot;]</pre>

<p>2.使用ENV，在脚本xx.rb,把参数确定为ENV[&#39;to&#39;] ENV[&#39;FROM&#39;],</p>

<p>运行的时候这样：</p>

<pre>
<code>RAILS_ENV=development FROM= 200 TO=2000 bundle exec ruby xx.rb</code></pre>

<p>就可以使用了。（此时，默认的参数是string，如果需要使用数字，就把ENV[&#39;TO&#39;]换成ENV[&#39;TO&#39;].to_i）</p>

