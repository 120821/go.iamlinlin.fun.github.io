---
layout: post
title: "实现根据关联表children表进行parent表对children数量的统计 更新"
date: "2022-06-21"
categories: 
---
<p>首先，parent表与children表进行model的关联，然后使用parent.children.size 可以查看数量，但是这样不能进行排序，</p>
<p>所以，进行新的列的创建，parent_child_count,进行migrate</p>
<p>在子表的model中，增加子表创建就更新parent表的数量，每创建一个就增加一。</p>
<p>class NftAsset &lt; ApplicationRecord<br />
&nbsp; has_one :avatar<br />
&nbsp; belongs_to :account, optional: true</p>
<p>&nbsp; after_create do |nft_asset|<br />
&nbsp;&nbsp;&nbsp; account = nft_asset.account<br />
&nbsp;&nbsp;&nbsp; account.nft_asset_count += 1<br />
&nbsp;&nbsp;&nbsp; account.save!<br />
&nbsp; end<br />
end</p>
<p>进入irb环境进行测试</p>
<p><img height="701" src="/uploads/ckeditor/pictures/47/image-20220621115105-1.png" width="1920" /></p>
<p>&nbsp;</p>
