---
layout: post
title: "ruby insert_all"
date: "2023-02-07"
categories: 
---
<p>refer: <a href="https://apidock.com/rails/ActiveRecord/Persistence/ClassMethods/insert_all">https://apidock.com/rails/ActiveRecord/Persistence/ClassMethods/insert_all</a></p>

<p>(<a href="https://apidock.com/rails/ActiveRecord/ConnectionAdapters/PostgreSQL">PostgreSQL</a> only) An array of attributes to return for all successfully inserted records, which by default is the primary key. Pass <tt>returning: %w[ id name ]</tt> for both id and name or <tt>returning: false</tt> to omit the underlying <tt>RETURNING</tt> SQL clause entirely.</p>

<p>例如：</p>

<pre>
<code>
# Insert records and skip inserting any duplicates.
# Here &quot;Eloquent Ruby&quot; is skipped because its id is not unique.

Book.<a href="https://apidock.com/rails/ActiveRecord/Persistence/ClassMethods/insert_all">insert_all</a>([
  { id: 1, title: &quot;Rework&quot;, author: &quot;David&quot; },
  { id: 1, title: &quot;Eloquent Ruby&quot;, author: &quot;Russ&quot; }
])</code></pre>

<p>如果：</p>

<pre>
<code>
# Insert records and skip inserting any duplicates.
# Here &quot;Eloquent Ruby&quot; is skipped because its id is not unique.

books = Book.<a href="https://apidock.com/rails/ActiveRecord/Persistence/ClassMethods/insert_all">insert_all</a>([
  { id: 1, title: &quot;Rework&quot;, author: &quot;David&quot; },
  { id: 1, title: &quot;Eloquent Ruby&quot;, author: &quot;Russ&quot; }
])</code></pre>

<pre>
<code>book_ids.each do |book_id|

&nbsp; puts book_id.inspect

end</code></pre>

<p>将会返回：</p>

<pre>
<code>{book: 4390}</code></pre>

<p>也就是 ： 获得的是所创建的book的id。</p>

