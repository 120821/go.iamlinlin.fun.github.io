---
layout: post
title: " gorm - 连接postgres数据库"
date: "2022-10-25"
categories: 
---
<p><a href="https://dev.to/karanpratapsingh/connecting-to-postgresql-using-gorm-24fj">https://dev.to/karanpratapsingh/connecting-to-postgresql-using-gorm-24fj</a></p>

<p>安装：</p>

<pre class="highlight plaintext">
{% highlight %}$ go get -u gorm.io/gorm
$ go get -u gorm.io/driver/postgres
{% endhighlight %}

<p>创建文件夹和新文件：</p>

<p>{% highlight %}pkg/models/book.go{% endhighlight %}</p>

<pre class="highlight go">
{% highlight %}<span class="k">package</span> <span class="n">models</span>

<span class="k">type</span> <span class="n">Book</span> <span class="k">struct</span> <span class="p">{</span>
    <span class="n">Id</span>     <span class="kt">int</span>    <span class="s">`json:&quot;id&quot; gorm:&quot;primaryKey&quot;`</span>
    <span class="n">Title</span>  <span class="kt">string</span> <span class="s">`json:&quot;title&quot;`</span>
    <span class="n">Author</span> <span class="kt">string</span> <span class="s">`json:&quot;author&quot;`</span>
    <span class="n">Desc</span>   <span class="kt">string</span> <span class="s">`json:&quot;desc&quot;`</span>
<span class="p">}</span>
{% endhighlight %}

<p>连接数据库：{% highlight %}pkg/db/db.go{% endhighlight %}</p>

<pre class="highlight go">
{% highlight %}<span class="k">package</span> <span class="n">db</span>

<span class="k">import</span> <span class="p">(</span>
    <span class="s">&quot;log&quot;</span>

    <span class="s">&quot;github.com/tutorials/go/crud/pkg/models&quot;</span>
    <span class="s">&quot;gorm.io/driver/postgres&quot;</span>
    <span class="s">&quot;gorm.io/gorm&quot;</span>
<span class="p">)</span>

<span class="k">func</span> <span class="n">Init</span><span class="p">()</span> <span class="o">*</span><span class="n">gorm</span><span class="o">.</span><span class="n">DB</span> <span class="p">{</span>
    <span class="n">dbURL</span> <span class="o">:=</span> <span class="s">&quot;postgres://pg:pass@localhost:5432/crud&quot;</span>

    <span class="n">db</span><span class="p">,</span> <span class="n">err</span> <span class="o">:=</span> <span class="n">gorm</span><span class="o">.</span><span class="n">Open</span><span class="p">(</span><span class="n">postgres</span><span class="o">.</span><span class="n">Open</span><span class="p">(</span><span class="n">dbURL</span><span class="p">),</span> <span class="o">&amp;</span><span class="n">gorm</span><span class="o">.</span><span class="n">Config</span><span class="p">{})</span>

    <span class="k">if</span> <span class="n">err</span> <span class="o">!=</span> <span class="no">nil</span> <span class="p">{</span>
        <span class="n">log</span><span class="o">.</span><span class="n">Fatalln</span><span class="p">(</span><span class="n">err</span><span class="p">)</span>
    <span class="p">}</span>

    <span class="n">db</span><span class="o">.</span><span class="n">AutoMigrate</span><span class="p">(</span><span class="o">&amp;</span><span class="n">models</span><span class="o">.</span><span class="n">Book</span><span class="p">{})</span>

    <span class="k">return</span> <span class="n">db</span>
<span class="p">}</span>
{% endhighlight %}

