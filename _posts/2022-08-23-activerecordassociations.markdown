---
layout: post
title: "Active Record Associations"
date: "2022-08-23"
categories: 
---
<p><a href="https://guides.rubyonrails.org/association_basics.html#why-associations-questionmark">Active Record Associations</a></p>

<p>关联关系：1：N</p>

<p>class Author &lt; ApplicationRecord<br />
&nbsp; has_many :books, dependent: :destroy<br />
end</p>

<p>class Book &lt; ApplicationRecord<br />
&nbsp; belongs_to :author<br />
end</p>

<p>创建的时候，需要进行关联：</p>

<p>@book = Book.create(published_at: Time.now, author_id: @author.id)</p>

<p>@book = @author.books.create(published_at: Time.now)</p>

<p>这时：删除作者及其所有书籍要容易得多：</p>

<p>@author.destroy</p>

<p><img alt="belongs_to Association Diagram" src="https://guides.rubyonrails.org/images/association_basics/belongs_to.png" /></p>

<p>对应的migration应该是这样；</p>

<p>class CreateBooks &lt; ActiveRecord::Migration[7.0]<br />
&nbsp; def change<br />
&nbsp;&nbsp;&nbsp; create_table :authors do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :name<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps<br />
&nbsp;&nbsp;&nbsp; end</p>

<p>&nbsp;&nbsp;&nbsp; create_table :books do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.belongs_to :author<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.datetime :published_at<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end</p>

<p>关联关系&nbsp; 1：1</p>

<p>class Supplier &lt; ApplicationRecord<br />
&nbsp; has_one :account<br />
end</p>

<p><img alt="has_one Association Diagram" src="https://guides.rubyonrails.org/images/association_basics/has_one.png" /></p>

<p>对应的migration是：</p>

<p>class CreateSuppliers &lt; ActiveRecord::Migration[7.0]<br />
&nbsp; def change<br />
&nbsp;&nbsp;&nbsp; create_table :suppliers do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :name<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps<br />
&nbsp;&nbsp;&nbsp; end</p>

<p>&nbsp;&nbsp;&nbsp; create_table :accounts do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.belongs_to :supplier<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :account_number<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end</p>

<p>比较复杂的是：<a href="https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many">{% highlight %}has_many :through{% endhighlight %}</a></p>

<p>class Physician &lt; ApplicationRecord<br />
&nbsp; has_many :appointments<br />
&nbsp; has_many :patients, through: :appointments<br />
end</p>

<p>class Appointment &lt; ApplicationRecord<br />
&nbsp; belongs_to :physician<br />
&nbsp; belongs_to :patient<br />
end</p>

<p>class Patient &lt; ApplicationRecord<br />
&nbsp; has_many :appointments<br />
&nbsp; has_many :physicians, through: :appointments<br />
end</p>

<p><img alt="has_many :through Association Diagram" src="https://guides.rubyonrails.org/images/association_basics/has_many_through.png" /></p>

<p>对应的migrate是：</p>

<p>class CreateAppointments &lt; ActiveRecord::Migration[7.0]<br />
&nbsp; def change<br />
&nbsp;&nbsp;&nbsp; create_table :physicians do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :name<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps<br />
&nbsp;&nbsp;&nbsp; end</p>

<p>&nbsp;&nbsp;&nbsp; create_table :patients do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.string :name<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps<br />
&nbsp;&nbsp;&nbsp; end</p>

<p>&nbsp;&nbsp;&nbsp; create_table :appointments do |t|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.belongs_to :physician<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.belongs_to :patient<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.datetime :appointment_date<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.timestamps<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

