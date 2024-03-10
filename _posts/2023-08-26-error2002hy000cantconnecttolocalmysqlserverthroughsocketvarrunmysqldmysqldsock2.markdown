---
layout: post
title: "ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)"
date: "2023-08-26"
categories: 
---
<p>在启动MySQL的时候，连接不上：</p>
{% highlight html %}ERROR 2002 (HY000): Can&#39;t connect to local MySQL server through socket &#39;/var/run/mysqld/mysqld.sock&#39; (2)
root@lueluelue:/opt/app/lueluelue-pc# sudo mysql -u root
ERROR 2002 (HY000): Can&#39;t connect to local MySQL server through socket &#39;/var/run/mysqld/mysqld.sock&#39; (2)
root@lueluelue:/opt/app/lueluelue-pc# sudo mysql -u root -p
Enter password:
ERROR 2002 (HY000): Can&#39;t connect to local MySQL server through socket &#39;/var/run/mysqld/mysqld.sock&#39; (2){% endhighlight %}
<p>查看是否启动：</p>
{% highlight html %}sudo service mysql status{% endhighlight %}
<p>没有启动就启动：</p>
{% highlight html %}sudo service mysql start{% endhighlight %}
<p>但是启动不成功</p>
{% highlight html %}sudo service mysql status
Unit mysql.service could not be found.
root@lueluelue:/opt/app/lueluelue-pc# sudo service mysql start
Failed to start mysql.service: Unit mysql.service not found.
root@lueluelue:/opt/app/lueluelue-pc# mysql --version
mysql Ver 8.0.34-0ubuntu0.22.04.1 for Linux on x86_64 ((Ubuntu))
root@lueluelue:/opt/app/lueluelue-pc# which mysql
/usr/bin/mysql{% endhighlight %}
<p>查看是否正确安装：</p>
{% highlight html %}dpkg -l | grep mysql{% endhighlight %}
<p>ii&nbsp; libmysqlclient-dev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.0.34-0ubuntu0.22.04.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amd64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MySQL database development files<br />
ii&nbsp; libmysqlclient21:amd64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.0.34-0ubuntu0.22.04.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amd64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MySQL database client library<br />
ii&nbsp; mysql-client-core-8.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8.0.34-0ubuntu0.22.04.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amd64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MySQL database core client binaries<br />
ii&nbsp; mysql-common&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.8+1.0.8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MySQL database common files, e.g. /etc/mysql/my.cnf</p>
<p>进行安装：</p>
{% highlight html %}sudo apt-get update
sudo apt-get install mysql-server{% endhighlight %}
<p>这时候安装后就自动启动了MySQL：</p>
{% highlight html %}update-alternatives: using /etc/mysql/mysql.cnf to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Renaming removed key_buffer and myisam-recover options (if present)
mysqld will log errors to /var/log/mysql/error.log
mysqld is running as pid 85477
Created symlink /etc/systemd/system/multi-user.target.wants/mysql.service &rarr; /lib/systemd/system/mysql.service.
Setting up libcgi-pm-perl (4.54-1) ...{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
