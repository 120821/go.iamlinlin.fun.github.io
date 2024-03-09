---
layout: post
title: "docker postgres: 如何登录后运行？ docker exec -it ＜id＞ bash su postgres pg_ctl start/stop"
date: "2022-06-09"
categories: 
---

                    <p>在命令行执行sudo docker ps 或者docker ps</p> 
<p>查看docker的containerID</p> 
<p>使用sudo docker exec -it containerid hash</p> 
<p></p> 
<p><img alt="" height="685" src="https://img-blog.csdnimg.cn/7cc60613f831468db4a1120688809693.png" width="1200"></p> 
<p>进入docker后，可以进入数据库，su postgres</p> 
<p>然后使用 pg_ctl start 进行数据库的启动，与本机启动相同</p> 
<p>使用pg_ctl stop 进行停止</p> 
<p><img alt="" height="792" src="https://img-blog.csdnimg.cn/80c5769fa6094c29b4fa91e2675baa7b.png" width="1200"></p> 
<blockquote> 
 <h1 id="查看docker镜像">查看docker镜像</h1> 
 <pre><code>docker ps
</code></pre> 
 <h1 id="运行镜像的脚本命令">运行镜像的脚本命令</h1> 
 <pre><code>docker exec -it 08 bash
# 选择id为08开头的镜像运行bash
</code></pre> 
 <h1 id="登录数据库">登录数据库</h1> 
 <p>(1)直接登录</p> 
 <pre><code>执行命令：psql -h 172.16.35.179 -U username -d dbname 
# 其中username为数据库用户名，dbname为要连接的数据库名，执行后提示输入密码如下：
# Password for user username: （在此输入密码）输入密码后即可进入psql环境了。
</code></pre> 
 <p>(2)切换数据库</p> 
 <pre><code># 有时候需要在psql环境下切换数据库，此时执行如下psql命令：
\c dbname username serverIP port
# 其中除了数据库名外，其他的参数都是可选的，如果使用默认值可以使用-作为占位符
# 执行这个命令后，也是提示输入密码。
</code></pre> 
</blockquote> 
<blockquote> 
 <p> </p> 
 <p>(1)列出所有的数据库</p> 
 <pre><code>psql: \l或\list
</code></pre> 
 <p>(2)切换数据库</p> 
 <pre><code>psql: \c dbname
</code></pre> 
 <p>(3)列出当前数据库下的数据表</p> 
 <pre><code>psql: \d
</code></pre> 
 <p>(4)列出指定表的所有字段</p> 
 <pre><code>psql: \d tablename
</code></pre> 
 <p>(5)查看指定表的基本情况</p> 
 <pre><code>psql: \d+ tablename
</code></pre> 
 <p>(6)退出登录</p> 
 <pre><code>psql:\q</code></pre> 
</blockquote>
                
