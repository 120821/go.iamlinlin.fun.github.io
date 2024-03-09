---
layout: post
title: "rails 如何修改数据库的配置 ( config/database.yml 文件的各种内容， host, name, port 的含义)"
date: "2022-06-09"
categories: 
---

                    <p>本地运行的项目是在5432端口的postgres，看一下database.yml文件配置</p> 
<pre><code>default: &amp;default
  adapter: postgresql
  encoding: utf8
  pool: 5
  host: localhost
  username: admin
  user: admin
  password: 88888888
  port: 5532

development:
  &lt;&lt;: *default
  database: blogs
test:
  &lt;&lt;: *default
  database: blogs_test
production:
  &lt;&lt;: *default
  database: blogs
</code></pre> 
<p>文件中比较重要的是host username user  password port ,这些数据是必须匹配的，host是项目进行运行的名称，username是配置的postgres的名称，在设置docker的时候进行初始化的内容，忘记的就需要进行查看，第一次运行docker的时候必须要有的文件内容。</p> 
<p>docker-compose.yml</p> 
<p>posts: 本地端口：远程端口</p> 
<p>continer_name 与本地运行的相一致</p> 
<p>image也是需要一致<br> volumes 是本地存放docker postgres的地址，：var/lib/postgresql/data 是远程进行保存的地址</p> 
<p>command： 是需要的命令</p> 
<p><code>tail -f /dev/null</code>让容器一直处于runing状态</p> 
<pre><code>version: '3' services:
  postgres14.3:
    container_name: "postgres14.3"
    image: postgres:14.3
    volumes:
      - /workspace/docker_folder2/postgres14.3:/var/lib/postgresql/data
    command: 'tail -F /dev/null'
      # command: 'postgres'
    ports:
      - "5532:5432"
    stdin_open: true
    tty: true
    environment:  #这些内容仅在第一次创建docker的时候有用
      - POSTGRES_DB=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=88888888
</code></pre> 
<p>在postgres可以使用了之后，本地查看postgres已经存在了docker的postgres，那么进行其他项目的转移，尝试，配置之前的blog，数据库转移到docker的数据库中，配置文件database.yml<img alt="" height="297" src="https://img-blog.csdnimg.cn/b60bd5771a9d48ac96383bb904e6fdb3.png" width="412"></p> 
<p> 数据库的名称不需要改变，只需要把数据库的user名称，port进行修改，密码进行统一，就可以了。</p> 
<pre><code>default: &amp;default
  adapter: postgresql
  encoding: utf8
  pool: 5
  #host: localhost
  #username: admin
  #user: admin
  host: localhost
  username: postgres
  user:  postgres
  password: 88888888
  port: 5532

development:
  &lt;&lt;: *default
  database: blogs
test:
  &lt;&lt;: *default
  database: blogs_test
production:
  &lt;&lt;: *default
  database: blogs</code></pre> 
<p>配置好文件，进行数据库的创建，bundle exec rake db:create</p> 
<p>然后就可以在 数据库看到本地的数据库了<img alt="" height="351" src="https://img-blog.csdnimg.cn/e04a3f9be5a44056a3c23b67edab631e.png" width="378"></p> 
<p>也可以在docker进行查看，使用命令sudo docker ps</p> 
<pre><code>[sudo] password for linlin: 
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                                       NAMES
7fea4e376000   postgres:14.3   "docker-entrypoint.s…"   31 seconds ago   Up 30 seconds   0.0.0.0:5532-&gt;5432/tcp, :::5532-&gt;5432/tcp   postgres14.3
11f55a91272d   ubuntu          "bash"                   25 minutes ago   Up 25 minutes                                               quizzical_wescoff
(failed reverse-i-search)`-it': lsof ^C:6379
</code></pre> 
<p>sudo docker exec -it 7fea bash</p> 
<pre><code>root@7fea4e376000:/# pg
pg_amcheck         pgbench            pg_conftool        pg_ctlcluster      pg_isready         pg_recvlogical     pg_restorecluster  pg_updatedicts     pg_virtualenv
pg_archivecleanup  pg_buildext        pg_controldata     pg_dropcluster     pg_lsclusters      pg_renamecluster   pg_rewind          pg_upgrade         pg_waldump
pg_backupcluster   pg_checksums       pg_createcluster   pg_dump            pg_receivewal      pg_resetwal        pg_test_fsync      pg_upgradecluster  
pg_basebackup      pg_config          pg_ctl             pg_dumpall         pg_receivexlog     pg_restore         pg_test_timing     pg_verifybackup    
root@7fea4e376000:/# su postgres
postgres@7fea4e376000:/$ pg_ctl start
waiting for server to start....2022-06-02 02:40:07.070 UTC [25] LOG:  starting PostgreSQL 14.3 (Debian 14.3-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit
2022-06-02 02:40:07.070 UTC [25] LOG:  listening on IPv4 address "0.0.0.0", port 5432
2022-06-02 02:40:07.070 UTC [25] LOG:  listening on IPv6 address "::", port 5432
2022-06-02 02:40:07.071 UTC [25] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2022-06-02 02:40:07.073 UTC [26] LOG:  database system was shut down at 2022-06-02 02:38:29 UTC
2022-06-02 02:40:07.076 UTC [25] LOG:  database system is ready to accept connections
 done
server started
postgres@7fea4e376000:/$ lsof -i:5432
bash: lsof: command not found
postgres@7fea4e376000:/$ psql
psql (14.3 (Debian 14.3-1.pgdg110+1))
Type "help" for help.

postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}

postgres=# 
\q
postgres@7fea4e376000:/$ pg_ctl stop
2022-06-02 02:40:32.302 UTC [25] LOG:  received fast shutdown request
waiting for server to shut down....2022-06-02 02:40:32.304 UTC [25] LOG:  aborting any active transactions
2022-06-02 02:40:32.305 UTC [25] LOG:  background worker "logical replication launcher" (PID 32) exited with exit code 1
2022-06-02 02:40:32.305 UTC [27] LOG:  shutting down
2022-06-02 02:40:32.314 UTC [25] LOG:  database system is shut down
 done
server stopped
</code></pre> 
<p><img alt="" height="442" src="https://img-blog.csdnimg.cn/7ab1ac82541b410f888f8a5ae9f8bc85.png" width="1200"></p> 
<p> </p>
                
