---
layout: post
title: "ruby  length/size的使用"
date: "2023-05-05"
categories: 
---
<p>在 Ruby 中，<code>length</code> 和 <code>size</code> 都是用于获取容器（如字符串、数组和哈希表）长度或大小的方法。它们通常可以用在以下容器中：</p>

<ul>
	<li>
	<p>字符串（<code>String</code>）：返回字符串的长度，即包含多少个字符。例如：</p>

	<pre>
<code>str = &quot;Hello, World!&quot;
puts str.length
puts str.size
# Output:
# 13
# 13</code></pre>
	</li>
	<li>
	<p>数组（<code>Array</code>）：返回数组中元素的数量。例如：</p>

	<pre>
<code>arr = [&#39;apple&#39;, &#39;banana&#39;, &#39;orange&#39;]
puts arr.length
puts arr.size
# Output:
# 3
# 3</code></pre>
	</li>
	<li>
	<p>哈希表（<code>Hash</code>）：返回哈希表中键值对的数量。例如：</p>

	<pre>
<code>hash = {&#39;apple&#39; =&gt; 1, &#39;banana&#39; =&gt; 2, &#39;orange&#39; =&gt; 3}
puts hash.length
puts hash.size
# Output:
# 3
# 3</code></pre>
	</li>
</ul>

<p>总之，<code>length</code> 和 <code>size</code> 方法可以用于任何类的对象，只要这个对象定义了这两个方法，通常用于返回容器的长度或大小。</p>

