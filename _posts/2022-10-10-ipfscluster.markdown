---
layout: post
title: "在远程 安装使用ipfs cluster"
date: "2022-10-10"
categories: 
---
<p><a href="http://www.siwei.me/blog/posts/blockchain-ipfs-setup-ipfs-on-linux-server">http://www.siwei.me/blog/posts/blockchain-ipfs-setup-ipfs-on-linux-server</a></p>

<p>在测试服务器：</p>

{% highlight %}&nbsp;wget https://dist.ipfs.tech/ipfs-cluster-ctl/v1.0.2/ipfs-cluster-ctl_v1.0.2_linux-amd64.tar.gz{% endhighlight %}

<p>解压缩：</p>

{% highlight %}tar zxvf ipfs-cluster-ctl_v1.0.2_linux-amd64.tar.gz

cd ipfs-cluster-ctl/{% endhighlight %}

<p>获取文件：</p>

{% highlight %}wget https://raw.githubusercontent.com/ipfs/ipfs-cluster/v1.0.2/docker-compose.yml{% endhighlight %}

{% highlight %}启动：{% highlight %}sudo docker-compose up{% endhighlight %}

{% highlight %}在新的窗口：{% highlight %}vim hi.txt{% endhighlight %}

{% highlight %}./ipfs-cluster-ctl add hi.txt

added QmXQrn3noXsMWHzHUUxZPWXQvdqEUZ2SurqzUVPKGLjE8t hi.txt{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

