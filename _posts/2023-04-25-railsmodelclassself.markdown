---
layout: post
title: "rails model class 使用self"
date: "2023-04-25"
categories: 
---
<p>在 Rails 模型中，<code>self</code> 关键字用于引用当前对象。以下是在 Rails 模型中使用 <code>self</code> 的几种常见方式：</p>

<ol>
	<li>在类方法中使用 <code>self</code>：</li>
</ol>

<pre>
<code>class User &lt; ApplicationRecord
  def self.active_users
    where(active: true)
  end
end</code></pre>

<p>在这个例子中，<code>self.active_users</code> 引用 <code>User</code> 类本身，该类调用 <code>where</code> 方法以查找 <code>active</code> 值为 <code>true</code> 的用户。</p>

<ol start="2">
	<li>在实例方法中使用 <code>self</code>：</li>
</ol>

<pre>
<code>class User &lt; ApplicationRecord
  def full_name
    &quot;#{self.first_name} #{self.last_name}&quot;
  end
end</code></pre>

<p>在这个例子中，<code>self.first_name</code> 和 <code>self.last_name</code> 引用 <code>User</code> 实例的属性。</p>

<ol start="3">
	<li>使用 <code>self</code> 创建 ActiveRecord 关联：</li>
</ol>

<pre>
<code>class User &lt; ApplicationRecord
  has_many :comments, -&gt; { order(created_at: :desc) }
end</code></pre>

<p>在这个例子中，<code>self</code> 引用 <code>User</code> 类本身，并创建了一个 <code>has_many</code> 关联，以将 <code>User</code> 关联到多条 <code>Comment</code> 记录。<code>-&gt; { order(created_at: :desc) }</code> 是一个 lambda 表达式，用于将该关联的评论记录按创建时间降序排序。</p>

<p>总之，Rails 中的 <code>self</code> 关键字用于引用当前对象。可以在类方法、实例方法和 ActiveRecord 关联中使用它。</p>

