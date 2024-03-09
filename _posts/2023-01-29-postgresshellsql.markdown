---
layout: post
title: "postgres 数据库 shell SQL 语句"
date: "2023-01-29"
categories: 
---
<p><a href="https://www.cnblogs.com/52note/p/15277150.html#3%E8%BF%9B%E5%85%A5%E6%95%B0%E6%8D%AE%E5%BA%93">https://www.cnblogs.com/52note/p/15277150.html#3%E8%BF%9B%E5%85%A5%E6%95%B0%E6%8D%AE%E5%BA%93</a></p>

<p>postgresql 有两套命令，一套在linux 终端上，一套在 数据库 shell 上称为 SQL 语句。</p>

<p>数据库中使用的命令，是一套完整的 SQL 语句。</p>

<p><code>\l</code>: 列出数据库</p>

<p><code>\c databasename</code>切换数据库</p>

<p><code>\conninfo</code>: 查看当前数据库连接信息：用户、端口号、IP</p>

<p><code>\d</code>: 列出表格</p>

<p><code>create database name</code>创建数据库，默认属于当前用户。使用 template1 创建。</p>

<p><code>drop database name</code> 删除数据库</p>

<p>Linux postgresql 数据库操作命令</p>

<p><code>createuser name</code> ：创建数据库用户</p>

<p><code>psql -c &quot;ALTER USER ubantu WITH PASSWORD &#39;123456&#39;&quot;</code> 为用户修改密码</p>

<p><code>psql -d dbname -U username</code>： 进入数据库shell</p>

