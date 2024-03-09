---
layout: post
title: "rails extend"
date: "2023-04-25"
categories: 
---
<p>在 Rails 中 extend 关键字用于让一个模块中的方法和类方法成为另一个类的实例方法和类方法。下面是一个例子：</p>

<pre>
<code>module MyModule
  def hello
    puts &quot;Hello from MyModule&quot;
  end

  def self.goodbye
    puts &quot;Goodbye from MyModule&quot;
  end
end

class MyClass
  extend MyModule
end

MyClass.hello #=&gt; undefined method `hello&#39; for MyClass:Class (NoMethodError)
MyClass.goodbye #=&gt; Goodbye from MyModule</code></pre>

<p>可以看到，通过 extend 关键字将 MyModule 模块中的方法添加到 MyClass 中，这个时候 MyModule 模块中的实例方法 <code>hello</code> 并没有成为 MyClass 的类方法，而 MyModule 模块中的类方法 <code>goodbye</code> 成为了 MyClass 的类方法。</p>

<p>需要注意的是，如果将实例方法添加为类方法，调用时会报 <code>undefined method &#39;hello&#39; for MyClass:Class</code> 的错误。如果要添加实例方法，则应使用 <code>include</code> 关键字。例如：</p>

<pre>
<code>module MyModule
  def hello
    puts &quot;Hello from MyModule&quot;
  end
end

class MyClass
  include MyModule
end

MyClass.new.hello #=&gt; Hello from MyModule</code></pre>

<p>在这个例子中，使用了 <code>include</code> 关键字将 MyModule 模块中的方法添加为 MyClass 实例方法。</p>

