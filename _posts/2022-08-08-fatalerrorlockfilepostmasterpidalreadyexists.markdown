---
layout: post
title: "FATAL ERROR lock file "postmaster.pid" already exists"
date: "2022-08-08"
categories: 
---
<p>https://stackoverflow.com/questions/60859005/where-does-asdf-install-postgres</p>

<p>删除pid文件即可：</p>

<p>rm ~/.asdf/installs/postgres/9.5.25/data/postmaster.pid</p>

<p><img height="204" src="/uploads/ckeditor/pictures/168/image-20220808140605-1.png" width="459" /></p>

<p>使用命令进行停止：sudo service postgresql stop</p>

<p>查看状态：sudo service postgresql status</p>

<p>使用Telnet查看状态：telnet --help&nbsp; telnet -h</p>

<p>telnet 127.0.0.1 5432<br />
Trying 127.0.0.1...<br />
telnet: Unable to connect to remote host: Connection refused</p>

<p>命令brew 是os系统可以使用的</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/170/image-20220808141248-1.png" width="1920" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>查看asdf怎么使用postgres ，history查看怎么使用，没有的话就谷歌， pg_ctl start是正确的</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/169/image-20220808141119-3.png" width="1920" /></p>

