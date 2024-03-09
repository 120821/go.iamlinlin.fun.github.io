---
layout: post
title: "注意controller的内容要规范"
date: "2022-06-27"
categories: 
---
<p>&lt;p&gt;创建该Contract的组织名称: &lt;%= contract.contract_creator.try(:name) %&gt;&lt;/p&gt;</p>

<p>使用.try 方法，进行数据不存在的挽救，不然在一个新的环境运行，可能会出现大量的报错。</p>

<p>def index<br />
-&nbsp;&nbsp;&nbsp; @contract = Contract<br />
+&nbsp;&nbsp;&nbsp; @contract = Contract.all<br />
&nbsp;&nbsp; end</p>

<p>首先，@contract不能直接等于model，起码要加上.all</p>

<p>&nbsp;def my_collections<br />
-&nbsp;&nbsp;&nbsp; @account = Account.where(&#39;address = ?&#39;, params[:address])<br />
-&nbsp;&nbsp;&nbsp; Rails.logger.info @account.inspect<br />
-&nbsp;&nbsp;&nbsp; @nfts = Nft.where(&#39;account_id = ?&#39;, @account.ids)<br />
-&nbsp;&nbsp;&nbsp; Rails.logger.info @nfts.inspect<br />
+&nbsp;&nbsp;&nbsp; @account = Account.where(&#39;address = ?&#39;, params[:address]).first<br />
+&nbsp;&nbsp;&nbsp; @nfts = Nft.where(&#39;account_id = ?&#39;, @account.id)<br />
&nbsp;&nbsp; end</p>

<p>然后明确，@account是做什么的 ，是一个数组还是元素，那么进行取用，获取一个元素的话，就是用first，同时需要注意是需要一个id还是全部的id</p>

<p>&nbsp;</p>

