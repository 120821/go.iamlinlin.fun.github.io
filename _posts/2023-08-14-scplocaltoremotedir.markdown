---
layout: post
title: "scp local to remote dir"
date: "2023-08-14"
categories: 
---
<p>nginx对于yarn进行前端的配置，不需要设置动态，只需要静态即可。</p>

<pre>
<code>server {

&nbsp; listen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 80;

&nbsp; server_name&nbsp; your_domain;

&nbsp; charset utf-8;

&nbsp; location / {

&nbsp;&nbsp;&nbsp; root /tmp/build; #你的路径

&nbsp; }

}{% endhighlight %}

<p>首先可以在本地yarn build(记得把域名配置好。）然后scp到远程服务器，（可以先压缩build文件夹，上传会更快，然后解压缩）如果权限不够，就chmod +x build 或者 chmod 777 build.</p>

<pre>
<code>/build# chmod +x *{% endhighlight %}

<p>如果是使用/tmp/build,任何人都可以访问，nginx无论是哪个用户启动的，都不影响。</p>

