---
layout: post
title: "Active Record Callbacks"
date: "2022-08-23"
categories: 
---
<p><a href="https://guides.rubyonrails.org/active_record_callbacks.html">Active Record Callbacks</a></p>

<p>所有的callback：</p>

<h4 id="creating-an-object"><a class="anchorlink" href="https://guides.rubyonrails.org/active_record_callbacks.html#creating-an-object">3.1 Creating an Object</a></h4>

<ul>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-before_validation"><code>before_validation</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-after_validation"><code>after_validation</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_save"><code>before_save</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_save"><code>around_save</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_create"><code>before_create</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_create"><code>around_create</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_create"><code>after_create</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_save"><code>after_save</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit"><code>after_commit</code></a> / <a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_rollback"><code>after_rollback</code></a></li>
</ul>

<h4 id="updating-an-object"><a class="anchorlink" href="https://guides.rubyonrails.org/active_record_callbacks.html#updating-an-object">3.2 Updating an Object</a></h4>

<ul>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-before_validation"><code>before_validation</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-after_validation"><code>after_validation</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_save"><code>before_save</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_save"><code>around_save</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_update"><code>before_update</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_update"><code>around_update</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_update"><code>after_update</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_save"><code>after_save</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit"><code>after_commit</code></a> / <a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_rollback"><code>after_rollback</code></a></li>
</ul>

<h4 id="destroying-an-object"><a class="anchorlink" href="https://guides.rubyonrails.org/active_record_callbacks.html#destroying-an-object">3.3 Destroying an Object</a></h4>

<ul>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_destroy"><code>before_destroy</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_destroy"><code>around_destroy</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_destroy"><code>after_destroy</code></a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit"><code>after_commit</code></a> / <a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_rollback"><code>after_rollback</code></a></li>
</ul>

<p>callback用于注册：</p>

<pre>
<code>class User &lt; ApplicationRecord
&nbsp; validates :login, :email, presence: true
&nbsp; before_validation :ensure_login_has_a_value
&nbsp; private
&nbsp;&nbsp;&nbsp; def ensure_login_has_a_value
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if login.nil?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.login = email unless email.blank?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end
&nbsp;&nbsp;&nbsp; end
end{% endhighlight %}

<p>如果块内的代码太短以至于它适合一行，请考虑使用这种样式</p>

<pre>
<code>class User &lt; ApplicationRecord

&nbsp; validates :login, :email, presence: true
&nbsp; before_create do

&nbsp;&nbsp;&nbsp; self.name = login.capitalize if name.blank?

&nbsp; end

end{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code>注意：callback必须放在private方法中：</code></div>

<p><code>class User &lt; ApplicationRecord<br />
&nbsp; validates :login, :email, presence: true</code></p>

<p><code>&nbsp; before_validation :ensure_login_has_a_value</code></p>

<pre>
<code>&nbsp; private
&nbsp;&nbsp;&nbsp; def ensure_login_has_a_value
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if login.nil?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.login = email unless email.blank?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end
&nbsp;&nbsp;&nbsp; end
end{% endhighlight %}

<p>The following methods trigger callbacks:</p>

<ul>
	<li><code>create</code></li>
	<li><code>create!</code></li>
	<li><code>destroy</code></li>
	<li><code>destroy!</code></li>
	<li><code>destroy_all</code></li>
	<li><code>destroy_by</code></li>
	<li><code>save</code></li>
	<li><code>save!</code></li>
	<li><code>save(validate: false)</code></li>
	<li><code>toggle!</code></li>
	<li><code>touch</code></li>
	<li><code>update_attribute</code></li>
	<li><code>update</code></li>
	<li><code>update!</code></li>
	<li><code>valid?</code></li>
</ul>

<p>Additionally, the <code>after_find</code> callback is triggered by the following finder methods:</p>

<ul>
	<li><code>all</code></li>
	<li><code>first</code></li>
	<li><code>find</code></li>
	<li><code>find_by</code></li>
	<li><code>find_by_*</code></li>
	<li><code>find_by_*!</code></li>
	<li><code>find_by_sql</code></li>
	<li><code>last</code></li>
</ul>

<p><code>跳过callback：</code></p>

<ul>
	<li><code>decrement!</code></li>
	<li><code>decrement_counter</code></li>
	<li><code>delete</code></li>
	<li><code>delete_all</code></li>
	<li><code>delete_by</code></li>
	<li><code>increment!</code></li>
	<li><code>increment_counter</code></li>
	<li><code>insert</code></li>
	<li><code>insert!</code></li>
	<li><code>insert_all</code></li>
	<li><code>insert_all!</code></li>
	<li><code>touch_all</code></li>
	<li><code>update_column</code></li>
	<li><code>update_columns</code></li>
	<li><code>update_all</code></li>
	<li><code>update_counters</code></li>
	<li><code>upsert</code></li>
	<li><code>upsert_all</code></li>
</ul>

<h3 id="relational-callbacks"><a class="anchorlink" href="https://guides.rubyonrails.org/active_record_callbacks.html#relational-callbacks">Relational Callbacks</a></h3>

<p>删除后进行调用：</p>

<pre>
<code>class User &lt; ApplicationRecord
&nbsp; has_many :articles, dependent: :destroy
end
class Article &lt; ApplicationRecord
&nbsp; after_destroy :log_destroy_action
&nbsp; def log_destroy_action
&nbsp;&nbsp;&nbsp; puts &#39;Article destroyed&#39;
&nbsp; end
end{% endhighlight %}

<p>验证：</p>

<pre>
<code>user = User.first

user.articles.create!

user.destroy{% endhighlight %}

<p><a href="https://guides.rubyonrails.org/active_record_callbacks.html#conditional-callbacks">8个条件回调(进官网看吧）</a></p>

