---
layout: post
title: "mysql docker source（备份的恢复）"
date: "2023-05-22"
categories: 
---
<p>1.把docker外的文件复制到docker文件中</p>

<p>有两种方法可以将本地文件复制到Docker容器中：</p>

<ol>
	<li>在Dockerfile中使用 <code>COPY</code> 命令将本地文件复制到容器中：</li>
</ol>

<pre>
<code>COPY /path/to/local/file /path/inside/container{% endhighlight %}

<p>其中，<code>/path/to/local/file</code> 是本地文件的路径，<code>/path/inside/container</code> 是容器内的路径。</p>

<ol start="2">
	<li>使用 <code>docker cp</code> 命令将本地文件复制到运行中的容器中：</li>
</ol>

<pre>
<code>docker cp /path/to/local/file container_name:/path/inside/container{% endhighlight %}

<p>其中，<code>/path/to/local/file</code> 是本地文件的路径，<code>container_name</code> 是容器名称，<code>/path/inside/container</code> 是容器内的路径。</p>

<p>2.进入mysql，选择数据库，备份的恢复</p>

<p>把sql的zip文件解压缩，然后复制到docker</p>

<pre>
<code>sudo docker cp /opt/app/xxx/xxx_20230130.sql 80018a5fe677:/opt{% endhighlight %}

<p>sudo docker ps(查看msyql的id)</p>

<pre>
<code>sudo docker ps

CONTAINER ID&nbsp;&nbsp; IMAGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMMAND&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CREATED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STATUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PORTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAMES

a321543650e6&nbsp;&nbsp; postgres:13.7&nbsp;&nbsp; &quot;docker-entrypoint.s&hellip;&quot;&nbsp;&nbsp; 4 weeks ago&nbsp;&nbsp;&nbsp; Up 2 weeks&nbsp;&nbsp;&nbsp; 0.0.0.0:54137-&gt;5432/tcp, :::54137-&gt;5432/tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; postgres13.7

f204d8039f90&nbsp;&nbsp; postgres:14.2&nbsp;&nbsp; &quot;docker-entrypoint.s&hellip;&quot;&nbsp;&nbsp; 5 weeks ago&nbsp;&nbsp;&nbsp; Up 2 weeks&nbsp;&nbsp;&nbsp; 0.0.0.0:54142-&gt;5432/tcp, :::54142-&gt;5432/tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; postgres14.2

80018a5fe677&nbsp;&nbsp; mysql:5.7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;docker-entrypoint.s&hellip;&quot;&nbsp;&nbsp; 5 weeks ago&nbsp;&nbsp;&nbsp; Up 5 days&nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0:3306-&gt;3306/tcp, :::3306-&gt;3306/tcp, 33060/tcp&nbsp;&nbsp; mysql5.7

9c50c5b0f512&nbsp;&nbsp; postgres:15&nbsp;&nbsp;&nbsp;&nbsp; &quot;docker-entrypoint.s&hellip;&quot;&nbsp;&nbsp; 4 months ago&nbsp;&nbsp; Up 4 months&nbsp;&nbsp; 0.0.0.0:5532-&gt;5432/tcp, :::5532-&gt;5432/tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; postgres15

9b5c7a2a4a1d&nbsp;&nbsp; postgres&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;docker-entrypoint.s&hellip;&quot;&nbsp;&nbsp; 5 months ago&nbsp;&nbsp; Up 4 months&nbsp;&nbsp; 5432/tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elegant_cannon{% endhighlight %}

<p>3.进入docker的mysql</p>

<p>sudo docker exec -it 8001 /bin/bash<br />
bash-4.2# mysql -uroot -p<br />
Enter password:<br />
Welcome to the MySQL monitor.&nbsp; Commands end with ; or \g.<br />
Your MySQL connection id is 819<br />
Server version: 5.7.40 MySQL Community Server (GPL)</p>

<p>选择数据库</p>

<pre>
<code>use xxx;{% endhighlight %}

<p>恢复数据：</p>

<pre>
<code>source /opt/xxx_20230130.sql{% endhighlight %}

