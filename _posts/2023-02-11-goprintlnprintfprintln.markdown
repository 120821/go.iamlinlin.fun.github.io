---
layout: post
title: "go Println Printf println"
date: "2023-02-11"
categories: 
---
<p>refer: <a href="https://blog.csdn.net/zgh0711/article/details/78843361">https://blog.csdn.net/zgh0711/article/details/78843361</a></p>

<p><strong>Println :可以打印出字符串，和变量</strong><br />
<strong>Printf : 只可以打印出格式化的字符串,可以输出字符串类型的变量，不可以输出整形变量和整形</strong></p>

<pre>
<code>a := 10
fmt.Println(a)　　//right
fmt.Println(&quot;abc&quot;)　　//right
fmt.Printf(&quot;%d&quot;,a)　　//right
fmt.Printf(a)　　//error</code></pre>

<p><a href="https://www.zhihu.com/question/335186436">https://www.zhihu.com/question/335186436</a></p>

<p>println可以直接使用，但是不建议。</p>

<p>&nbsp;</p>

