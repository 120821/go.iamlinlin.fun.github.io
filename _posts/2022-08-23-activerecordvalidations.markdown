---
layout: post
title: "Active Record Validations"
date: "2022-08-23"
categories: 
---
<p><a href="https://guides.rubyonrails.org/active_record_validations.html">https://guides.rubyonrails.org/active_record_validations.html</a></p>
<p>设置验证：</p>
<p>请注意，默认错误消息是复数形式（例如，&ldquo;太短（最少为 %{count} 个字符）&rdquo;）。&nbsp; 因此，当 :minimum 为 1 时，您应该提供自定义消息或使用 presence: true 代替。&nbsp; 当 :in 或 :within 的下限为 1 时，您应该在长度之前提供自定义消息或呼叫存在。</p>
<p>class Person &lt; ApplicationRecord<br />
&nbsp; validates :bio, length: { maximum: 1000,<br />
&nbsp;&nbsp;&nbsp; too_long: &quot;%{count} characters is the maximum allowed&quot; }<br />
end</p>
<p>默认错误消息取决于正在执行的长度验证的类型。&nbsp; 您可以使用 :wrong_length、:too_long 和 :too_short 选项以及 %{count} 作为与正在使用的长度约束对应的数字的占位符来自定义这些消息。&nbsp; 您仍然可以使用 :message 选项来指定错误消息。</p>
<p>多种验证方法：</p>
{% highlight html %}class Person &lt; ApplicationRecord
&nbsp; validates :name, length: { minimum: 2 }
&nbsp; validates :bio, length: { maximum: 500 }
&nbsp; validates :password, length: { in: 6..20 }
&nbsp; validates :registration_number, length: { is: 6 }
end{% endhighlight %}
<p>示例：</p>
{% highlight html %}class Person &lt; ApplicationRecord
&nbsp; validates :name, presence: true, length: { minimum: 3 }
end{% endhighlight %}
<p>验证：</p>
{% highlight html %}person = Person.new
person.valid?
person.errors.full_messages
person = Person.new(name: &quot;John Doe&quot;)
person.valid?
person.errors.full_messages{% endhighlight %}
<p>message:</p>
<p>&nbsp;:message 选项允许您指定在验证失败时将添加到错误集合中的消息。&nbsp; 如果不使用此选项，Active Record 将为每个验证助手使用各自的默认错误消息。&nbsp; :message 选项接受 String 或 Proc。</p>
<p>&nbsp;String :message 值可以选择包含 %{value}、%{attribute} 和 %{model} 中的任何/全部，当验证失败时将动态替换它们。&nbsp; 此替换是使用 I18n gem 完成的，占位符必须完全匹配，不允许有空格。</p>
<p>&nbsp;Proc :message 值有两个参数：被验证的对象，以及带有 :model、:attribute 和 :value 键值对的散列。</p>
{% highlight html %}class Person &lt; ApplicationRecord
&nbsp; # Hard-coded message
&nbsp; validates :name, presence: { message: &quot;must be given please&quot; }
&nbsp; # Message with dynamic attribute value. %{value} will be replaced
&nbsp; # with the actual value of the attribute. %{attribute} and %{model}
&nbsp; # are also available.
&nbsp; validates :age, numericality: { message: &quot;%{value} seems wrong&quot; }
&nbsp; # Proc
&nbsp; validates :username,
&nbsp;&nbsp;&nbsp; uniqueness: {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # object = person object being validated
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # data = { model: &quot;Person&quot;, attribute: &quot;Username&quot;, value: &lt;username&gt; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; message: -&gt;(object, data) do
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Hey #{object.name}, #{data[:value]} is already taken.&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end
&nbsp;&nbsp;&nbsp; }
end{% endhighlight %}
<p>&nbsp;</p>
<p>:on 选项可让您指定何时进行验证。&nbsp; 所有内置验证助手的默认行为是在保存时运行（无论是在创建新记录时还是在更新记录时）。&nbsp; 如果要更改它，可以使用 on: :create 仅在创建新记录时运行验证，或者使用 on: :update 仅在更新记录时运行验证。</p>
