---
layout: post
title: "rails --show params "
date: "2022-06-15"
categories: 
---
<p>在controller 文件中，调用其他model的数据，首先需要定义参数，根据id来查询，contract 的id ，打印数据，看是否是需要的数据<br />
&nbsp; def show<br />
&nbsp;&nbsp;&nbsp; @contract = Contract.find(params[:id])<br />
&nbsp;&nbsp;&nbsp; Rails.logger.info &quot;==@contract :====#{@contract.inspect}&quot;<br />
&nbsp; end</p>

<p><img height="144" src="/uploads/ckeditor/pictures/33/image-20220615141039-1.png" width="706" /></p>

<p>然后进行id参数的转换，</p>

<p>&nbsp;def to_params<br />
&nbsp;&nbsp;&nbsp; &quot;#{id}-#{Contract.name}&quot;<br />
&nbsp; end</p>

<p><img height="72" src="/uploads/ckeditor/pictures/36/image-20220615141655-4.png" width="564" /></p>

<p>在浏览器进行数据的获取，在index页面点击某个合同，看数据是否正确</p>

<p><img height="964" src="/uploads/ckeditor/pictures/34/image-20220615141507-2.png" width="1102" /></p>

<p>进入后台看是否进入详情页面，数据正确。<img height="798" src="/uploads/ckeditor/pictures/35/image-20220615141532-3.png" width="1920" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

