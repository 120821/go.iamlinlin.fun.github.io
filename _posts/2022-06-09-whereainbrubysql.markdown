---
layout: post
title: "where ... a in b... ruby sql"
date: "2022-06-09"
categories: 
---

                    <pre><code class="language-ruby">User.where({ name: ["Alice", "Bob"]})
# SELECT * FROM users WHERE name IN ('Alice', 'Bob')</code></pre> 
<blockquote> 
 <p><a class="has-card" href="https://guides.rubyonrails.org/v6.1/active_record_querying.html" title="Active Record Query Interface — Ruby on Rails Guides"><span class="link-card-box"><span class="link-title">Active Record Query Interface — Ruby on Rails Guides</span><span class="link-link"><img class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.1.3/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M4AD" alt="icon-default.png?t=M4AD">https://guides.rubyonrails.org/v6.1/active_record_querying.html</span></span></a><a class="has-card" href="https://api.rubyonrails.org/v6.1.5.1/classes/ActiveRecord/QueryMethods.html#method-i-where" title="ActiveRecord::QueryMethods"><span class="link-card-box"><span class="link-title">ActiveRecord::QueryMethods</span><span class="link-link"><img class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.1.3/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M4AD" alt="icon-default.png?t=M4AD">https://api.rubyonrails.org/v6.1.5.1/classes/ActiveRecord/QueryMethods.html#method-i-where</span></span></a></p> 
 <p>查询name在Alice和bob中的user，使用以上数据即可查询，</p> 
 <p>同理，查询id被删除的，就可以直接使用</p> 
 <p>Account.where(id: id_delete)</p> 
 <p>此时，id_delete 已经是一个数组，就不要写【】</p> 
 <p>一般情况下使用where语句，前面的元素需要大写，因为是一个class，对应的是model的class，小写的account = Account.where...</p> 
 <p>此时的account是一条记录，是Account的一个实例。</p> 
</blockquote> 
<p>在irb使用可以这样，进行查询，支持一条或者多条数据查询</p> 
<p>User.where('name = ?', user.name)</p> 
<p>User.where('name = ? and email = ?', user.name, user.email)</p> 
<pre><code>irb&gt; customer = Customer.find(10)
=&gt; #&lt;Customer id: 10, first_name: "Ryan"&gt;

# Find the customers with primary keys 1 and 10.
irb&gt; customers = Customer.find([1, 10]) # OR Customer.find(1, 10)
=&gt; [#&lt;Customer id: 1, first_name: "Lifo"&gt;, #&lt;Customer id: 10, first_name: "Ryan"&gt;]

</code></pre>
                
