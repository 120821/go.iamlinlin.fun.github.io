---
layout: post
title: "rails included"
date: "2023-04-25"
categories: 
---
<p>在 Rails 中，<code>included</code> 是一个回调方法，当一个模块被包含到一个类中时会自动调用。我们可以在 <code>included</code> 方法中添加一些代码，使其在被包含的时候执行。</p>

<p>例如，我们有一个 <code>MyModule</code> 模块，我们想在它被包含到一个类中时输出一些信息，可以这样写：</p>

<pre>
<code>module MyModule
  def self.included(base)
    base.class_eval do
      puts &quot;MyModule has been included in #{base.name}!&quot;
    end
  end

  def hello
    puts &quot;Hello from MyModule&quot;
  end
end

class MyClass
  include MyModule
end

# Output: MyModule has been included in MyClass!</code></pre>

<p>在 <code>included</code> 方法中，我们通过 <code>base</code> 参数获取了被包含的类，并在其上下文中输出了一条信息。这个方法会在 <code>MyModule</code> 被包含到 <code>MyClass</code> 中时自动调用，并输出信息。</p>

<p>需要注意的是，在 <code>included</code> 方法中添加的代码仅在该模块被包含到一个类中时执行一次，而不是每次创建一个实例时都执行，因为这个方法仅在模块被包含时调用。</p>

<p>除了 <code>included</code> 方法，Ruby 还提供了其他的回调方法，如 <code>extended</code>、<code>prepended</code> 等，它们会在模块被扩展或添加到其它模块的前面时触发，可以根据需要进行使用。</p>

