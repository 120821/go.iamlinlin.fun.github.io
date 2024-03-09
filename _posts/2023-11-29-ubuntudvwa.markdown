---
layout: post
title: "ubuntu dvwa 环境搭建"
date: "2023-11-29"
categories: 
---
<p><a href="https://github.com/digininja/DVWA">https://github.com/digininja/DVWA</a></p>

<p>1.克隆dvwa项目</p>

<pre>
<code>git clone https://github.com/digininja/DVWA.git</code></pre>

<p>2.同时安装apache服务</p>

<pre>
<code>apt install -y apache2 mariadb-server mariadb-client php php-mysqli php-gd libapache2-mod-php</code></pre>

<p>3.进入克隆后的DVWA文件夹：</p>

<p dir="auto"><code>cp config/config.inc.php.dist config/config.inc.php</code></p>

<p dir="auto"><code>修改你的文件：./config/config.inc.php</code></p>

<p dir="auto"><code>把这些默认设置进行修改（根据自己的情况）：</code></p>

<pre>
$_DVWA[ &#39;db_server&#39;] = &#39;127.0.0.1&#39;;
$_DVWA[ &#39;db_port&#39;] = &#39;3306&#39;;
$_DVWA[ &#39;db_user&#39; ] = &#39;dvwa&#39;;
$_DVWA[ &#39;db_password&#39; ] = &#39;p@ssw0rd&#39;;
$_DVWA[ &#39;db_database&#39; ] = &#39;dvwa&#39;;</pre>

<p>4.然后我发现数据库mysql连接不上了，重启后，发现使用的不是mysql而是MariaDB.</p>

<p>我进入桌面版的mysql，发现数据库重置了，</p>

<p>进入命令行，数据库还是重置了。</p>

