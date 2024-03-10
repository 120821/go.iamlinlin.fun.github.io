---
layout: post
title: "ubuntu 安裝deb_ubuntu安装/卸载deb"
date: "2022-09-09"
categories: 
---
<p><a href="https://blog.csdn.net/weixin_29150195/article/details/111950454">https://blog.csdn.net/weixin_29150195/article/details/111950454</a></p>
<p>例如安装linux qq</p>
<p>官网：<a href="https://im.qq.com/linuxqq/index.shtml">https://im.qq.com/linuxqq/index.shtml</a></p>
<p>下载适合的版本：<a href="https://dldir1.qq.com/qqfile/qq/QQNT/2355235c/linuxqq_3.1.1-11223_arm64.deb">https://dldir1.qq.com/qqfile/qq/QQNT/2355235c/linuxqq_3.1.1-11223_arm64.deb</a></p>
<p>{% highlight html %}1.安装{% endhighlight %}</p>
{% highlight html %}使用dpkg命令进行安装。sudo &nbsp;dpkg &nbsp;-i &nbsp; deb文件名{% endhighlight %}
{% highlight html %}linlin@linlin-i5:~$ sudo&nbsp; dpkg&nbsp; -i /home/linlin/Downloads/linuxqq_3.1.1-11223_amd64.deb{% endhighlight %}
<p>2.卸载</p>
{% highlight html %}dpkg -l | grep qq{% endhighlight %}
{% highlight html %}sudo apt-get remove --purge linuxq{% endhighlight %}
