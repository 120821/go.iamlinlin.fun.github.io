---
layout: post
title: "gin - 连接数据库 MySQL  postgres"
date: "2022-10-25"
categories: 
---
<p><a href="https://gorm.io/docs/connecting_to_the_database.html">https://gorm.io/docs/connecting_to_the_database.html</a></p>

<p>1.MySQL：</p>

<pre>
<code><span class="line"><span class="keyword">import</span> (</span>
<span class="line">  <span class="string">&quot;gorm.io/driver/mysql&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/gorm&quot;</span></span>
<span class="line">)</span>

<span class="line"><span class="function"><span class="keyword">func</span> <span class="title">main</span><span class="params">()</span></span> {</span>
<span class="line">  <span class="comment">// refer https://github.com/go-sql-driver/mysql#dsn-data-source-name for details</span></span>
<span class="line">  dsn := <span class="string">&quot;user:pass@tcp(127.0.0.1:3306)/dbname?charset=utf8mb4&amp;parseTime=True&amp;loc=Local&quot;</span></span>
<span class="line">  db, err := gorm.Open(mysql.Open(dsn), &amp;gorm.Config{})</span>
<span class="line">}</span></code></pre>

<p>MySQL Driver 提供了一些可在初始化期间使用的高级配置，例如：</p>

<p>MySQL Driver provides a <a href="https://github.com/go-gorm/mysql" rel="noopener" target="_blank">few advanced configurations</a> which can be used during initialization, for example:</p>

<pre>
<code><span class="line">db, err := gorm.Open(mysql.New(mysql.Config{</span>
<span class="line">  DSN: <span class="string">&quot;gorm:gorm@tcp(127.0.0.1:3306)/gorm?charset=utf8&amp;parseTime=True&amp;loc=Local&quot;</span>, <span class="comment">// data source name</span></span>
<span class="line">  DefaultStringSize: <span class="number">256</span>, <span class="comment">// default size for string fields</span></span>
<span class="line">  DisableDatetimePrecision: <span class="literal">true</span>, <span class="comment">// disable datetime precision, which not supported before MySQL 5.6</span></span>
<span class="line">  DontSupportRenameIndex: <span class="literal">true</span>, <span class="comment">// drop &amp; create when rename index, rename index not supported before MySQL 5.7, MariaDB</span></span>
<span class="line">  DontSupportRenameColumn: <span class="literal">true</span>, <span class="comment">// `change` when rename column, rename column not supported before MySQL 8, MariaDB</span></span>
<span class="line">  SkipInitializeWithVersion: <span class="literal">false</span>, <span class="comment">// auto configure based on currently MySQL version</span></span>
<span class="line">}), &amp;gorm.Config{})</span></code></pre>

<p><strong>NOTE:</strong><br />
To handle <code>time.Time</code> correctly, you need to include <code>parseTime</code> as a parameter. (<a href="https://github.com/go-sql-driver/mysql#parameters" rel="noopener" target="_blank">more parameters</a>)<br />
To fully support UTF-8 encoding, you need to change <code>charset=utf8</code> to <code>charset=utf8mb4</code>. See <a href="https://mathiasbynens.be/notes/mysql-utf8mb4" rel="noopener" target="_blank">this article</a> for a detailed explanation</p>

<p>GORM 允许使用 DriverName 选项自定义 MySQL 驱动程序，例如：</p>

<pre>
<code><span class="line"><span class="keyword">import</span> (</span>
<span class="line">  _ <span class="string">&quot;example.com/my_mysql_driver&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/driver/mysql&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/gorm&quot;</span></span>
<span class="line">)</span>

<span class="line">db, err := gorm.Open(mysql.New(mysql.Config{</span>
<span class="line">  DriverName: <span class="string">&quot;my_mysql_driver&quot;</span>,</span>
<span class="line">  DSN: <span class="string">&quot;gorm:gorm@tcp(localhost:9910)/gorm?charset=utf8&amp;parseTime=True&amp;loc=Local&quot;</span>, <span class="comment">// data source name, refer https://github.com/go-sql-driver/mysql#dsn-data-source-name</span></span>
<span class="line">}), &amp;gorm.Config{})</span></code></pre>

<p><span class="line">对于已经存在的数据库的连接：</span></p>

<pre><code>GORM allows to initialize *gorm.DB with an existing database connection
<span class="line"><span class="keyword">import</span> (</span>
<span class="line">  <span class="string">&quot;database/sql&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/driver/mysql&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/gorm&quot;</span></span>
<span class="line">)</span>

<span class="line">sqlDB, err := sql.Open(<span class="string">&quot;mysql&quot;</span>, <span class="string">&quot;mydb_dsn&quot;</span>)</span>
<span class="line">gormDB, err := gorm.Open(mysql.New(mysql.Config{</span>
<span class="line">  Conn: sqlDB,</span>
<span class="line">}), &amp;gorm.Config{})</span></code></pre>

<p><span class="line">2.postgres连接：</span></p>

<pre>
<code><span class="line"><span class="keyword">import</span> (</span>
<span class="line">  <span class="string">&quot;gorm.io/driver/postgres&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/gorm&quot;</span></span>
<span class="line">)</span>

<span class="line">dsn := <span class="string">&quot;host=localhost user=gorm password=gorm dbname=gorm port=9920 sslmode=disable TimeZone=Asia/Shanghai&quot;</span></span>
<span class="line">db, err := gorm.Open(postgres.Open(dsn), &amp;gorm.Config{})</span></code></pre>

<p>我们使用 pgx 作为 postgres 的数据库/sql 驱动程序，它默认启用准备好的语句缓存，禁用它：</p>

<p>We are using <a href="https://github.com/jackc/pgx" rel="noopener" target="_blank">pgx</a> as postgres&rsquo;s database/sql driver, it enables prepared statement cache by default, to disable it:</p>

<pre>
<code><span class="line"><span class="comment">// https://github.com/go-gorm/postgres</span></span>
<span class="line">db, err := gorm.Open(postgres.New(postgres.Config{</span>
<span class="line">  DSN: <span class="string">&quot;user=gorm password=gorm dbname=gorm port=9920 sslmode=disable TimeZone=Asia/Shanghai&quot;</span>,</span>
<span class="line">  PreferSimpleProtocol: <span class="literal">true</span>, <span class="comment">// disables implicit prepared statement usage</span></span>
<span class="line">}), &amp;gorm.Config{})</span></code></pre>

<p><code>GORM 允许使用 DriverName 选项自定义 PostgreSQL 驱动程序，例如：</code></p>

<pre>
<code><span class="line"><span class="keyword">import</span> (</span>
<span class="line">  _ <span class="string">&quot;github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/postgres&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/gorm&quot;</span></span>
<span class="line">)</span>

<span class="line">db, err := gorm.Open(postgres.New(postgres.Config{</span>
<span class="line">  DriverName: <span class="string">&quot;cloudsqlpostgres&quot;</span>,</span>
<span class="line">  DSN: <span class="string">&quot;host=project:region:instance user=postgres dbname=postgres password=password sslmode=disable&quot;</span>,</span>
<span class="line">})</span></code></pre>

<p><span class="line">对于已经存在的数据库的连接：</span></p>

<p><code>GORM allows to initialize *gorm.DB with an existing database connection</code></p>

<pre>
<code><span class="line"><span class="keyword">import</span> (</span>
<span class="line">  <span class="string">&quot;database/sql&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/driver/postgres&quot;</span></span>
<span class="line">  <span class="string">&quot;gorm.io/gorm&quot;</span></span>
<span class="line">)</span>

<span class="line">sqlDB, err := sql.Open(<span class="string">&quot;pgx&quot;</span>, <span class="string">&quot;mydb_dsn&quot;</span>)</span>
<span class="line">gormDB, err := gorm.Open(postgres.New(postgres.Config{</span>
<span class="line">  Conn: sqlDB,</span>
<span class="line">}), &amp;gorm.Config{})</span></code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

