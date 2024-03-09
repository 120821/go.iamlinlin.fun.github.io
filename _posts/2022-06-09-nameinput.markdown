---
layout: post
title: "name对于input标签的意义·"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>name属性可能是&lt;input&gt;元素最重要的属性。它不是验证的严格要求，但永远不应该忽略它。当表单提交到服务器时，表单中的数据将包含在HTTP请求中。数据打包为一系列名称-值对。每个名称-值对的名称是每个输入的名称属性，值是用户输入（或预先指定）的值。如果没有name属性，&lt;input&gt;元素无法在表单提交时向服务器提供其值。</p> 
 <p>作用：指定输入元素的名称。提交表单时，每个输入元素的名称和值都包含在HTTP请求中。</p> 
</blockquote> 
{% highlight %}<code class="language-html">&lt;%= form_for @domain do |f| %&gt;
  4 
  5   &lt;form action="/domains" method="POST"&gt;
  6     name&lt;input type="text" name="domain[name]" value=""&gt;&lt;br/&gt;
  7     address&lt;input type="text" name="domain[address]" value=""&gt;&lt;br/&gt;
  8     strstegy&lt;input type="text" name="domain[duration_strategy]" value=""&gt;&lt;br/&gt;
  9     &lt;input type="submit" value="Create Domain"&gt;
 10   &lt;/form&gt;
 11   
 12 &lt;% end %&gt;
{% endhighlight %} 
<p>name属性的值如何来命名，取决于你在填写文本框的时候里面所填内容或数据的类型，也就是说你会将你所填的信息分为哪一类，如果你填的是用户名，那么name属性的值你可以设置为name=“username” 如果你填的信息是密码，那么name属性的值你可以设置为name=“password” 如果填的是性别，那么name属性的值则可以设为name="sex"或者设为gender<img alt="" src="https://img-blog.csdnimg.cn/f3dfecfeab64473fb87d9730f9fecc16.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p>那么，对于一个数据表来说，想要引用数据或者新建保存数据或者编辑数据，需要对于表进行更新，在代码中就不能直接书写name = "name" 二是书写name = "项目名[name]",这样书写，浏览器才能识别出来，如果按照第一种书写方式就会报错。<img alt="" src="https://img-blog.csdnimg.cn/850c6e130bed465db2cfd1d623be503a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p> 然后根据提示修改，在controller文件和view文件进行统一，看一下哪些数据是数据表不存在的，进行整理。</p> 
<p></p>
                
