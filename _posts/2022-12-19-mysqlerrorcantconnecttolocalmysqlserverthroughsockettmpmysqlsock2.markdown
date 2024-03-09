---
layout: post
title: "mysql error : Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)"
date: "2022-12-19"
categories: 
---
{% highlight %}
安装好asdf mysql 之后，使用mysql命令，不能启动数据库，并且出现了报错：
{% highlight %}Can&#39;t connect to local MySQL server through socket &#39;/tmp/mysql.sock&#39; (2)
解决：参考：<a href="https://stackoverflow.com/questions/16325607/cant-connect-to-local-mysql-server-through-socket-tmp-mysql-sock">https://stackoverflow.com/questions/16325607/cant-connect-to-local-mysql-server-through-socket-tmp-mysql-sock</a>
{% endhighlight %}

{% highlight %}
{% highlight %}sudo /usr/local/mysql/support-files/mysql.server start {% endhighlight %}

{% highlight %}
{% highlight %}输入命令后需要输入密码进行启动。

{% endhighlight %}

