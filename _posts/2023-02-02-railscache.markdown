---
layout: post
title: "rails cache 的使用"
date: "2023-02-02"
categories: 
---
<p>refer： <a href="https://guides.rubyonrails.org/caching_with_rails.html">https://guides.rubyonrails.org/caching_with_rails.html</a></p>

<p>rails.cache 可以把数据进行缓存，在特定时间内不重新查询数据。</p>

<pre>
<code>class Product &lt; ApplicationRecord
  def competing_price
    Rails.cache.fetch(&quot;#{cache_key_with_version}/competing_price&quot;, expires_in: 12.hours) do
      Competitor::API.find_price(id)
    end
  end
end
</code></pre>

<p><code>例如：</code></p>

<pre>
<code># super_admins is an expensive SQL query, so don&#39;t run it too often
Rails.cache.fetch(&quot;super_admin_users&quot;, expires_in: 12.hours) do
  User.super_admins.to_a
end
</code></pre>

<p>也可以这样定义：</p>

<pre>
<code># super_admins is an expensive SQL query, so don&#39;t run it too often
ids = Rails.cache.fetch(&quot;super_admin_user_ids&quot;, expires_in: 12.hours) do
  User.super_admins.pluck(:id)
end
User.where(id: ids).to_a
</code></pre>

