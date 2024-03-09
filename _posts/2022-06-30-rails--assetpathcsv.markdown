---
layout: post
title: "rails --使用asset_path进行示例文件 CSV的下载"
date: "2022-06-30"
categories: 
---
<p>首先把示例文件从阿里云拿出了，放在项目文件夹app/asset/images目录下，任app/asset/目录下任意一个位置都可以，因为读取的时候，是在整个asset目录下逐一读取的，</p>

<p>然后在视图页面进行调用</p>

<p>点击下载：&lt;a href=&quot;&lt;%= asset_path &#39;blog_upload_csv_example.csv&#39; %&gt;&quot;&gt;博客上传csv示例&lt;/a&gt;</p>

<p>然后在视图页面进行点击，就有和阿里云一样的下载效果</p>

<p><img height="51" src="/uploads/ckeditor/pictures/84/image-20220630105434-2.png" width="747" /></p>

<p>只不过会出现一些asset的编译，文件名会发生变化。</p>

