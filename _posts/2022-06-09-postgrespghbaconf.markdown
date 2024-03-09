---
layout: post
title: "postgres: 允许所有的链接，都不进行 用户名和密码的验证。 ( pg_hba.conf 的修改）"
date: "2022-06-09"
categories: 
---

                    <p>首先进入docker</p> 
{% highlight %}sudo docker ps{% endhighlight %} 
<blockquote> 
 <p>[sudo] password for linlin:<br> CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                                       NAMES<br><strong>7fea</strong>4e376000   postgres:14.3   "docker-entrypoint.s…"   31 seconds ago   Up 30 seconds   0.0.0.0:5532-&gt;5432/tcp, :::5532-&gt;5432/tcp   postgres14.3<br> 11f55a91272d   ubuntu          "bash"                   25 minutes ago   Up 25 minutes                                               quizzical_wescoff<br> (failed reverse-i-search)`-it': lsof ^C:6379</p> 
 {% highlight %}sudo docker exec -it 7fea bash{% endhighlight %} 
 <p>进入docker 后，进行查找</p> 
 <p>root@7fea4e376000:/# pg</p> 
 {% highlight %}pg_amcheck         pgbench            pg_conftool        pg_ctlcluster      pg_isready         pg_recvlogical     pg_restorecluster  pg_updatedicts     pg_virtualenv
pg_archivecleanup  pg_buildext        pg_controldata     pg_dropcluster     pg_lsclusters      pg_renamecluster   pg_rewind          pg_upgrade         pg_waldump
pg_backupcluster   pg_checksums       pg_createcluster   pg_dump            pg_receivewal      pg_resetwal        pg_test_fsync      pg_upgradecluster  
pg_basebackup      pg_config          pg_ctl             pg_dumpall         pg_receivexlog     pg_restore         pg_test_timing     pg_verifybackup    
{% endhighlight %} 
 <p>root@7fea4e376000:/# su postgres<br> postgres@7fea4e376000:/$ pg_ctl start</p> 
 {% highlight %}postgres@7fea4e376000:/$ pg_ctl start
waiting for server to start....2022-06-02 02:40:07.070 UTC [25] LOG:  starting PostgreSQL 14.3 (Debian 14.3-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit
2022-06-02 02:40:07.070 UTC [25] LOG:  listening on IPv4 address "0.0.0.0", port 5432
2022-06-02 02:40:07.070 UTC [25] LOG:  listening on IPv6 address "::", port 5432
2022-06-02 02:40:07.071 UTC [25] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2022-06-02 02:40:07.073 UTC [26] LOG:  database system was shut down at 2022-06-02 02:38:29 UTC
2022-06-02 02:40:07.076 UTC [25] LOG:  database system is ready to accept connections
 done
server started
{% endhighlight %} 
 <p>postgres@7fea4e376000:/$ psql<br> psql (14.3 (Debian 14.3-1.pgdg110+1))<br> Type "help" for help.</p> 
 <p>postgres=# \du</p> 
 {% highlight %}                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
{% endhighlight %} 
 <p>postgres=#<br> \q<br> postgres@7fea4e376000:/$ pg_ctl stop</p> 
 {% highlight %}2022-06-02 02:40:32.302 UTC [25] LOG:  received fast shutdown request
waiting for server to shut down....2022-06-02 02:40:32.304 UTC [25] LOG:  aborting any active transactions
2022-06-02 02:40:32.305 UTC [25] LOG:  background worker "logical replication launcher" (PID 32) exited with exit code 1
2022-06-02 02:40:32.305 UTC [27] LOG:  shutting down
2022-06-02 02:40:32.314 UTC [25] LOG:  database system is shut down
 done
server stopped
{% endhighlight %} 
 <p>apt update</p> 
 <p>root@7fea4e376000:/# find . | grep hba.conf</p> 
 {% highlight %}./usr/share/postgresql/14/pg_hba.conf.sample
find: ‘./proc/25/task/25/net’: Invalid argument
find: ‘./proc/25/map_files’: Permission denied
find: ‘./proc/25/net’: Invalid argument
./var/lib/postgresql/data/pg_hba.conf
{% endhighlight %} 
 <p>root@7fea4e376000:/# cd /var/lib/postgresql/data/<br> root@7fea4e376000:/var/lib/postgresql/data# ls<br> base    pg_commit_ts  pg_hba.conf    pg_logical    pg_notify    pg_serial     pg_stat       pg_subtrans    pg_twophase  pg_wal   postgresql.auto.conf  postmaster.opts<br> global    pg_dynshmem   pg_ident.conf  pg_multixact  pg_replslot    pg_snapshots  pg_stat_tmp  pg_tblspc    PG_VERSION   pg_xact  postgresql.conf<br> root@7fea4e376000:/var/lib/postgresql/data# vim pg_hba.conf</p> 
 <p>文件页面最后的内容都调整为trust，把host的访问都设置为信任</p> 
 <p><img alt="" height="327" src="https://img-blog.csdnimg.cn/e1cbc8b75474440c9459fe29bee672d5.png" width="957"></p> 
 <p> root@7fea4e376000:/var/lib/postgresql/data# su postgres<br> postgres@7fea4e376000:~/data$ ls</p> 
 {% highlight %}base	pg_commit_ts  pg_hba.conf    pg_logical    pg_notify	pg_serial     pg_stat	   pg_subtrans	pg_twophase  pg_wal   postgresql.auto.conf  postmaster.opts
global	pg_dynshmem   pg_ident.conf  pg_multixact  pg_replslot	pg_snapshots  pg_stat_tmp  pg_tblspc	PG_VERSION   pg_xact  postgresql.conf
postgres@7fea4e376000:~/data$ pg_ctl start
waiting for server to start....2022-06-02 02:43:54.082 UTC [486] LOG:  starting PostgreSQL 14.3 (Debian 14.3-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit
2022-06-02 02:43:54.082 UTC [486] LOG:  listening on IPv4 address "0.0.0.0", port 5432
2022-06-02 02:43:54.082 UTC [486] LOG:  listening on IPv6 address "::", port 5432
2022-06-02 02:43:54.083 UTC [486] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2022-06-02 02:43:54.085 UTC [487] LOG:  database system was shut down at 2022-06-02 02:40:32 UTC
2022-06-02 02:43:54.088 UTC [486] LOG:  database system is ready to accept connections
 done
server started
postgres@7fea4e376000:~/data$ psql
psql (14.3 (Debian 14.3-1.pgdg110+1))
Type "help" for help.

postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}

postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(3 rows)

postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}

postgres=# \l
                                 List of databases
    Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
------------+----------+----------+------------+------------+-----------------------
 blogs      | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 blogs_test | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 postgres   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
            |          |          |            |            | postgres=CTc/postgres
 template1  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
            |          |          |            |            | postgres=CTc/postgres
(5 rows)

postgres=# ^C
{% endhighlight %} 
 <p></p> 
</blockquote> 
<p></p> 
<p></p>
                
