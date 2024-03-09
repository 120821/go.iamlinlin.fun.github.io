---
layout: post
title: "undefined method `contract_id' for #<Nft id: nil"
date: "2022-06-10"
categories: 
---
<p>根据创建好的关联关系进行表单的更新，创建关联的选择框，</p>

<p>&lt;td&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;%= form.select &quot;contract_id&quot;, options_from_collection_for_select(Contract.all, :id, :name) %&gt;</p>

<p>&lt;/td&gt;</p>

<p>在创建关联关系，并且根据关联关系进行新建的时候，如果在新建页面出现报错，在rails c可以进行新建，在浏览器对于rails c新建的内容可以进行编辑。那么请重启服务器。</p>

<pre>
<code>undefined method `contract_id&#39; for #&lt;Nft id: nil{% endhighlight %}

<pre>
<img height="560" src="/uploads/ckeditor/pictures/4/image-20220610163119-3.png" width="1858" />
</pre>

<p>根据报错的提示，image等列已经不存在，那么进行服务器的重启，刷新，就可以看到新建和编辑都可以使用。</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

