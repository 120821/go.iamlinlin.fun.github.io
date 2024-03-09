---
layout: post
title: "ruby - 循环语句 while for until next each break"
date: "2022-06-09"
categories: 
---
<p><strong>Ruby&nbsp;while&nbsp;语句</strong>: while conditional [do] code end&nbsp;&nbsp;或者&nbsp;&nbsp;while conditional [:] code end<br />
理解：当&nbsp;conditional&nbsp;为真时，执行&nbsp;code。<br />
语法中 do 或 : 可以省略不写。但若要在一行内写出 while 式，则必须以 do 或 : 隔开条件式或程式区块。</p>

<pre><code>$i = 0<br />
$num = 5<br />
begin<br />
&nbsp; &nbsp;puts(&quot;在循环语句中 i = #$i&quot; )<br />
&nbsp; &nbsp;$i +=1<br />
end while $i &lt; $num</code></pre><br />
<p>输出：</p>

<pre><code>在循环语句中 i = 0<br />
在循环语句中 i = 1<br />
在循环语句中 i = 2<br />
在循环语句中 i = 3<br />
在循环语句中 i = 4</code></pre><br />
<strong>Ruby&nbsp;for&nbsp;语句</strong><br />
先计算表达式得到一个对象，然后针对&nbsp;expression&nbsp;中的每个元素分别执行一次&nbsp;code。<br />
语法<br />
for variable [, variable ...] in expression [do] code end</p>

<p>示例：</p>

<pre><code>for i in 0..5<br />
&nbsp; &nbsp;puts &quot;局部变量的值为 #{i}&quot;<br />
end</code></pre>

<p>输出：</p>

<pre><code>局部变量的值为 0<br />
局部变量的值为 1<br />
局部变量的值为 2<br />
局部变量的值为 3<br />
局部变量的值为 4<br />
局部变量的值为 5</code></pre><br />
<p><strong>Ruby&nbsp;until&nbsp;修饰符</strong><br />
当&nbsp;conditional&nbsp;为 false 时，执行&nbsp;code。<br />
如果&nbsp;until&nbsp;修饰符跟在一个没有&nbsp;rescue&nbsp;或 ensure 子句的&nbsp;begin&nbsp;语句后面，code&nbsp;会在&nbsp;conditional&nbsp;判断之前执行一次。<br />
使用：code until conditional 或者 begin code end until conditional</p>

<p>示例：</p>
<pre><code>$i = 0<br />
$num = 5<br />
begin<br />
&nbsp; &nbsp;puts(&quot;在循环语句中 i = #$i&quot; )<br />
&nbsp; &nbsp;$i +=1;<br />
end until $i &gt; $num</code></pre>

<p>输出：</p>

<pre><code>在循环语句中 i = 0<br />
在循环语句中 i = 1<br />
在循环语句中 i = 2<br />
在循环语句中 i = 3<br />
在循环语句中 i = 4<br />
在循环语句中 i = 5</code></pre>

<p><strong>ruby brake 语句：</strong>终止最内部的循环。如果在块内调用，则终止相关块的方法（方法返回 nil）。</p>

<pre><code>for i in 0..5<br />
&nbsp; &nbsp;if i &gt; 2 then<br />
&nbsp; &nbsp; &nbsp; break<br />
&nbsp; &nbsp;end<br />
&nbsp; &nbsp;puts &quot;局部变量的值为 #{i}&quot;<br />
end</code></pre>

<p>示例：</p>

<pre><code>局部变量的值为 0<br />
局部变量的值为 1<br />
局部变量的值为 2</code></pre>

<p><strong><code>ruby next 语句：</code></strong>跳到循环的下一个迭代。如果在块内调用，则终止块的执行（yield&nbsp;表达式返回 nil）。</p>

<pre><code>for i in 0..5<br />
&nbsp; &nbsp;if i &lt; 2 then<br />
&nbsp; &nbsp; &nbsp; next<br />
&nbsp; &nbsp;end<br />
&nbsp; &nbsp;puts &quot;局部变量的值为 #{i}&quot;<br />
end</code></pre>

<p>输出：</p>

<pre><code>局部变量的值为 2<br />
局部变量的值为 3<br />
局部变量的值为 4<br />
局部变量的值为 5</code></pre>

<p><strong>ruby each 语句</strong></p>

<pre><code>(0..5).each do |i|<br />
&nbsp; &nbsp;puts &quot;局部变量的值为 #{i}&quot;<br />
end</code></pre><br />
<p>输出：</p>

<pre><code>局部变量的值为 0<br />
局部变量的值为 1<br />
局部变量的值为 2<br />
局部变量的值为 3<br />
局部变量的值为 4<br />
局部变量的值为 5</code></pre><br />
<br />
<strong>Ruby&nbsp;redo&nbsp;语句</strong><br />
重新开始最内部循环的该次迭代，不检查循环条件。如果在块内调用，则重新开始&nbsp;yield&nbsp;或&nbsp;call。</p>

