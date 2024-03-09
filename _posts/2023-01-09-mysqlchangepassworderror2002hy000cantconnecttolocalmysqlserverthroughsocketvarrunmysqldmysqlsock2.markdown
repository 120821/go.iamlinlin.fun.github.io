---
layout: post
title: "mysql change password：ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysql.sock' (2)"
date: "2023-01-09"
categories: 
---
<p>mysql的 密码不记得了，已经不能正常打开 了，使用<a href="http://siwei.me/blog/posts/mysql--4">重置密码</a>进行修改，还是不行。</p>

<p>进行了mysql的卸载和重装：<a href="https://stackoverflow.com/questions/19658891/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run">ERROR 2002 (HY000): Can&#39;t connect to local MySQL server through socket &#39;/var/run/mysqld/mysql.sock&#39; (2)</a></p>

<pre>
<code>sudo apt-get remove --purge mysql*
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get install mysql-server mysql-client
</code></pre>

<p>然后正常登录就可以了。</p>

<p>mysql -uroot -p 新密码</p>

<p>注意：在<code>/etc/mysql/debian.cnf文件中有明文密码，输入的不是这个密码，而是新设的密码，自定义。</code></p>

<p>参考：<a href="https://stackoverflow.com/questions/11644300/access-denied-for-user-debian-sys-maint">access denied for user debian-sys-maint</a></p>

<p>根据上面这篇文章，可以知道mysql希望获得的是新的密码，而不是文件中的初始密码。</p>

