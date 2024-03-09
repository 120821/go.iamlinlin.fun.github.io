---
layout: post
title: "docker mysql docker-compose up"
date: "2022-12-21"
categories: 
---
<p>refer: <a href="http://siwei.me/blog/posts/docker-mysql-docker">http://siwei.me/blog/posts/docker-mysql-docker</a></p>

<p>1.使用docker安装MySQL：</p>

<pre>
docker pull mysql:latest</pre>

<p>2.进行配置数据库的内容，把数据库的数据保存到服务器的文件，不然重新启动数据库数据会丢失。</p>

<p>在/opt/app/文件夹下，增加docker-compose.yml，内容如下：</p>

<p><code>version: &#39;3&#39;<br />
services:</code></p>

<pre>
<code>&nbsp; mysql5.7:

&nbsp;&nbsp;&nbsp; container_name: &quot;mysql5.7&quot;

&nbsp;&nbsp;&nbsp; image: mysql:5.7

&nbsp;&nbsp;&nbsp; volumes:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - /opt/app/mysql_data:/var/lib/mysql

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #command: &#39;tail -F /dev/null&#39;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #command: &#39;mysqld&#39;

&nbsp;&nbsp;&nbsp; ports:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &quot;3306:3306&quot;

&nbsp;&nbsp;&nbsp; stdin_open: true

&nbsp;&nbsp;&nbsp; tty: true

&nbsp;&nbsp;&nbsp; environment:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - MYSQL_ROOT_PASSWORD=666666

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - MYSQL_ROOT_HOST=%{% endhighlight %}

<p>3.启动数据库：</p>

<pre>
<code>sudo docker-compose up{% endhighlight %}

