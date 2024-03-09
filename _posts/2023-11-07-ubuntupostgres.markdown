---
layout: post
title: "ubuntu 修改postgres的密码"
date: "2023-11-07"
categories: 
---
<p>解决：</p>

<pre>
<code><span style="color:#dcc6e0">ALTER</span> <span style="color:#dcc6e0">USER</span> username <span style="color:#dcc6e0">WITH</span> PASSWORD <span style="color:#abe338">&#39;new_password&#39;</span>;</code></pre>

<hr />
<p>我在虚拟机的ubuntu上启动后端go，但是数据库被拒绝了，我查看：</p>

<pre>
<code>[<span style="color:#ffd700">sudo</span>] user 的密码： 
<span style="color:#ffd700">2023</span>/<span style="color:#f5ab35">11</span>/<span style="color:#f5ab35">06</span> <span style="color:#f5ab35">17</span>:<span style="color:#f5ab35">40</span>:<span style="color:#f5ab35">43</span> dial tcp <span style="color:#f5ab35">127.0.0.1:5432</span>: connect: connection refused
 <span style="color:#ffd700">sudo</span> lsof -i:<span style="color:#f5ab35">5432</span>
<span style="color:#ffd700">COMMAND</span>   PID     USER   FD   TYPE DEVICE SIZE/<span style="color:#f5ab35">OFF</span> NODE NAME
<span style="color:#ffd700">postgres</span> <span style="color:#f5ab35">9685</span> postgres    <span style="color:#f5ab35">5</span>u  IPv<span style="color:#f5ab35">4</span>  <span style="color:#f5ab35">61495</span>      <span style="color:#f5ab35">0</span>t<span style="color:#f5ab35">0</span>  TCP localhost:postgresql (LISTEN)
<span style="color:#ffd700">user</span>@user-virtual-machine:/opt/app/dongtaipaifang_<span style="color:#f5ab35">2</span>_backend$ lsof -i:<span style="color:#f5ab35">5432</span>
<span style="color:#ffd700">user</span>@user-virtual-machine:/opt/app/dongtaipaifang_<span style="color:#f5ab35">2</span>_backend$ </code></pre>

<p>发现权限不同查看的结果不同。</p>

<p>我查看：</p>

<pre>
<code>sudo service postgresql status
[sudo] user 的密码： 
● postgresql.service - PostgreSQL RDBMS
     Loaded: loaded (<span style="color:#ffa07a">/lib/</span>systemd<span style="color:#ffa07a">/system/</span>postgresql.service; enabled; vendor preset: enabled)
     Active: active (exited) since Mon <span style="color:#f5ab35">2023</span>-<span style="color:#f5ab35">11</span>-<span style="color:#f5ab35">06</span> <span style="color:#f5ab35">15</span>:<span style="color:#f5ab35">55</span>:<span style="color:#f5ab35">41</span> CST; <span style="color:#f5ab35">1</span>h <span style="color:#f5ab35">41</span>min ago
   Main PID: <span style="color:#f5ab35">8638</span> (code=exited, status=<span style="color:#f5ab35">0</span>/SUCCESS)
        CPU: <span style="color:#f5ab35">1</span>ms

<span style="color:#f5ab35">11</span>月 <span style="color:#f5ab35">06</span> <span style="color:#f5ab35">15</span>:<span style="color:#f5ab35">55</span>:<span style="color:#f5ab35">41</span> user-virtual-machine systemd[<span style="color:#f5ab35">1</span>]: Starting PostgreSQL RDBMS...
<span style="color:#f5ab35">11</span>月 <span style="color:#f5ab35">06</span> <span style="color:#f5ab35">15</span>:<span style="color:#f5ab35">55</span>:<span style="color:#f5ab35">41</span> user-virtual-machine systemd[<span style="color:#f5ab35">1</span>]: Finished PostgreSQL RDBMS.
user@user-virtual-machine:<span style="color:#ffa07a">/opt/</span>app/abc$ sudo netstat -tuln | <span style="color:#dcc6e0">grep</span> postgres
sudo: netstat：找不到命令
user@user-virtual-machine:<span style="color:#ffa07a">/opt/</span>app/abc$ sudo ss -tuln | <span style="color:#dcc6e0">grep</span> postgres</code></pre>

<p>我得到了空的返回，<code>ss</code> 命令没有找到与 PostgreSQL 相关的输出</p>

<p>我修改密码，重启go项目，可以了。</p>

<pre>
<code><span style="color:#dcc6e0">ALTER</span> <span style="color:#dcc6e0">USER</span> username <span style="color:#dcc6e0">WITH</span> PASSWORD <span style="color:#abe338">&#39;new_password&#39;</span>;</code></pre>

