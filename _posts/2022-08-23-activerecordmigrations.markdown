---
layout: post
title: "Active Record Migrations"
date: "2022-08-23"
categories: 
---
<p><a href="https://guides.rubyonrails.org/active_record_migrations.html">https://guides.rubyonrails.org/active_record_migrations.html</a></p>
<p>示例：</p>
{% highlight html %}class CreateProducts &lt; ActiveRecord::Migration[7.0]
&nbsp; def change
&nbsp;&nbsp;&nbsp; create_table :products do |t|
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :name
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.text :description
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps
&nbsp;&nbsp;&nbsp; end
&nbsp; end
end{% endhighlight %}
<p>可以使用 up 和 down 而不是 change：</p>
{% highlight html %}class ChangeProductsPrice &lt; ActiveRecord::Migration[7.0]<br />
&nbsp; def up<br />
&nbsp;&nbsp;&nbsp; change_table :products do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.change :price, :string<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end{% endhighlight %}
{% highlight html %}&nbsp; def down<br />
&nbsp;&nbsp;&nbsp; change_table :products do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.change :price, :integer<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end{% endhighlight %}
<p>也可以直接命令创建的时候明确类型：</p>
{% highlight html %}bin/rails generate migration CreateProducts name:string part_number:string{% endhighlight %}
<p>列的增加或者重命名：</p>
{% highlight html %}
<code class="highlight ruby"><span class="n">add_column</span> <span class="ss">:users</span><span class="p">,</span> <span class="ss">:home_page_url</span><span class="p">,</span> <span class="ss">:string</span>
<span class="n">rename_column</span> <span class="ss">:users</span><span class="p">,</span> <span class="ss">:email</span><span class="p">,</span> <span class="ss">:email_address</span>{% endhighlight %}
<p>删除表：</p>
{% highlight html %}
<code class="highlight ruby"><span class="n">drop_table</span> <span class="ss">:distributors
<span class="ss">回滚：</span></span>{% endhighlight %}
<p>这将通过恢复 change 方法或运行 down 方法回滚最新的迁移。&nbsp; 如果您需要撤消多个迁移，您可以提供一个 STEP 参数：</p>
{% highlight html %}bin/rails db:rollback
bin/rails db:rollback STEP=3{% endhighlight %}
<p>还原：</p>
<p>将还原最后 3 次迁移。</p>
<p>&nbsp;db:migrate:redo 命令是执行回滚然后再次迁移备份的快捷方式。&nbsp; 与 db:rollback 命令一样，如果需要返回多个版本，可以使用 STEP 参数，例如：</p>
{% highlight html %}bin/rails db:migrate:redo STEP=3{% endhighlight %}
<p>设置环境：</p>
{% highlight html %}bin/rails db:migrate RAILS_ENV=test{% endhighlight %}
<p>执行migrate的时候进行创建数据删除数据：</p>
{% highlight html %}class AddInitialProducts &lt; ActiveRecord::Migration[7.0]
&nbsp; def up
&nbsp;&nbsp;&nbsp; 5.times do |i|
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Product.create(name: &quot;Product ##{i}&quot;, description: &quot;A product.&quot;)
&nbsp;&nbsp;&nbsp; end
&nbsp; end{% endhighlight %}
{% highlight html %}&nbsp; def down
&nbsp;&nbsp;&nbsp; Product.delete_all
&nbsp; end
end{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
