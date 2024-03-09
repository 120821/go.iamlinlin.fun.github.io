---
layout: post
title: "ERROR: for postgres14.3 Cannot kill container:"
date: "2022-06-09"
categories: 
---

                    <p>配置好数据库，选择postgres13.4</p> 
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
<p>sudo docker-compose up</p> 
<p>在运行docker连接数据库的过程，出现报错</p> 
<blockquote> 
 <p>postgres14.3    | 2022-06-02 02:30:31.317 UTC [89] FATAL:  password authentication failed for user "postgresql"<br> postgres14.3    | 2022-06-02 02:30:31.317 UTC [89] DETAIL:  Role "postgresql" does not exist.<br> postgres14.3    |     Connection matched pg_hba.conf line 100: "host all all all scram-sha-256"<br> ^CGracefully stopping... (press Ctrl+C again to force)<br> Stopping postgres14.3   ...<br> Killing postgres14.3    .<span style="color:#fe2c24;">.. error</span></p> 
 <p><span style="color:#fe2c24;">ERROR: for postgres14.3  Cannot kill container: c</span><span style="color:#0d0016;">9d54c6d1198d0969692286d6a841a35c82425bd602a6e7d6538f50047e676c6: Container c9d54c6d1198d0969692286d6a841a35c82425bd602a6e7d6538f50047e676c6 is not running</span><br><span style="color:#fe2c24;">ERROR: 2</span></p> 
</blockquote> 
<p>首先使用命令export DOCKER_DEFAULT_PLATFORM=linux/amd64</p> 
<p>然后执行sudo docker-compose up</p> 
<p>会出现同样的报错，查看配置文件，进行command的注释，把command进行替换注释，就可以了</p> 
<blockquote> 
 <p>sudo docker-compose up<br> WARNING: Found orphan containers (test_rails_crud_db_1, test_rails_crud_web_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.<br> Recreating postgres14.3 .<span style="color:#a2e043;">.. done</span><br><span style="color:#a2e043;">Attaching to postgres14.3</span></p> 
 <p></p> 
</blockquote>
                
