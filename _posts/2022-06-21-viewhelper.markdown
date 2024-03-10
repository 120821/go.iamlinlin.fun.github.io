---
layout: post
title: "实现view 的helper方法"
date: "2022-06-21"
categories: 
---
<p>明确：ruby中的字符取法，进入irb环境</p>
<p><img height="98" src="/uploads/ckeditor/pictures/45/image-20220621112919-1.png" width="669" /></p>
<p>在文件中增加：app/helpers/application_helper.rb</p>
<p>module ApplicationHelper<br />
&nbsp; def show_address origin_string<br />
&nbsp;&nbsp;&nbsp; part_1 = origin_string[0,8]<br />
&nbsp;&nbsp;&nbsp; part_2 = origin_string[origin_string.size - 4, origin_string.size]<br />
&nbsp;&nbsp;&nbsp; return &quot;#{part_1}...#{part_2}&quot;<br />
&nbsp; end<br />
end</p>
<p>在页面调用：show</p>
<p>&lt;span&gt;&lt;%= show_address @contract.address&nbsp; %&gt;&lt;/span&gt;</p>
<p>进入浏览器</p>
<p><img height="69" src="/uploads/ckeditor/pictures/46/image-20220621113019-2.png" width="450" /></p>
