---
layout: post
title: "＜ActiveRecord::Relation 删除全部（一条记录/实例） production 和development 日志的区分"
date: "2022-06-09"
categories: 
---

                    <p><img alt="" height="103" src="https://img-blog.csdnimg.cn/a971e8ec225a45c3af6c467f14d74995.png" width="470"></p> 
<h3 id="method-i-delete_all">
<strong>删除全部 </strong>（） <a class="permalink" href="#method-i-delete_all">关联 </a>、</h3> 
<h3><a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html" title="ActiveRecord::Relation">ActiveRecord::Relation</a></h3> 
<div> 
 <p>删除记录而不首先实例化记录，因此不调用 <a href="https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-destroy" title="#destroy ">#destroy </a>方法或调用回调。 这是一条直接进入数据库的 SQL DELETE 语句，比 <a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-destroy_all" title="destroy_all">destroy_all</a>. 但要小心关系，特别是 <code>:dependent</code>不遵守在关联上定义的规则。 返回受影响的行数。</p> 
 <pre><code class="language-css">
<code>Post.where(person_id: 5).where(category: ['Something', 'Else']).delete_all
</code></code></pre> 
 <p>两个调用都使用一条 DELETE 语句一次性删除所有受影响的帖子。 如果您需要销毁依赖关联或致电您的 <code>before_*</code>或者 <code>after_destroy</code>回调，使用 <a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-destroy_all" title="destroy_all">destroy_all</a>代替方法。</p> 
 <p>如果提供了无效的方法， <a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-delete_all" title="delete_all">delete_all</a>引发 ActiveRecordError：</p> 
 <pre><code class="language-ruby">
<code>Post.distinct.delete_all
# =&gt; ActiveRecord::ActiveRecordError: delete_all doesn't support distinct
</code></code></pre> 
</div> 
<h3>
<strong>delete_all</strong>() <a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-delete_all" title="Link">Link</a>
</h3> 
<p>Deletes the records without instantiating the records first, and hence not calling the <a href="https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-destroy" title="#destroy">#destroy</a> method nor invoking callbacks. This is a single SQL DELETE statement that goes straight to the database, much more efficient than <a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-destroy_all" title="destroy_all">destroy_all</a>. Be careful with relations though, in particular <code>:dependent</code> rules defined on associations are not honored. Returns the number of rows affected.</p> 
<pre><code>Post.where(person_id: 5).where(category: ['Something', 'Else']).delete_all
</code></pre> 
<p>Both calls delete the affected posts all at once with a single DELETE statement. If you need to destroy dependent associations or call your <code>before_*</code> or <code>after_destroy</code> callbacks, use the <a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-destroy_all" title="destroy_all">destroy_all</a> method instead.</p> 
<p>If an invalid method is supplied, <a href="https://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-delete_all" title="delete_all">delete_all</a> raises an ActiveRecordError:</p> 
<pre><code>Post.distinct.delete_all
# =&gt; ActiveRecord::ActiveRecordError: delete_all doesn't support distinct
</code></pre> 
<p>Source: <a id="l_method-i-delete_all_source">show</a> | <a href="https://github.com/rails/rails/blob/3872bc0e54d32e8bf3a6299b0bfe173d94b072fc/activerecord/lib/active_record/relation.rb#L601" title="on GitHub">on GitHub</a></p> 
<p> <img alt="" height="145" src="https://img-blog.csdnimg.cn/768b149720ee46b6869cdff744b0ffbe.png" width="908"></p> 
<p> <a class="has-card" href="https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby" title="How To Use IRB to Explore Ruby  | DigitalOcean"><span class="link-card-box"><span class="link-title">How To Use IRB to Explore Ruby | DigitalOcean</span><span class="link-link"><img alt="" class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.1.3/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M4AD">https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby</span></span></a>irb 的使用</p> 
<p>是通用的ruby环境</p> 
<p><img alt="" height="381" src="https://img-blog.csdnimg.cn/e3e1f86f19994e948726b9af651ee14f.png" width="1200"></p>
                
