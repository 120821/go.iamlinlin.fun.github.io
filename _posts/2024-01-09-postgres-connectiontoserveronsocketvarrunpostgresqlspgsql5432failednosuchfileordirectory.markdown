---
layout: post
title: "postgres-connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory"
date: "2024-01-09"
categories: 
---
<p>refer: <a href="http://siwei.me/blog/posts/postgres-postgres">http://siwei.me/blog/posts/postgres-postgres</a></p>

<p>在安装postgres后，使用postgres的时候，出现了错误：</p>

<pre>
<code>postgres@meiyi-Extensa<span style="color:#f5ab35">-2511</span>G:~$ psql
psql: error: <span style="color:#dcc6e0">connection</span> <span style="color:#dcc6e0">to</span> <span style="color:#dcc6e0">server</span> <span style="color:#dcc6e0">on</span> socket &quot;/var/run/postgresql/.s.PGSQL.5432&quot; failed: <span style="color:#dcc6e0">No</span> such file <span style="color:#dcc6e0">or</span> directory
	<span style="color:#dcc6e0">Is</span> the <span style="color:#dcc6e0">server</span> running locally <span style="color:#dcc6e0">and</span> accepting connections <span style="color:#dcc6e0">on</span> that socket?</code></pre>

<p>1.查看postgres的状态</p>

<pre>
<code>sudo service postgresql status</code></pre>

<p>如果没有启动的话，可以启动：</p>

<p>sudo service postgresql start</p>

<p>然后检查文件：</p>

<pre>
<code>ls -la <span style="color:#ffa07a">/var/</span>run<span style="color:#ffa07a">/postgresql/</span>.s.PGSQL.<span style="color:#f5ab35">5432</span></code></pre>

<p>但是我没有发现该文件的存在：</p>

<pre>
<code><span style="color:#dcc6e0">ls</span> -<span style="color:#dcc6e0">la</span> /<span style="color:#dcc6e0">var</span>/<span style="color:#dcc6e0">run</span>/postgresql/.s.PGSQL.5432
<span style="color:#dcc6e0">ls</span>: cannot access &#39;/<span style="color:#dcc6e0">var</span>/<span style="color:#dcc6e0">run</span>/postgresql/.s.PGSQL.5432&#39;: <span style="color:#dcc6e0">No</span> such <span style="color:#dcc6e0">file</span> or directory
</code></pre>

<p>如果postgres是启动的，（我刚才看到是启动的），那么就关闭</p>

<pre>
<code>sudo service postgresql stop</code></pre>

<p>使用这些命令重新生成：</p>

<p>sudo mkdir /var/run/postgresql<br />
sudo chmod 2777 /var/run/postgresql<br />
sudo chown postgres:postgres /var/run/postgresql<br />
sudo service postgresql start</p>

<p>但是我启动的时候出现了错误：</p>

<pre>
<code><span style="color:#ffd700">ps</span> -ef | grep postgres
<span style="color:#ffd700">root</span>      <span style="color:#f5ab35">167756</span>  <span style="color:#f5ab35">167581</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">03</span> pts/<span style="color:#f5ab35">8</span>    <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> sudo -u postgres -i
<span style="color:#ffd700">root</span>      <span style="color:#f5ab35">167763</span>  <span style="color:#f5ab35">167756</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">03</span> pts/<span style="color:#f5ab35">10</span>   <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> sudo -u postgres -i
<span style="color:#ffd700">postgres</span>  <span style="color:#f5ab35">167764</span>  <span style="color:#f5ab35">167763</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">03</span> pts/<span style="color:#f5ab35">10</span>   <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> -bash
<span style="color:#ffd700">postgres</span>  <span style="color:#f5ab35">168478</span>       <span style="color:#f5ab35">1</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">06</span> ?        <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> /usr/lib/postgresql/<span style="color:#f5ab35">16</span>/bin/postgres -D /var/lib/postgresql/<span style="color:#f5ab35">16</span>/main -c config_file=/etc/postgresql/<span style="color:#f5ab35">16</span>/main/postgresql.conf
<span style="color:#ffd700">postgres</span>  <span style="color:#f5ab35">168479</span>  <span style="color:#f5ab35">168478</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">06</span> ?        <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> postgres: <span style="color:#f5ab35">16</span>/main: checkpointer 
<span style="color:#ffd700">postgres</span>  <span style="color:#f5ab35">168480</span>  <span style="color:#f5ab35">168478</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">06</span> ?        <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> postgres: <span style="color:#f5ab35">16</span>/main: background writer 
<span style="color:#ffd700">postgres</span>  <span style="color:#f5ab35">168482</span>  <span style="color:#f5ab35">168478</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">06</span> ?        <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> postgres: <span style="color:#f5ab35">16</span>/main: walwriter 
<span style="color:#ffd700">postgres</span>  <span style="color:#f5ab35">168483</span>  <span style="color:#f5ab35">168478</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">06</span> ?        <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> postgres: <span style="color:#f5ab35">16</span>/main: autovacuum launcher 
<span style="color:#ffd700">postgres</span>  <span style="color:#f5ab35">168484</span>  <span style="color:#f5ab35">168478</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">06</span> ?        <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> postgres: <span style="color:#f5ab35">16</span>/main: logical replication launcher 
<span style="color:#ffd700">meiyi</span>     <span style="color:#f5ab35">168675</span>  <span style="color:#f5ab35">167960</span>  <span style="color:#f5ab35">0</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">07</span> pts/<span style="color:#f5ab35">11</span>   <span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span>:<span style="color:#f5ab35">00</span> grep --color=auto postgres
<span style="color:#ffd700">meiyi</span>@meiyi-Extensa-<span style="color:#f5ab35">2511</span>G:~/workspace/dongtaipaifang_<span style="color:#f5ab35">2</span>_frontend$ lsof -i:<span style="color:#f5ab35">5432</span>
<span style="color:#ffd700">meiyi</span>@meiyi-Extensa-<span style="color:#f5ab35">2511</span>G:~/workspace/dongtaipaifang_<span style="color:#f5ab35">2</span>_frontend$ pg_ctl start
<span style="color:#ffd700">waiting</span> for server to start....<span style="color:#f5ab35">2024</span>-<span style="color:#f5ab35">01</span>-<span style="color:#f5ab35">09</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">07</span>:<span style="color:#f5ab35">28</span>.<span style="color:#f5ab35">130</span> CST<span style="color:#f5ab35"> [168818] LOG:  starting PostgreSQL 15.0 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, 64-bit
</span><span style="color:#f5ab35">2024-01-09 14:07:28.130 CST [168818] LOG:  could not bind IPv4 address &quot;127.0.0.1&quot;: Address already in use
</span><span style="color:#f5ab35">2024-01-09 14:07:28.130 CST [168818] HINT:  Is another postmaster already running on port 5432? If not, wait a few seconds and retry.
</span><span style="color:#f5ab35">2024-01-09 14:07:28.130 CST [168818] WARNING:  could not create listen socket for &quot;localhost&quot;
</span><span style="color:#f5ab35">2024-01-09 14:07:28.130 CST [168818] FATAL:  could not create any TCP/IP sockets
</span><span style="color:#f5ab35">2024-01-09 14:07:28.133 CST [168818] LOG:  database system is shut down
</span><span style="color:#f5ab35"> stopped waiting
</span><span style="color:#f5ab35">pg_ctl: could not start server
</span><span style="color:#f5ab35">Examine the log output.</span></code></pre>

<p>也就是说具体的错误是：</p>

<pre>
<code><span style="color:#f5ab35">2024</span><span style="color:#f5ab35">-01</span><span style="color:#f5ab35">-09</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">07</span>:<span style="color:#f5ab35">28.130</span> CST [<span style="color:#f5ab35">168818</span>] LOG:  could not bind IPv4 address <span style="color:#abe338">&quot;127.0.0.1&quot;</span>: Address already in use
<span style="color:#f5ab35">2024</span><span style="color:#f5ab35">-01</span><span style="color:#f5ab35">-09</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">07</span>:<span style="color:#f5ab35">28.130</span> CST [<span style="color:#f5ab35">168818</span>] HINT:  Is another postmaster already running on port <span style="color:#f5ab35">5432</span>? If not, wait a few seconds and retry.
<span style="color:#f5ab35">2024</span><span style="color:#f5ab35">-01</span><span style="color:#f5ab35">-09</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">07</span>:<span style="color:#f5ab35">28.130</span> CST [<span style="color:#f5ab35">168818</span>] WARNING:  could not create listen socket for <span style="color:#abe338">&quot;localhost&quot;</span>
<span style="color:#f5ab35">2024</span><span style="color:#f5ab35">-01</span><span style="color:#f5ab35">-09</span> <span style="color:#f5ab35">14</span>:<span style="color:#f5ab35">07</span>:<span style="color:#f5ab35">28.130</span> CST [<span style="color:#f5ab35">168818</span>] FATAL:  could not create any TCP/IP sockets</code></pre>

<p>那么先关闭：</p>

<pre>
<code>sudo service postgresql stop</code></pre>

<p>然后查看是否启动</p>

<pre>
<code>ps -ef | grep postgres</code></pre>

<p>接着启动：</p>

<pre>
<code>sudo service postgresql start</code></pre>

<p>查看端口是否占用：</p>

<pre>
<code><span style="color:#ffd700">sudo</span> lsof -i:<span style="color:#f5ab35">5432</span></code></pre>

<p>日志：</p>

<pre>
<code>meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ ps -ef | grep postgres
root      167756  167581  0 14:03 pts/8    00:00:00 sudo -u postgres -i
root      167763  167756  0 14:03 pts/10   00:00:00 sudo -u postgres -i
postgres  167764  167763  0 14:03 pts/10   00:00:00 -bash
postgres  168478       1  0 14:06 ?        00:00:00 /usr/lib/postgresql/16/bin/postgres -D /var/lib/postgresql/16/main -c config_file=/etc/postgresql/16/main/postgresql.conf
postgres  168479  168478  0 14:06 ?        00:00:00 postgres: 16/main: checkpointer 
postgres  168480  168478  0 14:06 ?        00:00:00 postgres: 16/main: background writer 
postgres  168482  168478  0 14:06 ?        00:00:00 postgres: 16/main: walwriter 
postgres  168483  168478  0 14:06 ?        00:00:00 postgres: 16/main: autovacuum launcher 
postgres  168484  168478  0 14:06 ?        00:00:00 postgres: 16/main: logical replication launcher 
meiyi     168675  167960  0 14:07 pts/11   00:00:00 grep --color=auto postgres
meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ lsof -i:5432
meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ pg_ctl start
waiting for server to start....2024-01-09 14:07:28.130 CST [168818] LOG:  starting PostgreSQL 15.0 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, 64-bit
2024-01-09 14:07:28.130 CST [168818] LOG:  could not bind IPv4 address &quot;127.0.0.1&quot;: Address already in use
2024-01-09 14:07:28.130 CST [168818] HINT:  Is another postmaster already running on port 5432? If not, wait a few seconds and retry.
2024-01-09 14:07:28.130 CST [168818] WARNING:  could not create listen socket for &quot;localhost&quot;
2024-01-09 14:07:28.130 CST [168818] FATAL:  could not create any TCP/IP sockets
2024-01-09 14:07:28.133 CST [168818] LOG:  database system is shut down
 stopped waiting
pg_ctl: could not start server
Examine the log output.
meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ sudo service postgresql stop
meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ ps -ef | grep postgres
root      167756  167581  0 14:03 pts/8    00:00:00 sudo -u postgres -i
root      167763  167756  0 14:03 pts/10   00:00:00 sudo -u postgres -i
postgres  167764  167763  0 14:03 pts/10   00:00:00 -bash
meiyi     168951  167960  0 14:08 pts/11   00:00:00 grep --color=auto postgres
meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ sudo service postgresql start
meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ ps -ef | grep postgres
root      167756  167581  0 14:03 pts/8    00:00:00 sudo -u postgres -i
root      167763  167756  0 14:03 pts/10   00:00:00 sudo -u postgres -i
postgres  167764  167763  0 14:03 pts/10   00:00:00 -bash
postgres  169260       1  0 14:08 ?        00:00:00 /usr/lib/postgresql/16/bin/postgres -D /var/lib/postgresql/16/main -c config_file=/etc/postgresql/16/main/postgresql.conf
postgres  169261  169260  0 14:08 ?        00:00:00 postgres: 16/main: checkpointer 
postgres  169262  169260  0 14:08 ?        00:00:00 postgres: 16/main: background writer 
postgres  169264  169260  0 14:08 ?        00:00:00 postgres: 16/main: walwriter 
postgres  169265  169260  0 14:08 ?        00:00:00 postgres: 16/main: autovacuum launcher 
postgres  169266  169260  0 14:08 ?        00:00:00 postgres: 16/main: logical replication launcher 
meiyi     169287  167960  0 14:08 pts/11   00:00:00 grep --color=auto postgres
meiyi@meiyi-Extensa-2511G:~/workspace/dongtaipaifang_2_frontend$ sudo lsof -i:5432
COMMAND     PID     USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
postgres 169260 postgres    6u  IPv4 1158076      0t0  TCP localhost:postgresql (LISTEN)
</code></pre>

<p>最后进入postgres命令行创建数据库，修改用户的密码：</p>

<pre>
<code>sudo -u postgres -i
[sudo] password for meiyi: 
postgres@meiyi-Extensa-2511G:~$ psql
psql: error: connection to server on socket &quot;/var/run/postgresql/.s.PGSQL.5432&quot; failed: No such file or directory
	Is the server running locally and accepting connections on that socket?
postgres@meiyi-Extensa-2511G:~$ ls -la /var/run/postgresql/.s.PGSQL.5432
ls: cannot access &#39;/var/run/postgresql/.s.PGSQL.5432&#39;: No such file or directory
postgres@meiyi-Extensa-2511G:~$ ls -la /var/run/postgresql/.s.PGSQL.5432
srwxrwxrwx 1 postgres postgres 0  1月  9 14:08 /var/run/postgresql/.s.PGSQL.5432
postgres@meiyi-Extensa-2511G:~$ psql
psql (16.1 (Ubuntu 16.1-1.pgdg22.04+1))
Type &quot;help&quot; for help.

postgres=# \c
You are now connected to database &quot;postgres&quot; as user &quot;postgres&quot;.
postgres=# \l
                                                       List of databases
   Name    |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | ICU Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+-------------+-------------+------------+-----------+-----------------------
 postgres  | postgres | UTF8     | libc            | zh_CN.UTF-8 | zh_CN.UTF-8 |            |           | 
 template0 | postgres | UTF8     | libc            | zh_CN.UTF-8 | zh_CN.UTF-8 |            |           | =c/postgres          +
           |          |          |                 |             |             |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | zh_CN.UTF-8 | zh_CN.UTF-8 |            |           | =c/postgres          +
           |          |          |                 |             |             |            |           | postgres=CTc/postgres
(3 rows)

postgres=# create database dongtaipaifang;
CREATE DATABASE
postgres=# \l
                                                          List of databases
      Name      |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | ICU Locale | ICU Rules |   Access privileges   
----------------+----------+----------+-----------------+-------------+-------------+------------+-----------+-----------------------
 dongtaipaifang | postgres | UTF8     | libc            | zh_CN.UTF-8 | zh_CN.UTF-8 |            |           | 
 postgres       | postgres | UTF8     | libc            | zh_CN.UTF-8 | zh_CN.UTF-8 |            |           | 
 template0      | postgres | UTF8     | libc            | zh_CN.UTF-8 | zh_CN.UTF-8 |            |           | =c/postgres          +
                |          |          |                 |             |             |            |           | postgres=CTc/postgres
 template1      | postgres | UTF8     | libc            | zh_CN.UTF-8 | zh_CN.UTF-8 |            |           | =c/postgres          +
                |          |          |                 |             |             |            |           | postgres=CTc/postgres
(4 rows)

postgres=# ALTER USER postgres WITH PASSWORD &#39;88888888&#39;;
ALTER ROLE
postgres=# 
</code></pre>

