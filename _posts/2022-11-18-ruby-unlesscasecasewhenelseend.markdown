---
layout: post
title: "ruby - unless 修饰符 case语句 case ... when ... else ... end  "
date: "2022-11-18"
categories: 
---
<p><a href="https://www.runoob.com/ruby/ruby-decision.html">https://www.runoob.com/ruby/ruby-decision.html</a></p>

<p>unless修饰符，语句：code unless conditional</p>

<p>示例：</p>

<pre><code>$var = &nbsp;1<br />
print &quot;1 -- 这一行输出\n&quot; if $var<br />
print &quot;2 -- 这一行不输出\n&quot; unless $var

$var = false<br />
print &quot;3 -- 这一行输出\n&quot; unless $var</code></pre><br />
返回结果：</p>

<pre><code>1 -- 这一行输出<br />
3 -- 这一行输出</code></pre>

<p>case语句</p>

<pre><code>$age = &nbsp;15<br />
case $age<br />
when 0 .. 2<br />
&nbsp; &nbsp; puts &quot;婴儿&quot;<br />
when 3 .. 6<br />
&nbsp; &nbsp; puts &quot;小孩&quot;<br />
when 7 .. 12<br />
&nbsp; &nbsp; puts &quot;child&quot;<br />
when 13 .. 18<br />
&nbsp; &nbsp; puts &quot;少年&quot;<br />
else<br />
&nbsp; &nbsp; puts &quot;其他年龄段的&quot;<br />
end</code></pre>

<p>返回结果： 少年<br />
&nbsp;</p>

