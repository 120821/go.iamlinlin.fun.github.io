---
layout: post
title: "devise --delete method jQuery-ujs"
date: "2022-06-21"
categories: 
---
<p>参考：https://github.com/heartcombo/devise</p>
<p>使用devise的时候出现了退出功能的报错，参考文件:/workspace/devise_rails/app/assets/javascripts/application.js</p>
<p><img height="359" src="/uploads/ckeditor/pictures/50/image-20220621115751-1.png" width="798" /></p>
<p>在报错页面的路由可以看到，退出使用的是delete方法，行log的查看，发现使用的是get方法，进行rails link_to delete方法书写的查看，并没有错误，那么查看devise必须使用的jQuery ujs,发现使用的时候并没有调用，进行数据的删除，只保留引用的数据，就正常使用了，退出登录，注册均可</p>
<p><img height="370" src="/uploads/ckeditor/pictures/51/image-20220621120421-2.png" width="1140" /></p>
<p><img height="341" src="/uploads/ckeditor/pictures/52/image-20220621120438-3.png" width="374" /></p>
