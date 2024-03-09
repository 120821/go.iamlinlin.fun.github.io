---
layout: post
title: "ruby ActiveRecord find"
date: "2023-02-15"
categories: 
---
<p><a href="https://api.rubyonrails.org/v7.0.4.2/classes/ActiveRecord/FinderMethods.html#method-i-find">https://api.rubyonrails.org/v7.0.4.2/classes/ActiveRecord/FinderMethods.html#method-i-find</a></p>

<p>按 id 查找 - 这可以是特定 id (1)、id 列表 (1, 5, 6) 或 id 数组 ([5, 6, 10])。&nbsp; 如果对于请求的 id 找不到一条或多条记录，则将引发 ActiveRecord::RecordNotFound。&nbsp; 如果主键是整数，则按 id 查找会使用 to_i 强制其参数。</p>

<pre>
<code>Person.find(1)          # returns the object for ID = 1
Person.find(&quot;1&quot;)        # returns the object for ID = 1
Person.find(&quot;31-sarah&quot;) # returns the object for ID = 31
Person.find(1, 2, 6)    # returns an array for objects with IDs in (1, 2, 6)
Person.find([7, 17])    # returns an array for objects with IDs in (7, 17)
Person.find([1])        # returns an array for the object with ID = 1
Person.where(&quot;administrator = 1&quot;).order(&quot;created_on DESC&quot;).find(1)</code></pre>

