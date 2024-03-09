---
layout: post
title: "rails abstract_class "
date: "2023-01-29"
categories: 
---
<p><a href="https://medium.com/@jeremy_96642/deep-rails-how-to-use-abstract-classes-6aee9b686e75">https://medium.com/@jeremy_96642/deep-rails-how-to-use-abstract-classes-6aee9b686e75</a></p>

<p>创建抽象的类：一个小的类级声明，它将一个类设置为抽象类：</p>

<pre>
<code>
class SomeAbstractModel &lt; ApplicationRecord
  self.abstract_class = true
  
  # some heritable methods here
end</code></pre>

<p>2.不能在数据库使用，是一个抽象的概念</p>

<pre>
<code>
SomeAbstractClass.create!
# =&gt; NotImplementedError: (Vehicle is an abstract class and cannot be instantiated.)</code></pre>

<p>3.创建model后可以使用。</p>

<p>例如：声明一个抽象的script类，必须包含的是code_hash,具有的属性是code_hash, ckb_hash</p>

<pre>
<code>class Script &lt; ActiveRecord::Base

&nbsp; self.abstract_class = true

&nbsp; validates_presence_of :code_hash

&nbsp; attribute :code_hash, :ckb_hash

end</code></pre>

<p>&nbsp;</p>

