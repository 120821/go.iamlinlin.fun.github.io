---
layout: post
title: "asdf postgers - 升级"
date: "2022-11-10"
categories: 
---
<p>当运行migrate的时候：</p>
{% highlight html %}rake db:migrate RAILS_ENV=test{% endhighlight %}
{% highlight html %}error&nbsp; failed: SCRAM authentication requires libpq version 10 or above{% endhighlight %}
<p>查看版本：</p>
{% highlight html %}pg_config --version{% endhighlight %}
<p><img height="60" src="/uploads/ckeditor/pictures/717/image-20221110174209-1.png" width="658" /></p>
<p>本地的postgres是9.5，所有需要升级（虽然使用的是docker的postgres，版本是14，但是也会受影响。）</p>
<p>使用asdf安装：</p>
<p>先把.tool-versions的postgres版本进行修改，先删除9.5</p>
<p>pg_config --version</p>
<p><img height="241" src="/uploads/ckeditor/pictures/718/image-20221110180430-1.png" width="1039" /></p>
<p>安装：</p>
<p>（1）增加插件 <a href="https://github.com/smashedtoatoms/asdf-postgres">https://github.com/smashedtoatoms/asdf-postgres</a></p>
<p>sudo apt-get install linux-headers-$(uname -r) build-essential libssl-dev libreadline-dev zlib1g-dev libcurl4-openssl-dev uuid-dev</p>
<p>asdf plugin-add postgres</p>
<p>（2）安装</p>
<p>asdf install postgres 15</p>
<p>(3)修改.tool-versions(必须写 15.0）</p>
<p>postgres 15.0</p>
<p><img height="82" src="/uploads/ckeditor/pictures/720/image-20221110180712-3.png" width="182" /></p>
<p>无效：官网：<a href="https://www.postgresql.org/download/linux/ubuntu/">https://www.postgresql.org/download/linux/ubuntu/</a></p>
{% highlight html %}sudo sh -c &#39;echo &quot;deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main&quot; &gt; /etc/apt/sources.list.d/pgdg.list&#39;
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql{% endhighlight %}
<div>最后一个命令换成 sudo apt-get -y install postgresql-14</div>
{% highlight html %}The following packages were automatically installed and are no longer required:
&nbsp; libcurl3-gnutls:i386 libgdbm-compat4:i386 libgdbm6:i386 libglu1-mesa:i386 libieee1284-3:i386 libnspr4:i386 libnss3:i386 libntfs-3g883 libodbc1 libodbc1:i386 libodbccr2
&nbsp; libodbccr2:i386 libopengl0:i386 libpci3:i386 libperl5.34:i386 libpoppler-glib8:i386 libpoppler118:i386 libpython3.9 libpython3.9-dev libpython3.9-minimal
&nbsp; libpython3.9-stdlib libsane1:i386 libsnmp40:i386 libssl1.1:i386 libwrap0:i386 linux-headers-generic-hwe-20.04 linux-image-generic-hwe-20.04 python3-bcrypt
&nbsp; python3-paramiko python3.9 python3.9-dev python3.9-minimal ruby2.7 ruby2.7-dev ruby2.7-doc wine-stable wine-stable-amd64 wine-stable-i386:i386
Use &#39;sudo apt autoremove&#39; to remove them.
The following packages will be upgraded:
&nbsp; postgresql-14
1 upgraded, 0 newly installed, 0 to remove and 52 not upgraded.{% endhighlight %}
<p>&nbsp;</p>
