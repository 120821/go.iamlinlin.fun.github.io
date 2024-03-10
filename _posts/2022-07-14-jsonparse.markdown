---
layout: post
title: "json.parse"
date: "2022-07-14"
categories: 
---
<p>&nbsp;</p>
<p>&nbsp;def create<br />
&nbsp;&nbsp;&nbsp; @contract = Contract.new(contract_params)</p>
<p>&nbsp;&nbsp;&nbsp; require &#39;json&#39;<br />
&nbsp;&nbsp;&nbsp; @contract.save!<br />
&nbsp;&nbsp;&nbsp; JSON.parse(params[:whitelist]).each do |address|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NftOwner.create auth_type: &#39;address&#39;, auth_value: address, contract_id: @contract.id, manager: current_manager.email<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; redirect_to @contract, notice: &#39;操作成功&#39;<br />
&nbsp; end</p>
<p>使用双引号在placeholder，需要进行外层的单引号进行调用内层的双引号</p>
<p>&nbsp;&lt;td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= text_area_tag :whitelist, &#39;&#39;, placeholder: &#39;仅支持钱包地址。例如：[&quot;0xDC351d1&quot;, &quot;0x6De3fB4Ed1&quot;, &quot;0x6De3fB1&quot;] 出现3次，就表示 往 nft_owners 表中增加3条记录。]&#39;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; class: &#39;form-control&#39;, style: &#39;hight: 100px;!important&#39; %&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/td&gt;</p>
<p>&nbsp;</p>
