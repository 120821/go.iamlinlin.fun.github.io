---
layout: post
title: "docker postgres 导入整个数据库"
date: "2024-01-04"
categories: 
---
<p>1.前提是已经备份过数据库的数据，如果没有备份可以使用命令备份：</p>

<pre style="background:transparent; color:#e3eaf2; font-family:Consolas,Monaco,&quot;Andale Mono&quot;,&quot;Ubuntu Mono&quot;,monospace; hyphens:none; line-height:1.5; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; overflow-wrap:normal; overflow:auto; padding:1rem; tab-size:4; text-align:left; white-space:pre; width:100%; word-break:normal; word-spacing:normal">
<code><span style="color:#c699e3">docker</span> <span style="color:#6cb8e6">exec</span> -t postgres_container pg_dump -U postgres mydb <span style="color:#e9ae7e">&gt;</span> /path/to/backup.sql{% endhighlight %}

<p>2.然后使用docker cp 把docker外部的文件复制到docker内部：</p>

<pre style="background:transparent; color:#e3eaf2; font-family:Consolas,Monaco,&quot;Andale Mono&quot;,&quot;Ubuntu Mono&quot;,monospace; hyphens:none; line-height:1.5; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; overflow-wrap:normal; overflow:auto; padding:1rem; tab-size:4; text-align:left; white-space:pre; width:100%; word-break:normal; word-spacing:normal">
<code><span style="color:#c699e3">docker</span> <span style="color:#c699e3">cp</span> /path/to/backup.sql postgres_container:/backup.sql{% endhighlight %}

<p>3.最后恢复数据即可：</p>

<pre style="background:transparent; color:#e3eaf2; font-family:Consolas,Monaco,&quot;Andale Mono&quot;,&quot;Ubuntu Mono&quot;,monospace; hyphens:none; line-height:1.5; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; overflow-wrap:normal; overflow:auto; padding:1rem; tab-size:4; text-align:left; white-space:pre; width:100%; word-break:normal; word-spacing:normal">
<code><span style="color:#c699e3">docker</span> <span style="color:#6cb8e6">exec</span> -t postgres_container psql -U postgres -d mydb -f /backup.sql{% endhighlight %}

<div style="background:transparent; color:#e3eaf2; font-family:Consolas,Monaco,&quot;Andale Mono&quot;,&quot;Ubuntu Mono&quot;,monospace; hyphens:none; line-height:1.5; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; overflow-wrap:normal; overflow:auto; padding:1rem; tab-size:4; text-align:left; white-space:pre; width:100%; word-break:normal; word-spacing:normal">&nbsp;</div>

<div style="background:transparent; color:#e3eaf2; font-family:Consolas,Monaco,&quot;Andale Mono&quot;,&quot;Ubuntu Mono&quot;,monospace; hyphens:none; line-height:1.5; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; overflow-wrap:normal; overflow:auto; padding:1rem; tab-size:4; text-align:left; white-space:pre; width:100%; word-break:normal; word-spacing:normal">&nbsp;</div>

