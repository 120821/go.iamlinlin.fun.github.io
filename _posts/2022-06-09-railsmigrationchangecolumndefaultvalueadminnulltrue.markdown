---
layout: post
title: "rails migration change column default value 把列admin的默认数值null设置为true"
date: "2022-06-09"
categories: 
---

                    <pre><code>bundle exec rails g migration change_column_admin_null_to_true</code></pre> 
<p>文件的名字也可以按照自己喜欢，或者进行多个数据的迁移的话， 可以不按照这个来起名字，换一个更好理解，方便查询的，如果是只修改这一个内容，可以使用。</p> 
<p>把列admin的默认数值null设置为true</p> 
<p>运行命令后打开新的db文件</p> 
<p>进行编辑，增加如下的内容</p> 
<pre><code>change_column :users, :admin, :boolean, :default =&gt; false</code></pre> 
<p>进行迁移</p> 
<p>刷新页面就可以看到默认是选中的，也就是默认是可见的</p> 
<pre><code>bundle exec rake db:migrate</code></pre> 
<p><img alt="" height="251" src="https://img-blog.csdnimg.cn/31297fb79fe043da8abf1450884e125e.png" width="327"></p> 
<p>但是一些数据库，比如 PostgreSQL，不会更新之前创建的行的字段，所以请确保在迁移时手动更新字段。</p> 
<p>可以进入数据库刷新看一下数据库是否发生改变。</p> 
<p><img alt="" height="80" src="https://img-blog.csdnimg.cn/6d01647c239c4193b0cbd8f45a3d1506.png" width="415"></p> 
<p>选择修改的表格，打开菜单，选择最后一个选项，打开列，可以看到最后一列已经显示看默认值是true，进入浏览器页面就可以使用<img alt="" height="344" src="https://img-blog.csdnimg.cn/f4ceea7ac9b94188945ab29b47dd04f4.png" width="889"></p> 
<blockquote> 
 <p> 修改列的默认值</p> 
</blockquote> 
<pre><code class="language-ruby">change_column_null :products, :name, false
change_column_default :products, :approved, from: true, to: false
</code></pre> 
<blockquote> 
 <p>修改列的类型</p> 
</blockquote> 
<pre><code class="language-ruby">change_column :products, :part_number, :text
</code></pre> 
<blockquote> 
 <p>创建时就设置默认值</p> 
</blockquote> 
<pre><code class="language-ruby">create_table :products, options: "ENGINE=BLACKHOLE" do |t|
  t.string :name, null: false
end
</code></pre> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p>
                
