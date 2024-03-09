---
layout: post
title: "rails fast_page "
date: "2023-04-11"
categories: 
---
<p>refer: <a href="https://github.com/planetscale/fast_page">https://github.com/planetscale/fast_page</a></p>

<p>1.Gemfile文件中增加：</p>

<pre>
<code>gem &#39;fast_page&#39;</code></pre>

<pre>
<code>bundle install</code></pre>

<p>2.使用示例：</p>

<p>（1）使用limit and offset</p>

<pre>
<code>Post.all.order(created_at: :desc).limit(25).offset(100)

# Post Load (1228.7ms)&nbsp; SELECT `posts`.* FROM `posts` ORDER BY `posts`.`created_at` DESC LIMIT 25 OFFSET 100</code></pre>

<p>使用fast_page进行提升：</p>

<pre>
<code>Post.all.order(created_at: :desc).limit(25).offset(100).fast_page

# Post Pluck (456.9ms)&nbsp; SELECT `posts`.`id` FROM `posts` ORDER BY `posts`.`created_at` DESC LIMIT 25 OFFSET 100

# Post Load (0.4ms)&nbsp; SELECT `posts`.* FROM `posts` WHERE `posts`.`id` IN (1271528, 1271527, 1271526, 1271525, 1271524, 1271523, 1271522, 1271521, 1271520, 1271519, 1271518, 1271517, 1271516, 1271515, 1271514, 1271512, 1271513, 1271511, 1271510, 1271509, 1271508, 1271507, 1271506, 1271505, 1271504) ORDER BY `posts`.`created_at` DESC</code></pre>

<p>（2）基于Kaminari，使用page（） and per（）</p>

<pre>
<code>AuditLogEvent.page(num).per(100).where(owner: org).order(created_at: :desc)</code></pre>

<p>使用fast_page进行提升：</p>

<pre>
<code>Post.all.page(5).per(25).fast_page</code></pre>

<p>（3）基于pagy</p>

<pre>
<code>def pagy_get_items(collection, pagy)

&nbsp; collection.offset(pagy.offset).limit(pagy.items).fast_page

end</code></pre>

<p>&nbsp;</p>

