---
layout: post
title: "JavaScript Sets"
date: "2022-06-09"
categories: 
---
<blockquote> 
<p><strong>JavaScript set </strong>是<strong>唯一值的集合</strong>。<br> 每个值在一个集合中只能出现一次。<br> 集合可以保存任何数据类型的任何值。</p> 
<p><strong>如何创建集合</strong><br> 您可以通过以下方式创建JavaScript集：<br> 将数组传递给<strong>new set（）</strong><br> 创建一个新集合并使用<strong>add（）</strong>添加值<br> 创建一个新集合，并使用add（）添加变量<br> new Set（）方法<br> 将数组传递给 new Set（）构造函数：</p> 
{% highlight html %}// Create a Set
const letters = new Set(["a","b","c"]);{% endhighlight %} 
{% highlight html %}// Create a Set
const letters = new Set();
// Add Values to the Set
letters.add("a");
letters.add("b");
letters.add("c");{% endhighlight %} 
<p>如果添加相同的元素  只会保留第一个</p> 
{% highlight html %}letters.add("a");
letters.add("b");
letters.add("c");
letters.add("c");
letters.add("c");
letters.add("c");
letters.add("c");
letters.add("c");{% endhighlight %} 
<p><img alt="" height="486" src="https://img-blog.csdnimg.cn/b25f1163c19945d68ef29e7735ed6ef5.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
<p> </p> 
</blockquote> 
<blockquote> 
<h2>Set Methods</h2> 
<table><tbody>
<tr>
<th>Method</th>
<th>Description</th>
</tr>
<tr>
<td>new Set()</td>
<td>Creates a new Set</td>
</tr>
<tr>
<td>add()</td>
<td>Adds a new element to the Set</td>
</tr>
<tr>
<td>delete()</td>
<td>Removes an element from a Set</td>
</tr>
<tr>
<td>has()</td>
<td>Returns true if a value exists</td>
</tr>
<tr>
<td>clear()</td>
<td>Removes all elements from a Set</td>
</tr>
<tr>
<td>forEach()</td>
<td>Invokes a callback for each element</td>
</tr>
<tr>
<td>values()</td>
<td>Returns an Iterator with all the values in a Set</td>
</tr>
<tr>
<td>keys()</td>
<td>Same as values()</td>
</tr>
<tr>
<td>entries()</td>
<td>Returns an Iterator with the [value,value] pairs from a Set</td>
</tr>
</tbody></table>
<table><tbody>
<tr>
<th>Property</th>
<th>Description</th>
</tr>
<tr>
<td>size</td>
<td>Returns the number elements in a Set</td>
</tr>
</tbody></table>
</blockquote>
