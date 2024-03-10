---
layout: post
title: "Linux-hostname查看"
date: "2022-06-09"
categories: 
---
<h1 id="articleContentId">Linux-hostname查看</h1> 
<p>命令行输入命令</p> 
{% highlight html %}hostname{% endhighlight %} 
<p>即可查看 linlin-i5</p> 
{% highlight html %}# 查看当前hostname
[root@suhw ~]# hostname
suhw
# 临时修改hostname
[root@suhw ~]# hostname suhw-test
#查看系统中记录的hostname，发现并没有发生改变
[root@suhw ~]# cat /etc/hostname 
suhw-host
{% endhighlight %} 
<p></p>
