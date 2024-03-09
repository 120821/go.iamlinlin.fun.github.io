---
layout: post
title: "ruby - for...in与 each 的区别"
date: "2022-11-18"
categories: 
---
<p>参考：<a href="https://www.runoob.com/ruby/ruby-loop.html">https://www.runoob.com/ruby/ruby-loop.html</a></p>

<p><i>for...in</i>&nbsp;循环几乎是完全等价于：</p>

<pre>
<code>(expression).each do |variable[, variable...]| code end</code></pre>

<p>但是，for 循环不会为局部变量创建一个新的作用域。</p>

<p>语法中 do 可以省略不写。但若要在一行内写出 for 式，则必须以 do 隔开条件式或程式区块。</p>

<pre>
<code>(0..5).each do |i|

&nbsp; &nbsp;puts &quot;局部变量的值为 #{i}&quot;

end</code></pre>

<p>输出：</p>

<pre>
<code>局部变量的值为 0

局部变量的值为 1

局部变量的值为 2

局部变量的值为 3

局部变量的值为 4

局部变量的值为 5</code></pre>

