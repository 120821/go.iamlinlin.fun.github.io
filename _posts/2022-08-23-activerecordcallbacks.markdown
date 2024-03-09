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
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-before_validation">{% highlight %}before_validation{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-after_validation">{% highlight %}after_validation{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_save">{% highlight %}before_save{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_save">{% highlight %}around_save{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_create">{% highlight %}before_create{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_create">{% highlight %}around_create{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_create">{% highlight %}after_create{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_save">{% highlight %}after_save{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit">{% highlight %}after_commit{% endhighlight %}</a> / <a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_rollback">{% highlight %}after_rollback{% endhighlight %}</a></li>
</ul>

<h4 id="updating-an-object"><a class="anchorlink" href="https://guides.rubyonrails.org/active_record_callbacks.html#updating-an-object">3.2 Updating an Object</a></h4>

<ul>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-before_validation">{% highlight %}before_validation{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveModel/Validations/Callbacks/ClassMethods.html#method-i-after_validation">{% highlight %}after_validation{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_save">{% highlight %}before_save{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_save">{% highlight %}around_save{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_update">{% highlight %}before_update{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_update">{% highlight %}around_update{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_update">{% highlight %}after_update{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_save">{% highlight %}after_save{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit">{% highlight %}after_commit{% endhighlight %}</a> / <a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_rollback">{% highlight %}after_rollback{% endhighlight %}</a></li>
</ul>

<h4 id="destroying-an-object"><a class="anchorlink" href="https://guides.rubyonrails.org/active_record_callbacks.html#destroying-an-object">3.3 Destroying an Object</a></h4>

<ul>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-before_destroy">{% highlight %}before_destroy{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-around_destroy">{% highlight %}around_destroy{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Callbacks/ClassMethods.html#method-i-after_destroy">{% highlight %}after_destroy{% endhighlight %}</a></li>
	<li><a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit">{% highlight %}after_commit{% endhighlight %}</a> / <a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_rollback">{% highlight %}after_rollback{% endhighlight %}</a></li>
</ul>

<p>callback用于注册：</p>

{% highlight %}
{% highlight %}class User &lt; ApplicationRecord
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

{% highlight %}
{% highlight %}class User &lt; ApplicationRecord

&nbsp; validates :login, :email, presence: true
&nbsp; before_create do

&nbsp;&nbsp;&nbsp; self.name = login.capitalize if name.blank?

&nbsp; end

end{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight %}注意：callback必须放在private方法中：{% endhighlight %}</div>

<p>{% highlight %}class User &lt; ApplicationRecord<br />
&nbsp; validates :login, :email, presence: true{% endhighlight %}</p>

<p>{% highlight %}&nbsp; before_validation :ensure_login_has_a_value{% endhighlight %}</p>

{% highlight %}
{% highlight %}&nbsp; private
&nbsp;&nbsp;&nbsp; def ensure_login_has_a_value
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if login.nil?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.login = email unless email.blank?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end
&nbsp;&nbsp;&nbsp; end
end{% endhighlight %}

<p>The following methods trigger callbacks:</p>

<ul>
	<li>{% highlight %}create{% endhighlight %}</li>
	<li>{% highlight %}create!{% endhighlight %}</li>
	<li>{% highlight %}destroy{% endhighlight %}</li>
	<li>{% highlight %}destroy!{% endhighlight %}</li>
	<li>{% highlight %}destroy_all{% endhighlight %}</li>
	<li>{% highlight %}destroy_by{% endhighlight %}</li>
	<li>{% highlight %}save{% endhighlight %}</li>
	<li>{% highlight %}save!{% endhighlight %}</li>
	<li>{% highlight %}save(validate: false){% endhighlight %}</li>
	<li>{% highlight %}toggle!{% endhighlight %}</li>
	<li>{% highlight %}touch{% endhighlight %}</li>
	<li>{% highlight %}update_attribute{% endhighlight %}</li>
	<li>{% highlight %}update{% endhighlight %}</li>
	<li>{% highlight %}update!{% endhighlight %}</li>
	<li>{% highlight %}valid?{% endhighlight %}</li>
</ul>

<p>Additionally, the {% highlight %}after_find{% endhighlight %} callback is triggered by the following finder methods:</p>

<ul>
	<li>{% highlight %}all{% endhighlight %}</li>
	<li>{% highlight %}first{% endhighlight %}</li>
	<li>{% highlight %}find{% endhighlight %}</li>
	<li>{% highlight %}find_by{% endhighlight %}</li>
	<li>{% highlight %}find_by_*{% endhighlight %}</li>
	<li>{% highlight %}find_by_*!{% endhighlight %}</li>
	<li>{% highlight %}find_by_sql{% endhighlight %}</li>
	<li>{% highlight %}last{% endhighlight %}</li>
</ul>

<p>{% highlight %}跳过callback：{% endhighlight %}</p>

<ul>
	<li>{% highlight %}decrement!{% endhighlight %}</li>
	<li>{% highlight %}decrement_counter{% endhighlight %}</li>
	<li>{% highlight %}delete{% endhighlight %}</li>
	<li>{% highlight %}delete_all{% endhighlight %}</li>
	<li>{% highlight %}delete_by{% endhighlight %}</li>
	<li>{% highlight %}increment!{% endhighlight %}</li>
	<li>{% highlight %}increment_counter{% endhighlight %}</li>
	<li>{% highlight %}insert{% endhighlight %}</li>
	<li>{% highlight %}insert!{% endhighlight %}</li>
	<li>{% highlight %}insert_all{% endhighlight %}</li>
	<li>{% highlight %}insert_all!{% endhighlight %}</li>
	<li>{% highlight %}touch_all{% endhighlight %}</li>
	<li>{% highlight %}update_column{% endhighlight %}</li>
	<li>{% highlight %}update_columns{% endhighlight %}</li>
	<li>{% highlight %}update_all{% endhighlight %}</li>
	<li>{% highlight %}update_counters{% endhighlight %}</li>
	<li>{% highlight %}upsert{% endhighlight %}</li>
	<li>{% highlight %}upsert_all{% endhighlight %}</li>
</ul>

<h3 id="relational-callbacks"><a class="anchorlink" href="https://guides.rubyonrails.org/active_record_callbacks.html#relational-callbacks">Relational Callbacks</a></h3>

<p>删除后进行调用：</p>

{% highlight %}
{% highlight %}class User &lt; ApplicationRecord
&nbsp; has_many :articles, dependent: :destroy
end
class Article &lt; ApplicationRecord
&nbsp; after_destroy :log_destroy_action
&nbsp; def log_destroy_action
&nbsp;&nbsp;&nbsp; puts &#39;Article destroyed&#39;
&nbsp; end
end{% endhighlight %}

<p>验证：</p>

{% highlight %}
{% highlight %}user = User.first

user.articles.create!

user.destroy{% endhighlight %}

<p><a href="https://guides.rubyonrails.org/active_record_callbacks.html#conditional-callbacks">8个条件回调(进官网看吧）</a></p>

