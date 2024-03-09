---
layout: post
title: "go test -run 正则表达式使用"
date: "2023-11-05"
categories: 
---
<p><code>go test -run</code>命令用于运行指定的测试函数或测试方法</p>

<p>使用 的是正则表达式：</p>

<pre>
<code>go test -<span style="color:#f5ab35">run</span> &lt;regex&gt;{% endhighlight %}

<p>运行Test开头的所有测试函数：</p>

<pre>
<code>go test -run ^Test{% endhighlight %}

<p>运行所有包含Add的测试函数：</p>

<pre>
<code>go test -<span style="color:#f5ab35">run</span> <span style="color:#f5ab35">Add</span>{% endhighlight %}

<p>运行Test开头Number结尾的测试函数:</p>

<pre>
<code>go test -run ^Test.*Numbers${% endhighlight %}

