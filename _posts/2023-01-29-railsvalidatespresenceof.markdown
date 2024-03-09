---
layout: post
title: "rails validates_presence_of"
date: "2023-01-29"
categories: 
---
<p><a href="https://apidock.com/rails/v5.2.3/ActiveRecord/Validations/ClassMethods/validates_presence_of">https://apidock.com/rails/v5.2.3/ActiveRecord/Validations/ClassMethods/validates_presence_of</a></p>

<p><code><strong>validates_presence_of</strong>(*attr_names)</code> <em>public</em></p>

<div class="description">
<p>Validates that the specified attributes are not blank (as defined by Object#blank?), and, if the attribute is an association, that the associated object is not marked for destruction. Happens by default on save.</p>
</div>

<p>验证指定的属性不为空（由 Object#blank 定义？），并且如果该属性是关联，则关联的对象未标记为销毁。&nbsp; 默认情况下在保存时发生。</p>

<pre>
<code><tt>class <a href="https://apidock.com/rails/Person">Person</a> &lt; <a href="https://apidock.com/rails/ActiveRecord">ActiveRecord</a>::Base
  has_one :face
  <a href="https://apidock.com/rails/ActiveRecord/Validations/ClassMethods/validates_presence_of">validates_presence_of</a> :face
end</tt></code></pre>

