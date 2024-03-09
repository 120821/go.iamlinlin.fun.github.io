---
layout: post
title: "Rails & Postgres: Migration to change_colomn gives error “cannot be cast to type timestamp without t"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p><span style="color:#fe2c24;">Rails &amp; Postgres: Migration to change_colomn gives error "cannot be cast to type timestamp without time zone"</span></p> 
</blockquote> 
<blockquote> 
 <p>Rails 和 Postgres：迁移到 change_colomn 时出现错误“无法强制转换为没有时区的时间戳”</p> 
 <pre><code>class ChangeStatusUpdatedAtToDateTime &lt; ActiveRecord::Migration
  def up
    remove_column :bookings, :status_updated_at
    add_column :bookings, :status_updated_at, :datetime
  end

  def down
    remove_column :bookings, :status_updated_at
    add_column :bookings, :status_updated_at, :time
  end
end</code></pre> 
</blockquote> 
<p>此时必须把列进行删除，重新创建才可以，然后注意抓取数据的时候，需要把数据的类型左右一致， blog.published_at = Time.at remote['published_at']</p> 
<p>这样远程的一串数字才会以时间的形式保存在本地的数据库</p> 
<p>此时保存的数据会出现UTC ，目前还不知道怎么解决</p> 
<p>远程抓数据的时候，如果没有api key，记得把数据的请求头和其他数据增加进请求，否则可能会被网站封掉。找数据的时候，可以进行筛选，只选择xhr类型，然后只需要截取请求头就可以了，请求头注意筛选200的，304不要选用，有一些数据有可能会导致数据无法获取，那就试着注释掉，然后就可以了。<img alt="" height="162" src="https://img-blog.csdnimg.cn/d47c76adeed94abb891b7772799c9fc4.png" width="1200"></p> 
<p>记得筛选xhr，不然网络数据会特别的多 。请求数据不需要<img alt="" height="376" src="https://img-blog.csdnimg.cn/51a440da698b4c6db8540a92d97b29eb.png" width="710"></p> 
<p> </p> 
<p></p>
                
