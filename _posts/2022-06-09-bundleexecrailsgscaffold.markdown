---
layout: post
title: "bundle exec rails g scaffold 创建数据库数据表"
date: "2022-06-09"
categories: 
---

                    <pre><code>bundle exec rails g scaffold Contract chain_id:integer content:text address:string operator_address:string rpc_server:string</code></pre> 
<p>使用undle exec rails g scaffold命令，脚手架会自动生成routes信息 controller 和model信息。可以直接创建 数据库以及数据表的内容，相关文件会自动生成，使用git status 查看所有改变的文件，就可以看到所有手动添加的文件都已经自动生成了</p> 
<pre><code>git diff 
已经修改的文件修改内容的查看
git status 
查看所有已经修改的文件</code></pre> 
<p>这个rails命令是非常方便，对于不太熟悉项目文件的，可以尝试手动添加，熟悉rails文件的作用以及修改方式，这个命令知道怎么使用就好了，后期可以使用<img alt="" src="https://img-blog.csdnimg.cn/24821a9be542496685e248ae90d76e4f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
<p>git diff可以看到文件进行了哪些修改，使用migrate命令创建数据库，可以看到已经自动创建了，那么删除继续创建，看效果，回滚或者直接删除数据库，如果出现报错，那么可以尝试在sql手动删除，</p> 
<pre><code>bundle exec rake db:drop
整个数据库删除
bundle exec rake db:rollback
数据表回滚</code></pre> 
<p> 然后就可以看到数据库创建成功，启动服务器，在浏览器打开页面，就可以看到效果，使用bootscript进行表格的样式修改<img alt="" height="479" src="https://img-blog.csdnimg.cn/bb79e6fc95104b1f9457b36ddab5c86a.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_14,color_FFFFFF,t_70,g_se,x_16" width="495"></p> 
<p> </p> 
<p> <a href="http://www.chenxm.cc/article/1048.html" title="Ubuntu 18.04 安装 PostgreSQL和简单使用-陈新明博客">Ubuntu 18.04 安装 PostgreSQL和简单使用-陈新明博客</a></p> 
<p></p> 
<p></p>
                
