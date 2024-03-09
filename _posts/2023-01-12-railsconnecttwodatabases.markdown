---
layout: post
title: "rails connect two databases"
date: "2023-01-12"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/17311199/connecting-to-multiple-databases-in-ruby-on-rails">https://stackoverflow.com/questions/17311199/connecting-to-multiple-databases-in-ruby-on-rails</a></p>

<p>如果多个项目需要使用同样的数据，那么比较方便的方法就是单独创建一个数据库，让其他项目读取。</p>

<p>（1）在项目中使用本项目的数据库，同时使用需要的数据库的数据，修改database.yml</p>

<pre>
<code>development:
  adapter: mysql2
  database: db1_dev
  username: root
  password: xyz
  host: localhost

development_sec:
  adapter: mysql2
  database: db2_dev
  username: root
  password: xyz
  host: localhost

production:
  adapter: mysql2
  database: db1_prod
  username: root
  password: xyz
  host: your-production-ip

production_sec:
  adapter: mysql2
  database: db2_prod
  username: root
  password: xyz
  host: your-production-ip
</code></pre>

<p>（2）然后，需要增加需要的其他数据库的表的model, 例如：</p>

<pre>
<code>class Category &lt; ActiveRecord::Base
  establish_connection &quot;#{Rails.env}_sec&quot;.to_sym
end
</code></pre>

<p><code>（3）如果需要migrate：</code></p>

<pre>
<code>class CreateRewards &lt; ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection(&quot;#{Rails.env}_sec&quot;.to_sym).connection
  end

  def change
    # your code goes here.
  end
end
</code></pre>

<p>&nbsp;</p>

