---
layout: post
title: "how to submit hash object form in rails"
date: "2022-06-09"
categories: 
---

                    <p>Rails形成标签和强参数<br> 因为我们没有创建一条记录，所以我们必须构建一个表单标签来提交数据。为了使用带有强参数的 form_tag标记，在编写表单代码时必须手动定义HTML&lt;input&gt;名称。因此，如果我们提交一张带有图像和描述属性的照片，它看起来会像这样：</p> 
<pre><code>&lt;%= file_field_tag "photo[image]" %&gt;
&lt;%= text_field_tag "photo[description]" %&gt;</code></pre> 
<p>简化一下是这样</p> 
<pre><code>&lt;input type="file" name="photo[image]"&gt;
&lt;input type="text" name="photo[description]"&gt;</code></pre> 
<p>这样才会是一个hash</p> 
<pre><code>{
  photo: {
    image: File,
    description: ""
  }
}</code></pre> 
<p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/69c83cb6ab9c4d67bbb4c3ef42d0d943.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16">对应的controller</p> 
<p> </p> 
<pre><code>def photo_params
  params.require(:photo).permit(:image, :description)
end</code></pre> 
<p>That’s right, an HTML <code>&lt;input&gt;</code> with the name <code>a[b][]c[d]</code> creates parameters structured like <code>{ a: { b: [ c: { d } ] } }</code>.</p> 
<p></p>
                
