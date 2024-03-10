---
layout: post
title: "Active Record Migrations 数据迁移"
date: "2022-06-09"
categories: 
---
<p>一个迁移示例：</p> 
{% highlight html %}<code class="language-ruby">class CreateProducts &lt; ActiveRecord::Migration
def change
create_table :products do |t|
t.string :name
t.text :description
t.timestamps null: false
end
end
end{% endhighlight %} 
<p>  </p>
<p>如果希望迁移执行Active Record不知道如何反转的操作，可以使用reversible：</p> 
{% highlight html %}<code class="language-ruby">class ChangeProductsPrice &lt; ActiveRecord::Migration
def change
reversible do |dir|
change_table :products do |t|
dir.up   { t.change :price, :string }
dir.down { t.change :price, :integer }
end
end
end
end{% endhighlight %} 
<p>或者，您可以使用“向上”和“向下”来代替“更改”：</p> 
{% highlight html %}<code class="language-ruby">class ChangeProductsPrice &lt; ActiveRecord::Migration
def up
change_table :products do |t|
t.change :price, :string
end
end
def down
change_table :products do |t|
t.change :price, :integer
end
end
end{% endhighlight %} 
<p>2创建迁移<br> 2.1创建独立迁移<br> 迁移作为文件存储在db/migrate目录中，每个迁移类对应一个文件。文件名的格式为YYYYMMDDHHMMSS_create_products.rb，即标识迁移的UTC时间戳，后跟下划线，后跟迁移的名称。迁移类的名称（CamelCased版本）应与文件名的后一部分匹配<br> 当然，计算时间戳并不有趣，所以Active Record提供了一个生成器来处理为您制作时间戳的过程：</p> 
{% highlight html %}$ bin/rails generate migration AddPartNumberToProducts{% endhighlight %} 
<p>这将创建一个空的但名称适当的迁移：</p> 
{% highlight html %}<code class="language-ruby">class AddPartNumberToProducts &lt; ActiveRecord::Migration
def change
end
end{% endhighlight %} 
<p>如果迁移名称的格式为“AddXXXToYYY”或“RemovexxxFromyy”，后面是列名和类型列表，则将创建包含适当的add_column和remove_column语句的迁移。</p> 
{% highlight html %}$ bin/rails generate migration AddPartNumberToProducts part_number:string{% endhighlight %} 
<p>将产生</p> 
{% highlight html %}<code class="language-ruby">class AddPartNumberToProducts &lt; ActiveRecord::Migration
def change
add_column :products, :part_number, :string
end
end{% endhighlight %} 
<p>如果要在新列上添加索引，也可以这样做：</p> 
{% highlight html %}$ bin/rails generate migration AddPartNumberToProducts part_number:string:index{% endhighlight %} 
<p>将产生</p> 
{% highlight html %}<code class="language-ruby">class AddPartNumberToProducts &lt; ActiveRecord::Migration
def change
add_column :products, :part_number, :string
add_index :products, :part_number
end
end{% endhighlight %} 
<p>类似地，您可以生成迁移以从命令行中删除列：</p> 
{% highlight html %}$ bin/rails generate migration RemovePartNumberFromProducts part_number:string{% endhighlight %} 
<p>迁移</p> 
{% highlight html %}<code class="language-ruby">class RemovePartNumberFromProducts &lt; ActiveRecord::Migration
def change
remove_column :products, :part_number, :string
end
end{% endhighlight %} 
<p>你不局限于一个神奇生成的列。例如：</p> 
{% highlight html %}$ bin/rails generate migration AddDetailsToProducts part_number:string price:decimal{% endhighlight %} 
<p>迁移</p> 
{% highlight html %}<code class="language-ruby">class AddDetailsToProducts &lt; ActiveRecord::Migration
def change
add_column :products, :part_number, :string
add_column :products, :price, :decimal
end
end{% endhighlight %} 
<p>如果迁移名称的形式为“CreateXXX”，后面是列名和类型列表，则将生成一个迁移，创建表XXX，其中包含列出的列。例如：</p> 
{% highlight html %}$ bin/rails generate migration CreateProducts name:string part_number:string{% endhighlight %} 
<p>迁移</p> 
{% highlight html %}<code class="language-ruby">class CreateProducts &lt; ActiveRecord::Migration
def change
create_table :products do |t|
t.string :name
t.string :part_number
end
end
end{% endhighlight %} 
<p>一如既往，为您生成的只是一个起点。通过编辑db/migrate/YYYYMMDDHHMMSS_add_details_to_products，您可以根据需要添加或删除它。rb文件。<br> 此外，生成器接受列类型作为引用（也可以作为所属对象提供）。例如：</p> 
{% highlight html %}$ bin/rails generate migration AddUserRefToProducts user:references{% endhighlight %} 
<p>迁移</p> 
{% highlight html %}<code class="language-ruby">class AddUserRefToProducts &lt; ActiveRecord::Migration
def change
add_reference :products, :user, index: true
end
end
{% endhighlight %} 
<p>此迁移将创建一个用户id列和适当的索引。<br> 还有一个生成器，如果JoinTable是名称的一部分，它将生成联接表：</p> 
{% highlight html %}$ bin/rails g migration CreateJoinTableCustomerProduct customer product{% endhighlight %} 
<p>将产生以下迁移：</p> 
{% highlight html %}<code class="language-ruby">class CreateJoinTableCustomerProduct &lt; ActiveRecord::Migration
def change
create_join_table :customers, :products do |t|
# t.index [:customer_id, :product_id]
# t.index [:product_id, :customer_id]
end
end
end{% endhighlight %} 
<p></p>
