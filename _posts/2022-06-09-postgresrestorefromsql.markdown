---
layout: post
title: "导入文件 postgres restore from sql"
date: "2022-06-09"
categories: 
---
<p>首先把lueluelue.sql 文件下载至本地，确定本地存在的sql用户名 和下载好了的lueluelue.sql文件的地址，根据以下命令进行执行</p>

<pre>
<code>psql -U username -f backupfile.sql</code></pre>

<p>&nbsp;遇到报错的话 <span style="color:#fe2c24">psql: FATAL:&nbsp; database &quot;admin&quot; does not exist</span></p>

<p><span style="color:#0d0016">但是database.yml文件确实存在用户和密码，命令行也存在用户<img alt="" src="https://img-blog.csdnimg.cn/5b4e6d95420f42f9b4b23c4dea4bfb89.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" /></span></p>

<p><span style="color:#0d0016">那么使用图中的命令进行导入</span></p>

<pre>
<code>psql -U username postgres
进入数据库
\c databasename
进入数据库执行命令
sour
退出，进入项目文件加命令行
q
导入文件
psql -U username -d databasename -f fileaddress/filename</code></pre>

<p><img alt="" src="https://img-blog.csdnimg.cn/542d0597d2984f7dbc7f1588e9bba5fc.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" /></p>

<p>如果数据库的端口不能链接 进行数据库查看是否运行 看ruby环境 rails webpage是否运行 进行配置安装</p>

<blockquote>
<p>rails -T 查看所有的命令&nbsp;&nbsp;</p>

<p>修改 .tool-versions 增加需要的环境版本</p>

<p>webpager:install&nbsp; 安装 并设置端口号码 -p 3030<img alt="" src="https://img-blog.csdnimg.cn/3fb490dde7624d5e9d50dc4ae076e6d2.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" /></p>
</blockquote>

<blockquote>
<p>&nbsp;Ctrl l 查看文件的完整地址</p>

<p>Ctrl a 全选</p>

<p>内容看不太懂就去搜一下相关的内容 <a href="http://www.siwei.me/blog/posts/postgres-postgres" title="postgres - 安装和配置postgres, 以及基本的使用 - 申思维的技术站点-ruby/rails/titanium/敏捷方法论/测试驱动/自动化/全栈攻城狮/jquery/极客/直男">postgres - 安装和配置postgres, 以及基本的使用 - 申思维的技术站点-ruby/rails/titanium/敏捷方法论/测试驱动/自动化/全栈攻城狮/jquery/极客/直男</a><a href="http://siwei.me/blog/posts/postgres-pg_dump" title="postgres - pg_dump 备份的方法、注意点  - 申思维的技术站点-ruby/rails/titanium/敏捷方法论/测试驱动/自动化/全栈攻城狮/jquery/极客/直男">postgres - pg_dump 备份的方法、注意点 - 申思维的技术站点-ruby/rails/titanium/敏捷方法论/测试驱动/自动化/全栈攻城狮/jquery/极客/直男</a></p>
</blockquote>

<blockquote>
<h3>基本用法 命令行：</h3>

<p>$ sudo -u postgres -i</p>

<p># psql</p>

<p>\l 查看数据库</p>

<p>\dt 查看表</p>

<p>\c 进入到数据库</p>

<p>创建数据库： $ create database my_cv;</p>

<p>\c &lt;your database&gt;</p>

<p>授权：grant all privileges on all tables in schema public to myroot;&nbsp; &nbsp; # schema 就是数据库, myroot就是用户名</p>

<p>&nbsp;</p>
</blockquote>

