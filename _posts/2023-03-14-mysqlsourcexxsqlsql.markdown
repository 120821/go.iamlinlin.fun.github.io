---
layout: post
title: "mysql source xx.sql 根据备份把sql恢复到指定的版本"
date: "2023-03-14"
categories: 
---
<p>refer： <a href="https://blog.csdn.net/u010889616/article/details/48226719">https://blog.csdn.net/u010889616/article/details/48226719</a></p>

<p>1.进入备份sql的文件夹，把对应的zip文件恢复为.sql文件</p>

<p>cd /opt/db_backup</p>

<p>查看已经备份的文件：</p>

<pre>
<code>-rw-r--r-- 1 root root 12587685 Mar 13 19:00 2023_03_13_19_00_01.sql.zip

-rw-r--r-- 1 root root 12587735 Mar 13 20:00 2023_03_13_20_00_01.sql.zip

-rw-r--r-- 1 root root 12587764 Mar 13 21:00 2023_03_13_21_00_01.sql.zip

-rw-r--r-- 1 root root 12587765 Mar 13 22:00 2023_03_13_22_00_01.sql.zip

-rw-r--r-- 1 root root 12587765 Mar 14 03:00 2023_03_14_03_00_01.sql.zip

-rw-r--r-- 1 root root 12587766 Mar 14 06:00 2023_03_14_06_00_01.sql.zip

-rw-r--r-- 1 root root 12587764 Mar 14 08:00 2023_03_14_08_00_01.sql.zip

-rw-r--r-- 1 root root 12587764 Mar 14 10:00 2023_03_14_10_00_01.sql.zip{% endhighlight %}

<p>解压缩：</p>

<pre>
<code>unzip 2023_03_14_10_00_01.sql.zip{% endhighlight %}

<p>2.在命令行进入sql</p>

<pre>
<code>mysql -uroot -p  # 登录到数据库{% endhighlight %}

<pre>
<code>mysql&gt; CREATE DATABASE test_db;&nbsp; //创建数据库表test_db

Query OK, 1 row affected (0.42 sec)

mysql&gt; USE test_db;&nbsp;&nbsp; //默认数据库更改为test_db

Database changed

mysql&gt; source /opt/db_backup/2023_03_14_10_00_01.sql;&nbsp; //导入qq.sql文件

Query OK, 0 rows affected (0.32 sec)

Query OK, 0 rows affected (0.09 sec)

Query OK, 0 rows affected (0.02 sec)&nbsp; //导入成功{% endhighlight %}

<p>3.查看是否已经恢复：</p>

<pre>
<code>SHOW TABLES FROM test_db;&nbsp;&nbsp; //查看数据库下面所有的数据库表

+---------------------+

| Tables_in_test_db&nbsp;&nbsp; |

+---------------------+

| tbl_del_users&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |

+---------------------+

6 rows in set (0.00 sec){% endhighlight %}

<pre>
<code>mysql&gt; DESC&nbsp; tbl_del_users;&nbsp; //查看tbl_del_users数据库表结构

+-----------+-------------+------+-----+---------+-------+

| Field&nbsp;&nbsp;&nbsp;&nbsp; | Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Null | Key | Default | Extra |

+-----------+-------------+------+-----+---------+-------+

| name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | varchar(20) | NO&nbsp;&nbsp; | PRI | NULL&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |

| passwd&nbsp;&nbsp;&nbsp; | varchar(20) | NO&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; | NULL&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |

&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;{% endhighlight %}

