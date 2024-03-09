---
layout: post
title: "rails--textarea placeholder的使用 区别与HTML textarea"
date: "2022-07-14"
categories: 
---
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;!-- TODO 使用railstag, 不能用html tag , 该text area仅仅存在于 new 页面中就好了，edit 页面不需要--&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;textarea name=&quot;auth_value&quot; placeholder=&quot;仅支持钱包地址，多个地址用回车来分割。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 例如：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6De3fB47EDd3b692024dbxxxxxA07C5DC351d1<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00x6De3fB47EDd3b692024dbxxxxxA07C5DC351d1<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 000x6De3fB47EDd3b692024dbxxxxxA07C5DC351d1<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 出现3次，就表示 往 nft_owners 表中增加3条记录。 &quot; class=&quot;form-control&quot;&gt;&lt;/textarea&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= text_area_tag :whitelist, &#39;&#39;, placeholder: &quot;asdkfksjfsdjf<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; askdfkjjsjfjd<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asdkfkjsdjf&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; class: &#39;form-control&#39; %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/td&gt;<img height="178" src="/uploads/ckeditor/pictures/94/image-20220714094004-1.png" width="1294" /></p>

<p>然后进行高度的调试</p>

<p>&nbsp;def create<br />
&nbsp;&nbsp;&nbsp; @contract = Contract.new(contract_params)<br />
&nbsp;&nbsp;&nbsp; temp = params[:whitelist]<br />
&nbsp;&nbsp;&nbsp; temp1 = temp.split(&quot; &quot;)</p>

<p>&nbsp;&nbsp;&nbsp; @contract.save!<br />
&nbsp;&nbsp;&nbsp; temp1.each do |auth_value|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nft_owner = NftOwner.new<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nft_owner.auth_type = &#39;address&#39;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nft_owner.auth_value= auth_value<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nft_owner.contract_id = @contract.id<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nft_owner.manager = current_manager.email<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nft_owner.save!<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; redirect_to @contract, notice: &#39;操作成功&#39;<br />
&nbsp; end</p>

<p>&nbsp;</p>

