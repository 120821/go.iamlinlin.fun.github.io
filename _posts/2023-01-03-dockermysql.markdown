---
layout: post
title: "Docker环境下备份和还原MySQL数据库"
date: "2023-01-03"
categories: 
---
<p>refer: <a href="https://www.51jiejue.com/ops/docker-mysql-backup-restore.html">https://www.51jiejue.com/ops/docker-mysql-backup-restore.html</a></p>
<p><strong>备份MySql容器里的MySQL数据库：</strong></p>
<div class="prewrapper">
{% highlight html %}docker exec -it Docker容器名 mysqldump -uroot -p数据库密码 数据库名 &gt; 备份文件名.sql{% endhighlight %}
</div>
<p><strong>还原MySQL数据库：</strong></p>
<p>创建数据库：</p>
<div class="prewrapper">
{% highlight html %}docker exec -it Docker容器名 mysql -uroot -p数据库密码 CREATE DATABASE 数据库名 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;{% endhighlight %}
</div>
<p>还原：</p>
<div class="prewrapper">
{% highlight html %}docker exec -i Docker容器名 mysql -uroot -p数据库密码 数据库名 &lt; 备份文件名.sql{% endhighlight %}
</div>
