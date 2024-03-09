---
layout: post
title: "rails module class使用self"
date: "2023-04-25"
categories: 
---
<p>在 Rails 模块中，<code>self</code> 关键字也用于引用当前对象。以下是在 Rails 模块中使用 <code>self</code> 的几种常见方式：</p>

<ol>
	<li>在模块中定义类方法：</li>
</ol>

<pre>
<code>module MyModule
  def self.my_method
    # code here
  end
end</code></pre>

<p>在这个例子中，<code>self</code> 引用了 <code>MyModule</code> 模块本身，并定义了一个名为 <code>my_method</code> 的类方法。</p>

<ol start="2">
	<li>在类中包含模块，并使用 <code>self</code> 定义实例方法：</li>
</ol>

<pre>
<code>module MyModule
  def my_method
    # code here
  end
end

class MyClass
  include MyModule

  def my_other_method
    self.my_method
  end
end</code></pre>

<p>在这个例子中，<code>self</code> 引用了 <code>MyClass</code> 的实例，并包含了 <code>MyModule</code> 模块。<code>my_other_method</code> 方法使用 <code>self.my_method</code> 调用 <code>MyModule</code> 中的 <code>my_method</code> 实例方法。</p>

<ol start="3">
	<li>使用 <code>self</code> 定义 ActiveRecord 关联：</li>
</ol>

<pre>
<code>module MyModule
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def my_association
      has_many :comments
    end
  end
end

class MyClass &lt; ApplicationRecord
  include MyModule

  my_association
end</code></pre>

<p>在这个例子中，<code>self</code> 引用了 <code>MyClass</code> 类本身，并使用 <code>include</code> 包含了 <code>MyModule</code> 模块。当 <code>MyModule</code> 被包含时，<code>included</code> 方法会被调用，并使用 <code>base.extend(ClassMethods)</code> 将 <code>MyClass</code> 类的作用域扩展到 <code>ClassMethods</code> 模块中。<code>my_association</code> 方法使用 <code>self.has_many</code> 在 <code>MyClass</code> 中定义一个 ActiveRecord 关联。</p>

<p>总之，在 Rails 模块中，<code>self</code> 关键字用于引用当前对象。可以在模块中定义类方法、实例方法和 ActiveRecord 关联。在包含模块的类中，可以使用 <code>self</code> 调用模块中的方法。</p>

