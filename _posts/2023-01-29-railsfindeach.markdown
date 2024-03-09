---
layout: post
title: "rails find_each "
date: "2023-01-29"
categories: 
---
<p><a href="https://apidock.com/rails/ActiveRecord/Batches/ClassMethods/find_each">https://apidock.com/rails/ActiveRecord/Batches/ClassMethods/find_each</a></p>

<p>产生查找选项找到的每条记录。&nbsp; 查找由 find_in_batches 执行，批量大小为 1000（或由 :batch_size 选项指定）。</p>

<p><code><strong>find_each</strong>(options = {})</code> <em>public</em></p>

<div class="description">
<p>Yields each record that was found by the find <tt>options</tt>. The find is performed by <a href="https://apidock.com/rails/ActiveRecord/Batches/ClassMethods/find_in_batches">find_in_batches</a> with a batch size of 1000 (or as specified by the <tt>:batch_size</tt> option).</p>

<pre>
<code> <a href="https://apidock.com/rails/Person">Person</a>.<a href="https://apidock.com/rails/ActiveRecord/Batches/ClassMethods/find_each">find_each</a>(:conditions =&gt; &quot;age &gt; 21&quot;) do |person|
    person.party_all_night!
  end</code></pre>

<p>注意：此方法仅用于批处理内存中无法一次容纳的大量记录。&nbsp; 如果您只需要循环少于 1000 条记录，最好只使用常规查找方法。</p>

<pre>
<code>class <a href="https://apidock.com/rails/ActiveRecord/Base">ActiveRecord::Base</a>
  # normal find_each does not use given order but uses id asc
  def self.find_each_with_order(options={})
    raise &quot;offset is not yet supported&quot; if options[:offset]

    page = 1
    limit = options[:limit] || 1000

    loop do
      offset = (page-1) * limit
      batch = find(:all, options.merge(:limit=&gt;limit, :offset=&gt;offset))
      page += 1

      batch.each{|x| yield x }

      break if batch.size &lt; limit
    end
  end
end</code></pre>
</div>

