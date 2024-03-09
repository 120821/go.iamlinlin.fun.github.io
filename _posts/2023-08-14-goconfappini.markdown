---
layout: post
title: "go 数据库配置在conf/app.ini"
date: "2023-08-14"
categories: 
---
<p>go的数据库配置放在conf/app.ini文件中</p>

<pre>
<code>cat conf/app.ini</code></pre>

<pre>
<code>#debug or release

RUN_MODE = debug

[app]

PAGE_SIZE = 10

JWT_SECRET = 23347$040412

[server]

HTTP_PORT = 8000

READ_TIMEOUT = 60

WRITE_TIMEOUT = 60

[database]

TYPE = postgres

USER = postgres

PASSWORD = your_password

HOST = 127.0.0.1

PORT = 5432

NAME = database_name

TABLE_PREFIX =

[sms]

REGINID =&nbsp; #区域id

ACCESSKEY =

ACCESSSERCET =

SIGNNAME =&nbsp; # 短信签名

TEMPLATECODE =&nbsp; # 短信模板CODE</code></pre>

<p>&nbsp;</p>

