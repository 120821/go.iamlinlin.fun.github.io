---
layout: post
title: "ruby hash merge/store 的简单使用"
date: "2023-05-05"
categories: 
---
<p>在 Ruby 中，哈希表是一种键值对集合，支持高效的元素查找和修改。使用哈希表可以存储各种类型的数据，如字符串、数字、数组、哈希表等。</p>

<p>Ruby 提供了多种用于哈希表合并和存储的方法，如 <code>merge</code>、<code>merge!</code>、<code>store</code> 和 <code>[]=</code>。下面我们来分别介绍这些方法的用法。</p>

<h3><code>merge</code> 方法</h3>

<p><code>merge</code> 方法可以将两个哈希表合并为一个新的哈希表，并返回合并后的哈希表。如果合并的两个哈希表中有相同的键，则取后者的值。例如：</p>

<pre>
<code>hash1 = {a: 1, b: 2}
hash2 = {b: 3, c: 4}
new_hash = hash1.merge(hash2)
puts new_hash # {:a=&gt;1, :b=&gt;3, :c=&gt;4}</code></pre>

<p>在上面的例子中，<code>hash1</code> 和 <code>hash2</code> 合并后生成了一个新的哈希表 <code>new_hash</code>，其中键 <code>b</code> 的值由后者 <code>hash2</code> 的值 <code>3</code> 覆盖了前者 <code>hash1</code> 的值 <code>2</code>。</p>

<h3><code>merge!</code> 方法</h3>

<p><code>merge!</code> 方法可以将另一个哈希表合并到当前哈希表中，并修改当前哈希表。如果合并的两个哈希表中有相同的键，则取后者的值。例如：</p>

<pre>
<code>hash1 = {a: 1, b: 2}
hash2 = {b: 3, c: 4}
hash1.merge!(hash2)
puts hash1 # {:a=&gt;1, :b=&gt;3, :c=&gt;4}</code></pre>

<p>在上面的例子中，<code>merge!</code> 方法将 <code>hash2</code> 合并到了 <code>hash1</code> 中，并修改了 <code>hash1</code> 的值。</p>

<h3><code>store</code> 方法</h3>

<p><code>store</code> 方法可以将一个键值对存储到哈希表中。如果哈希表中已经存在该键，则将该键的值更新为新的值。例如：</p>

<pre>
<code>hash = {a: 1, b: 2}
hash.store(:c, 3)
puts hash # {:a=&gt;1, :b=&gt;2, :c=&gt;3}
hash.store(:b, 4)
puts hash # {:a=&gt;1, :b=&gt;4, :c=&gt;3}</code></pre>

<p>在上面的例子中，<code>store</code> 方法分别将键值对 <code>:c =&gt; 3</code> 和 <code>:b =&gt; 4</code> 存储到了哈希表中。</p>

<h3><code>[]=</code> 方法</h3>

<p><code>[]=</code> 方法可以将一个键值对存储到哈希表中。如果哈希表中已经存在该键，则将该键的值更新为新的值。与 <code>store</code> 方法不同的是，<code>[]=</code> 方法支持使用简化的语法直接存储键值对。例如：</p>

<pre>
<code>hash = {a: 1, b: 2}
hash[:c] = 3
puts hash # {:a=&gt;1, :b=&gt;2, :c=&gt;3}
hash[:b] = 4
puts hash # {:a=&gt;1, :b=&gt;4, :c=&gt;3}</code></pre>

<p>在上面的例子中，<code>[]=</code> 方法分别使用简化的语法将键值对 <code>:c =&gt; 3</code> 和 <code>:b =&gt; 4</code> 存储到了哈希表中。</p>

