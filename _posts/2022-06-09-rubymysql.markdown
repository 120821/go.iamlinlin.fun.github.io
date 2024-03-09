---
layout: post
title: "设置域名 部署 安装ruby MySQL 启动"
date: "2022-06-09"
categories: 
---

                    <p><strong>设置域名</strong></p> 
<p>首先查看服务器的公有地址，复制一下</p> 
<p>然后打开域名，进行解析，添加记录</p> 
<p><img alt="" height="68" src="https://img-blog.csdnimg.cn/edd32e0db1e743dd80977c98f8092cc8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1004"><img alt="" height="573" src="https://img-blog.csdnimg.cn/59c283808f5147868a6a75af0b9d2524.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="743"></p> 
<p style="text-align:center;"><img alt="" height="288" src="https://img-blog.csdnimg.cn/9defd0332e8c4c0ebd1d9788ed34909f.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
<p></p> 
<p><img alt="" height="605" src="https://img-blog.csdnimg.cn/8172929ce74349288d32430fe600d232.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200">在云服务页面会看到部署开发环境，点击就是一个教程，根据教程即可实现部署，点击自己的实例，可以看到具体的内容。在实例页面，点击右边的更多，进行密码秘钥的重置<img alt="" height="309" src="https://img-blog.csdnimg.cn/cf3272e63ae9424c87e8c9e99a22ea35.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_15,color_FFFFFF,t_70,g_se,x_16" width="557"><img alt="" height="132" src="https://img-blog.csdnimg.cn/5c0375425a3748d19dc0a788080ad2c1.png" width="214"></p> 
<blockquote> 
 <p> 在新做的Linux系统上<strong>安装第三方包</strong>(install libs on bare linux)</p> 
 <p>最新的ubuntu18 下，要保证 software -&gt; updates -&gt; important security update 和 recommended security update 是开启的，否则会出现部分lib 无法安装的情况，</p> 
 <pre><code class="language-ruby">sudo apt-get install libapr1-dev libxml2-dev libxslt1-dev libmysqlclient-dev git curl build-essential libssl-dev libreadline-dev build-essential libssl-dev libreadline-dev vim libcurl4 ruby-dev zlib1g-dev liblzma-dev ruby-all-dev</code></pre> 
 <p>如果安装过程出现报错  <span style="color:#fe2c24;">ExecJS::RuntimeUnavailable: Could not find a JavaScript runtime</span></p> 
 <p>需要运行</p> 
 <pre><code>sudo apt-get install nodejs</code></pre> 
 <p><span style="color:#fe2c24;">​   An error occurred while installing pg (0.18.4), and Bundler cannot continue</span></p> 
 <p>需要运行</p> 
 <pre><code>sudo apt-get install libpq-dev</code></pre> 
</blockquote> 
<blockquote> 
 <p><strong>rails textarea</strong></p> 
 <pre><code>&lt;%= text_area_tag(:ad, :text, size: '50x10') %&gt;</code></pre> 
 <pre><code>&lt;%= f.text_area(:text, size: '50x10') %&gt;</code></pre> 
 <p>要在网站上开始使用CKEditor 4，请在HTML页面中添加一个&lt;script&gt;标记：</p> 
 <p>&lt;script src="//cdn.ckeditor.com/4.18.0/standard/ckeditor.js"&gt;&lt;/script&gt;<img alt="" height="226" src="https://img-blog.csdnimg.cn/5c5194e066584fd6bcb6c1c0f7b9ae6d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1050"></p> 
 <p>快速示例</p> 
 <pre><code class="language-html">&lt;html&gt;
        &lt;head&gt;
                &lt;meta charset="utf-8"&gt;
                &lt;title&gt;CKEditor&lt;/title&gt;
                &lt;script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"&gt;&lt;/script&gt;
        &lt;/head&gt;
        &lt;body&gt;
                &lt;textarea name="editor1"&gt;&lt;/textarea&gt;
                &lt;script&gt;
                        CKEDITOR.replace( 'editor1' );
                &lt;/script&gt;
        &lt;/body&gt;
&lt;/html&gt;</code></pre> 
 <p style="text-align:center;"><img alt="" src="https://img-blog.csdnimg.cn/71db9291b1264b5c8318246b7a67511d.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16"></p> 
 <p><strong>method  text_area</strong></p> 
 <p><img alt="" height="138" src="https://img-blog.csdnimg.cn/6840f6944fa14c5fba169b66e18d6a0b.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_16,color_FFFFFF,t_70,g_se,x_16" width="579"></p> 
 <p> </p> 
</blockquote> 
<blockquote> 
 <p><strong>ssh key生成</strong></p> 
 <p>默认情况下，用户的 SSH 密钥存储在其 <code>~/.ssh</code> 目录下。 进入该目录并列出其中内容，你便可以快速确认自己是否已拥有密钥：</p> 
 <pre><code>$ cd ~/.ssh
$ ls
authorized_keys2  id_dsa       known_hosts
config            id_dsa.pub</code></pre> 
</blockquote> 
<blockquote> 
 <h3>psql 基本用法     命令行：</h3> 
 <p>$ sudo -u postgres -i</p> 
 <p># psql</p> 
 <p>\l  查看数据库</p> 
 <p>\dt  查看表</p> 
 <p>\c 进入到数据库</p> 
 <p>创建数据库： $ create database my_cv;</p> 
 <p>\c &lt;your database&gt;</p> 
 <p>授权：grant all privileges on all tables in schema public to myroot;    # schema 就是数据库, myroot就是用户名<img alt="" height="195" src="https://img-blog.csdnimg.cn/d2d0c145a41c4f509f270928f261bc70.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="752"></p> 
 <h3>修改数据库：</h3> 
 <p>alter database my_new_db owner to my_new_user;</p> 
 <p>ubuntu下的默认安装路径</p> 
 <p>/etc/postgresql/12/main</p> 
 <p>配置文件也在这里</p> 
 <p>默认的schema是public . （可以从postgreslql.conf 中看到）</p> 
 <h3>命令行的方式：启动多个postgres实例</h3> 
 <p>1. 安装 asdf，通过asdf安装多个postgres</p> 
 <p>2. 在不同目录下，就可以设置不通的默认postgres, 也可以通过asdf local postgres 9.5   来实现</p> 
 <p>pg_ctl start 可以启动“当前文件夹默认的”db</p> 
 <p>pg_ctl -o "-p 5433" start  可以把当前的 postgres版本以5433 来启动</p> 
 <p>所有的命令： pg_restore, pg_ctl, pg_dump 等，都可以通过输入 --version来查看对应的pg版本</p> 
 <h3>修改配置文件的方式 启动多个postgre实例</h3> 
 <p>修改 postgres~/.asdf/installs/postgres/9.5.25/data/postgresql.conf</p> 
 <p>port = 5433</p> 
 <p>port = 5432</p> 
 <h3>进入到命令行</h3> 
 <p><strong>sudo -u postgres -i   </strong>进入到命令行模式然后ctrl + d，回到 linux本来的ssh账户下。</p> 
 <p>创建一个super user: </p> 
 <p>createuser --interactive -P</p> 
 <p>输入用户名，密码后，直接选择 superuser</p> 
 <p> </p> 
 <h2>psql</h2> 
 <p>psql — PostgreSQL interactive terminal</p> 
 <h2>Synopsis</h2> 
 <p id="id-1.9.4.20.4.1"><code>psql</code> [<em><code>option</code></em>...] [<em><code>dbname</code></em> [<em><code>username</code></em>]]</p> 
 <p><span style="color:#fe2c24;">psql: FATAL:  Peer authentication failed for user</span></p> 
</blockquote> 
<blockquote> 
 <h1>linux - 让SSH保持不断线（自动重连）</h1> 
 <p>vim /etc/ssh/ssh_config</p> 
 <p>增加下面2行</p> 
 <p>ServerAliveInterval 10<br> ServerAliveCountMax 999</p> 
</blockquote> 
<p></p> 
<p></p> 
<p></p>
                
