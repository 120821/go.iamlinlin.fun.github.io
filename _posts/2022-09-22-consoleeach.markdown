---
layout: post
title: "console each 批量修改数据内容"
date: "2022-09-22"
categories: 
---
<p>bundle exec rails console</p>

<p>使用循环进行数据的批量修改</p>

<p>a = Nft.where(&#39;contract_id = ? and nft_id &lt; ?&#39;, 7, 13)</p>

<p>a.size</p>

<p>a.each{ |e| e.is_claimed = true; e.save! }</p>

<p><img height="284" src="/uploads/ckeditor/pictures/463/image-20220922114504-1.png" width="876" /></p>

<p>同时注意first的使用，例如查询nft_id为13，contract的id为7的nft，</p>

<p>错误写法:&nbsp;&nbsp; a = Nft.where(&#39;nft_id = ?, contract_id = ?&#39;, 13, 7)</p>

<p>注意这里是错误的，需要增加.first才是一条数据，不然就是一个relation，无法进行数据的修改</p>

<p>a = Nft.where(&#39;nft_id = ?, contract_id = ?&#39;, 13, 7).first</p>

