---
layout: post
title: "PostgreSQL无法创建用户"
date: "2022-06-09"
categories: 
---

                    <p>搜索是否安装完毕  使用命令 ps | grep postgres 查找不到</p> 
<p>ps -ef  查询所有进程</p> 
<p>安装</p> 
{% highlight %}sudo apt update
sudo apt install postgresql postgresql-contrib{% endhighlight %} 
<p>运行</p> 
{% highlight %}sudo systemctl start postgresql.service{% endhighlight %} 
<p>切换到postgres帐户<br> 通过键入以下内容切换到服务器上的postgres帐户：</p> 
{% highlight %}通过键入切换到服务器上的postgres帐户  sudo -i -u postgres   
现在，您可以通过键入以下内容立即访问Postgres提示符：
psql   
这将让您登录到PostgreSQL提示符，您可以从这里自由地与数据库管理系统进行交互。
通过键入以下内容退出PostgreSQL提示符：
\q
在不切换帐户的情况下访问Postgres提示符
在上一个示例中，系统指示您首先切换到Postgres用户，然后运行psql打开Postgres提示符，从而进入Postgres提示符。或者，您可以通过以postgres用户的身份使用sudo运行单个命令psql，一步完成这项工作，如下所示：
sudo -u postgres psql
这将使您直接登录到Postgres，而不需要中间层bash shell。
同样，您可以通过键入以下内容退出交互式Postgres会话：
\q
如果您以postgres帐户登录，您可以通过键入以下内容创建新用户：
createuser --interactive{% endhighlight %} 
<p><a href="https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04" title="How To Install and Use PostgreSQL on Ubuntu 18.04  | DigitalOcean">How To Install and Use PostgreSQL on Ubuntu 18.04 | DigitalOcean</a></p> 
<p></p> 
<p></p> 
<p><span style="color:#fe2c24;">psql: FATAL:  Peer authentication failed for user</span></p> 
<p>意味着它永远不会要求密码，并且始终信任任何连接。</p> 
<p><img alt="" height="404" src="https://img-blog.csdnimg.cn/2eeaec492e344d07b066ea0a618769e8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="729"></p> 
<blockquote> 
 <h2>createuser</h2> 
 <p>createuser — define a new PostgreSQL user account</p> 
 <h2>Synopsis</h2> 
 <p id="id-1.9.4.5.4.1">{% highlight %}createuser{% endhighlight %} [<em>{% highlight %}connection-option{% endhighlight %}</em>...] [<em>{% highlight %}option{% endhighlight %}</em>...] [<em>{% highlight %}username{% endhighlight %}</em>]</p> 
 <p><a class="has-card" href="https://cdn.ckeditor.com/" title="CKEditor CDN"><span class="link-card-box"><span class="link-title">CKEditor CDN</span><span class="link-link"><img alt="" class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.0.8/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M276">https://cdn.ckeditor.com/</span></span></a><a href="http://www.chenxm.cc/article/1048.html" title="Ubuntu 18.04 安装 PostgreSQL和简单使用-陈新明博客">Ubuntu 18.04 安装 PostgreSQL和简单使用-陈新明博客</a></p> 
 <p> </p> 
</blockquote>
                
