---
layout: post
title: "rails increment!"
date: "2023-01-29"
categories: 
---
<p>refer : <a href="https://apidock.com/rails/ActiveRecord/Base/increment!">https://apidock.com/rails/ActiveRecord/Base/increment!</a></p>

<p><code><strong>increment!</strong>(attribute, by = 1)</code> <em>public</em></p>

<div class="description">
<p>Wrapper around <tt><a href="https://apidock.com/rails/ActiveRecord/Base/increment">increment</a></tt> that saves the record. This method differs from its non-bang version in that it passes through the attribute setter. Saving is not subjected to validation checks. Returns <tt>true</tt> if the record could be saved.</p>

<p>包装保存记录的增量。 此方法与其非 bang 版本的不同之处在于它通过属性设置器。 保存不受验证检查。 如果可以保存记录，则返回 true。</p>
</div>

<pre>
<code>a = Article.<a href="https://apidock.com/rails/ActiveRecord/Base/first/class">first</a>
b = Article.<a href="https://apidock.com/rails/ActiveRecord/Base/first/class">first</a>
a.<a href="https://apidock.com/rails/ActiveRecord/Base/increment%21">increment!</a>(:view_count)
b.<a href="https://apidock.com/rails/ActiveRecord/Base/increment%21">increment!</a>(:view_count)
a.<a href="https://apidock.com/rails/ActiveRecord/Base/reload">reload</a>.view_count # -&gt; 1
b.<a href="https://apidock.com/rails/ActiveRecord/Base/reload">reload</a>.view_count # -&gt; 1</code>
</pre>

<p>使用：</p>

<pre>
<code>&nbsp;&nbsp; counter = Counter.find_by(name: name)

-&nbsp;&nbsp;&nbsp; if counter.present?

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; counter.value += 1

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; counter.save!

-&nbsp;&nbsp;&nbsp; else

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Counter.create! name: name, value: 1

-&nbsp;&nbsp;&nbsp; end

+&nbsp;&nbsp;&nbsp; counter = Counter.find_or_create_by(name: name)

+&nbsp;&nbsp;&nbsp; counter.increment!(:value)</code></pre>

<p>&nbsp;</p>

