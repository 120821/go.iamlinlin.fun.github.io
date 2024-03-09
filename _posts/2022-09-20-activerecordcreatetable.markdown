---
layout: post
title: "ActiveRecord create table"
date: "2022-09-20"
categories: 
---
<p>&nbsp;</p>

{% highlight %}cat app.rb<br />
require &#39;active_record&#39;{% endhighlight %}

{% highlight %}ActiveRecord::Base.establish_connection(adapter: &#39;postgresql&#39;, database: &#39;datasetter_development&#39;)
#连接本地的数据库

class User &lt; ActiveRecord::Base<br />
end

#再次运行创建table数据的时候，必须存在该表数据的class，进行migrate的时候可以不必存在。

class Account &lt; ActiveRecord::Base<br />
end

class CreateAccountTable &lt; ActiveRecord::Migration[5.2]<br />
&nbsp; def change<br />
&nbsp;&nbsp;&nbsp; create_table :accounts do |table|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table.string :first_name<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table.integer :last_name<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table.timestamps null: false<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end

# Create the table 

#运行一次ruby app.rb 就会进行migrate，再次运行脚本的时候，就需要把创建table的语句注释掉，不然会报错，提示该表已经存在了<br />
#CreateAccountTable.migrate(:up)

# Drop the table<br />
#CreateAccountTable migrate(:down)

<p>#创建数据，十万条数据</p>

(1..10000).each do |i|<br />
&nbsp; Account.create first_name: &quot;jim&quot;, last_name: &quot;#{(&#39;A&#39;..&#39;Z&#39;).to_a.shuffle[0,5].join}&quot;<br />
&nbsp; puts Account.all.size<br />
end

(1..10000).each do |i|<br />
&nbsp; Account.create last_name: &quot;jim&quot;, first_name: &quot;#{(&#39;A&#39;..&#39;Z&#39;).to_a.shuffle[0,5].join}&quot;<br />
&nbsp; puts Account.all.size<br />
end

(1..80000).each do |i|<br />
&nbsp; Account.create first_name: &quot;#{(&#39;A&#39;..&#39;Z&#39;).to_a.shuffle[0,5].join}&quot;, last_name: &quot;#{(&#39;A&#39;..&#39;Z&#39;).to_a.shuffle[0,5].join}&quot;<br />
&nbsp; puts Account.all.size<br />
end{% endhighlight %}
<br />
&nbsp;</p>

<p>&nbsp;</p>

