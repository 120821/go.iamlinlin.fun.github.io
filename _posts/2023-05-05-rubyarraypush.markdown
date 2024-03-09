---
layout: post
title: "ruby array push"
date: "2023-05-05"
categories: 
---
<p>Ruby 中的数组可以通过 <code>concat</code> 或 <code>+</code> 运算符进行合并。例如：</p>

<pre>
<code>arr1 = [1, 2, 3]
arr2 = [4, 5, 6]
arr3 = arr1.concat(arr2)
# 或者
arr4 = arr1 + arr2</code></pre>

<p>以上代码中，<code>arr3</code> 和 <code>arr4</code> 都是 <code>[1, 2, 3, 4, 5, 6]</code>。</p>

<p>如果你想在原始数组中添加元素，可以使用 <code>push</code> 或 <code>&lt;&lt;</code> 方法。例如：</p>

<pre>
<code>arr = [1, 2, 3]
arr.push(4)
# 或者
arr &lt;&lt; 5
puts arr # [1, 2, 3, 4, 5]</code></pre>

<p>如果你想在数组中存储键值对，可以使用哈希表来表示。例如：</p>

<pre>
<code>hash_arr = [{name: &quot;Alice&quot;, age: 20}, {name: &quot;Bob&quot;, age: 25}]</code></pre>

<p>这里，<code>hash_arr</code> 存储了两个哈希表，每个哈希表有一个名字和一个年龄。你可以使用 <code>&lt;&lt;</code> 方法将新的哈希表添加到数组中：</p>

<pre>
<code>hash_arr &lt;&lt; {name: &quot;Charlie&quot;, age: 30}</code></pre>

<p>这将会将一个新的哈希表添加到 <code>hash_arr</code> 数组的末尾。你可以使用索引来访问数组中的元素，也可以使用哈希键来访问哈希表中的值。例如：</p>

<pre>
<code>puts hash_arr[0][:name] # &quot;Alice&quot;
puts hash_arr[1][:age] # 25</code></pre>

<p>以上代码将输出 <code>Alice</code> 和 <code>25</code>。</p>

