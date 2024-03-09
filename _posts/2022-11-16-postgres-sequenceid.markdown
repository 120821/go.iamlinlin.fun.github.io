---
layout: post
title: "postgres - sequence id 简单使用"
date: "2022-11-16"
categories: 
---
<p>参考：<a href="http://blog.chinaunix.net/uid-24774106-id-3973781.html">http://blog.chinaunix.net/uid-24774106-id-3973781.html</a></p>

<p>使用命令进入postgres：</p>

<pre>
<code>sudo -u postgres -i&nbsp;</code></pre>

<p>进入数据库： psql</p>

<p>查看用户：</p>

<p>查看数据库：\l</p>

<p>使用数据库：\c dbname</p>

<p>使用表：</p>

<p>（创建sequence id 的时候，注意用户需要统一，如果是admin创建的数据库， 那么postgres不能进行操作，可以创建一个表，然后继续操作，把用户进行统一）</p>

<p>&nbsp;sequence 是一种特殊的数据库对象，用来产生独一无二的数字ID。Postgres中有一种数据类型serial，和sequence对应：</p>

<p><img src="http://blog.chinaunix.net/attachment/201311/2/24774106_1383400523Gg17.png" /></p>

<p>如果我们插入一笔记录，我们希望系统自动为我们分配一个ID，那么我们需要使用serial type。如果我们创建表的时候，自动创建一个serial类型（包smallserial and bigserial），系统会自动帮我们创建sequence这种数据库对象。</p>

<ol start="1">
	<li><code>create&nbsp;table&nbsp;employ(</code></li>
	<li><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;id serial,</code></li>
	<li><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name&nbsp;varchar(64),</code></li>
	<li><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;department&nbsp;varchar(64)</code></li>
	<li><code>)&nbsp;;</code></li>
</ol>

<ol start="1">
	<li><code>manu_db=# create table employ(id serial,name varchar(64),department varchar(128)) ;<br />
	NOTICE: &nbsp;CREATE TABLE will create implicit sequence &quot;employ_id_seq&quot; for serial column &quot;employ.id&quot;<br />
	CREATE TABLE<br />
	manu_db=# \d<br />
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;List of relations<br />
	&nbsp;Schema | &nbsp; &nbsp; Name &nbsp; &nbsp; &nbsp;| &nbsp; Type &nbsp; | Owner&nbsp;<br />
	--------+---------------+----------+-------<br />
	&nbsp;public | employ &nbsp; &nbsp; &nbsp; &nbsp;| table &nbsp; &nbsp;| manu<br />
	&nbsp;public | employ_id_seq | sequence | manu<br />
	(2 rows)</code></li>
	<li>&nbsp;</li>
	<li><code>manu_db-# \d employ<br />
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Table &quot;public.employ&quot;<br />
	&nbsp; &nbsp;Column &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Type &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Modifiers &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
	------------+------------------------+-----------------------------------------------------<br />
	&nbsp;id &nbsp; &nbsp; &nbsp; &nbsp; | integer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| not null default nextval(&#39;employ_id_seq&#39;::regclass)<br />
	&nbsp;name &nbsp; &nbsp; &nbsp; | character varying(64) &nbsp;|&nbsp;<br />
	&nbsp;department | character varying(128) |&nbsp;</code></li>
</ol>

<p>我们看到，postgres自动帮助我们创建了一个sequence，命名原则是&nbsp;tablename_columnname_seq.<br />
&nbsp; &nbsp;下面这两条SQL，本质是相等：</p>

<ol start="1">
	<li>CREATE&nbsp;TABLE&nbsp;employ&nbsp;(</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;id serial,</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name&nbsp;varchar(64),</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;department&nbsp;varchar(64)</li>
	<li>)&nbsp;;</li>
	<li>&nbsp;</li>
	<li>-----------------------------------------------------------------</li>
	<li>CREATE&nbsp;SEQUENCE&nbsp;employ_id_seq&nbsp;;</li>
	<li>CREATE&nbsp;TABLE&nbsp;employ&nbsp;(</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;id&nbsp;integer&nbsp;NOT&nbsp;NULL&nbsp;DEFAULT&nbsp;nextval(&#39;employ_id_seq&#39;),</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name&nbsp;varchar(64),</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;department&nbsp;varchar(64)</li>
	<li>);</li>
	<li>&nbsp;</li>
	<li>ALTER&nbsp;SEQUENCE&nbsp;employ_id_seq OWNED&nbsp;by&nbsp;employ.id;</li>
</ol>

<p>&nbsp;我们看到，我们用了integer数据类型和serial对应起来，默认用nextal（&lsquo;employ_id_seq&rsquo;）给integer类型的id赋值，那是因为integer范围要比serial的范围大，这样做是安全的。对于bigserial，我们应该用bigint类型，对于smallserial应该何smallint对应。</p>

<p><img src="http://blog.chinaunix.net/attachment/201311/2/24774106_1383403462iqY7.png" /></p>

<p>我们建立数据表和sequence的对应关系，常规的就是这两种方法，要么创建表的时候，某字段是serial类型，要么创建先创建sequence，然后创建表的时候，将某字段和sequence 联系起来（DEFAULT nextvl（&lsquo;XXXX_seq&rsquo;））</p>

<p>manu_db=# create table employ_copy (like &nbsp;employ) ;<br />
CREATE TABLE<br />
manu_db=# \d employ_copy&nbsp;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Table &quot;public.employ_copy&quot;<br />
&nbsp; &nbsp;Column &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Type &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| Modifiers&nbsp;<br />
------------+------------------------+-----------<br />
&nbsp;id &nbsp; &nbsp; &nbsp; &nbsp; | integer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| not null<br />
&nbsp;name &nbsp; &nbsp; &nbsp; | character varying(64) &nbsp;|&nbsp;<br />
&nbsp;department | character varying(128) |&nbsp;<br />
<br />
<br />
manu_db=# \d employ<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Table &quot;public.employ&quot;<br />
&nbsp; &nbsp;Column &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Type &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Modifiers &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
------------+------------------------+-----------------------------------------------------<br />
&nbsp;id &nbsp; &nbsp; &nbsp; &nbsp; | integer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| not null default nextval(&#39;employ_id_seq&#39;::regclass)<br />
&nbsp;name &nbsp; &nbsp; &nbsp; | character varying(64) &nbsp;|&nbsp;<br />
&nbsp;department | character varying(128) |&nbsp;<br />
<br />
<br />
manu_db=#&nbsp;<br />
&nbsp;</p>

<p>如果业务需要，创建一个schema和employ一模一样的table，我们只能够用like，但是，我们看到，id这个字段并不完全一样，原因就是没有sequence和新建的table对应。这种情况，我们有没有办法，事后创建sequence，建立table中id字段的联系， I mean &nbsp;id use nextval as default？<br />
&nbsp; &nbsp;答案是肯定的：</p>

<ol start="1">
	<li>CREATE&nbsp;SEQUENCE&nbsp;employ_copy_id_seq&nbsp;;</li>
	<li>ALTER&nbsp;TABLE&nbsp;employ_copy&nbsp;ALTER&nbsp;COLUMN&nbsp;id&nbsp;SET&nbsp;DEFAULT&nbsp;nextval(&#39;employ_copy_id_seq&#39;);</li>
	<li>ALTER SEQUENCE employ_copy_id_seq &nbsp;OWNED by employ_copy.id ;</li>
</ol>

<p>看看效果</p>

<p>manu_db=# CREATE SEQUENCE employ_copy_id_seq ;<br />
CREATE SEQUENCE<br />
manu_db=# ALTER TABLE employ_copy ALTER COLUMN id SET DEFAULT nextval(&#39;employ_copy_id_seq&#39;);<br />
ALTER TABLE<br />
manu_db=# \d employ_copy<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Table &quot;public.employ_copy&quot;<br />
&nbsp; &nbsp;Column &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Type &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Modifiers &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
------------+------------------------+----------------------------------------------------------<br />
&nbsp;id &nbsp; &nbsp; &nbsp; &nbsp; | integer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;not null default nextval(&#39;employ_copy_id_seq&#39;::regclass)<br />
&nbsp;name &nbsp; &nbsp; &nbsp; | character varying(64) &nbsp;|&nbsp;<br />
&nbsp;department | character varying(128) |&nbsp;</p>

<p>注意，加了alter sequence owned by ,在删除table的时候，会自动的将sequence删掉。如果不建立这种owned by的关系，删除table，不会引发sequence被删除。我就不贴了，可以自己try。<br />
<br />
&nbsp; &nbsp;&nbsp;当我们向Postgres插入一笔记录的时候，我们不需要费力告诉DB id的值，因为DB会自动分配一个数值给id：</p>

<p>manu_db=# insert into &nbsp;employ (name,department) values(&#39;bean&#39;, &#39;DDI&#39;);<br />
INSERT 0 1<br />
manu_db=# insert into &nbsp;employ (name,department) values(&#39;albert&#39;, &#39;DDI&#39;);<br />
INSERT 0 1<br />
manu_db=# select * from employ ;<br />
&nbsp;id | &nbsp;name &nbsp;| department&nbsp;<br />
----+--------+------------<br />
&nbsp;&nbsp;1&nbsp;| bean &nbsp; | DDI<br />
&nbsp;&nbsp;2&nbsp;| albert | DDI<br />
(2 rows)</p>

<p>我们可以用currval 和 nextval取到sequence的当前值和下一个值。注意，currval是不会改变sequence的，但是nextval一旦使用，下个数字就被消耗掉了，哪怕你并没有真正的用于你的table。</p>

<ol start="1">
	<li>manu_db=#&nbsp;select currval(&#39;employ_id_seq&#39;);</li>
	<li>&nbsp;currval</li>
	<li>---------</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2</li>
	<li>(1 row)</li>
	<li>&nbsp;</li>
	<li>manu_db=#&nbsp;select nextval(&#39;employ_id_seq&#39;);</li>
	<li>&nbsp;nextval</li>
	<li>---------</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3</li>
	<li>(1 row)</li>
	<li>&nbsp;</li>
	<li>manu_db=#&nbsp;select nextval(&#39;employ_id_seq&#39;);</li>
	<li>&nbsp;nextval</li>
	<li>---------</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4</li>
	<li>(1 row)</li>
</ol>

<p>&nbsp; &nbsp; 使用setval可以设置下一个当前值，下一次就会从你设置的这个值开始递增：&nbsp; &nbsp;</p>

<ol start="1">
	<li>manu_db=#&nbsp;select setval(&#39;employ_id_seq&#39;,100);</li>
	<li>&nbsp;setval</li>
	<li>--------</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;100</li>
	<li>(1 row)</li>
	<li>&nbsp;</li>
	<li>manu_db=#&nbsp;select currval(&#39;employ_id_seq&#39;);</li>
	<li>&nbsp;currval</li>
	<li>---------</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100</li>
	<li>(1 row)</li>
	<li>&nbsp;</li>
	<li>manu_db=#&nbsp;select nextval(&#39;employ_id_seq&#39;);</li>
	<li>&nbsp;nextval</li>
	<li>---------</li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;101</li>
	<li>(1 row)</li>
</ol>

<p>&nbsp;</p>

<ol start="1">
</ol>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<ol start="1">
</ol>

<p>&nbsp;</p>

