---
layout: post
title: "ruby compact"
date: "2023-02-06"
categories: 
---
<p>refer: <a href="https://apidock.com/rails/v5.2.3/Hash/compact">https://apidock.com/rails/v5.2.3/Hash/compact</a></p>

<p><a href="https://apidock.com/ruby/v2_5_5/Array/compact">https://apidock.com/ruby/v2_5_5/Array/compact</a></p>

<p><a href="https://www.educative.io/answers/what-is-the-compact-method-in-ruby">https://www.educative.io/answers/what-is-the-compact-method-in-ruby</a></p>

<p>1.array</p>

<p>Ruby 中的 compact 方法返回一个包含非 nil 元素的数组。&nbsp; 这意味着当我们在包含 nil 元素的数组上调用此方法时，它会删除它们。&nbsp; 它只返回数组的其他非零元素。</p>

<pre>
<code>array.compact</code></pre>

<p>例如:</p>

<pre>
<code># Create arrays

arr1 = [1, nil, 2, nil, 3]

arr2 = [&quot;a&quot;, &quot;b&quot;, &quot;c&quot;, &quot;d&quot;]

arr3 = [true, false, nil]

arr4 = [&quot;Meta&quot;, &quot;Apple&quot;, &quot;nill&quot;,nil]
# Call the compact method a = arr1.compact b = arr2.compact c = arr3.compact d = arr4.compact

# Print the returned values

puts &quot;#{a}&quot;

puts &quot;#{b}&quot;

puts &quot;#{c}&quot;

puts &quot;#{d}&quot;</code></pre>

<p>运行后，回返回结果：</p>

<pre>
<code><code>[1, 2, 3]

[&quot;a&quot;, &quot;b&quot;, &quot;c&quot;, &quot;d&quot;]

[true, false]

[&quot;Meta&quot;, &quot;Apple&quot;, &quot;nill&quot;]</code></code></pre>

<p>2.hash</p>

<p>返回具有非 nil 值的散列。</p>

<pre>
<code>hash = { a: true, b: false, c: nil }
hash.<a href="https://apidock.com/rails/Hash/compact">compact</a>        # =&gt; { a: true, b: false }
hash                # =&gt; { a: true, b: false, c: nil }
{ c: nil }.<a href="https://apidock.com/rails/Hash/compact">compact</a>  # =&gt; {}
{ c: true }.<a href="https://apidock.com/rails/Hash/compact">compact</a> # =&gt; { c: true }</code></pre>

