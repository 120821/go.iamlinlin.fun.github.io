---
layout: post
title: "ruby call send 的简单使用"
date: "2023-08-10"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/33463336/what-does-call-do">https://stackoverflow.com/questions/33463336/what-does-call-do</a></p>

<p>Ruby使用call 可以调用方法或者proc</p>

<pre>
<code>m = 12.method(&quot;+&quot;)
# =&gt; `method` gets the `+` method defined in the `Fixnum` instance
# m.class 
# =&gt; Method

m.call(3)    #=&gt; 15
# `3` is passed inside the `+` method as argument 
m.call(20)   #=&gt; 32</code></pre>

<p>send方法也可以调用方法，在本地写一个测试：</p>

<pre>
<code>def say_hi

&nbsp; puts &quot;hihi&quot;

end

def say_goodbye

&nbsp; puts &quot;goodbye&quot;

end

# 使用send方式调用方法

name = &quot;say_hi&quot;

send(name)

m = 12.method(&quot;+&quot;)

# =&gt; `method` gets the `+` method defined in the `Fixnum` instance

# m.class

# =&gt; Method

m.call(3)&nbsp;&nbsp;&nbsp; #=&gt; 15

puts m.call(3)

# `3` is passed inside the `+` method as argument

m.call(20)&nbsp;&nbsp; #=&gt; 32

puts m.call(20)</code></pre>

<p>运行：ruby hi.rb</p>

<p>得到输出：</p>

<pre>
<code>hihi

15

32</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

