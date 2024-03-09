---
layout: post
title: "postgres 修改 index 的类型为hash"
date: "2022-10-10"
categories: 
---
<p>参考：<a href="https://www.postgresql.org/docs/current/indexes-types.html">https://www.postgresql.org/docs/current/indexes-types.html</a></p>

<p>参考：<a href="https://apidock.com/rails/v5.2.3/ActiveRecord/ConnectionAdapters/SchemaStatements/add_index">https://apidock.com/rails/v5.2.3/ActiveRecord/ConnectionAdapters/SchemaStatements/add_index</a></p>

<p>使用migrate进行修改：</p>

<pre>
<code>cat db/migrate/20221009081118_change_index_type_for_udts.rb

class ChangeIndexTypeForUdts &lt; ActiveRecord::Migration[6.1]

&nbsp; def self.up

&nbsp;&nbsp;&nbsp; remove_index :udts, name: &quot;index_udts_on_type_hash&quot;

&nbsp;&nbsp;&nbsp; add_index :udts, :type_hash, using: &#39;hash&#39;

&nbsp; end

&nbsp; def self.down

&nbsp;&nbsp;&nbsp; remove_index :udts, name: &quot;index_udts_on_type_hash&quot;

&nbsp;&nbsp;&nbsp; add_index :udts, :type_hash

&nbsp; end

end{% endhighlight %}

<p>运行bundle exec rake db:migrate</p>

<p>或者bundle exec rake db:rollback</p>

<p>可以进行创建，或者回退</p>

<p>只可以修改单个的index 为hash，混合列不可以</p>

{% highlight %}(access method &quot;hash&quot; does not support multicolumn indexes){% endhighlight %}

