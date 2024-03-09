---
layout: post
title: "var/run/docker.sock: connect: permission denied"
date: "2022-06-09"
categories: 
---

                    <p>sudo docker run -it ubuntu bash</p> 
{% highlight %}sudo chmod +x /usr/local/bin/docker-compose;
{% endhighlight %} 
<p><img alt="" height="195" src="https://img-blog.csdnimg.cn/c26a185314154557b838b714cf74b44d.png" width="1200"></p> 
<p></p> 
<blockquote> 
 <div> 
  <p><span style="color:#be191c;">出现报错 ： var/run/docker.sock: connect: permission denied</span></p> 
  <p><span style="color:#be191c;">解决方案：</span></p> 
  <p>对于那些刚接触 shell 的人，命令：</p> 
  {% highlight %}$ sudo usermod -aG docker $USER
{% endhighlight %} 
  <p>需要有 {% highlight %}$USER{% endhighlight %}在您的外壳中定义。 默认情况下通常会出现这种情况，但您可能需要在某些 shell 中将该值设置为您的登录 ID。</p> 
  <hr>
  <p>更改用户的组不会更改用户已打开的现有登录名、终端和 shell。 为避免再次执行登录，您可以简单地运行：</p> 
  {% highlight %}$ newgrp docker
{% endhighlight %} 
  <p>在您当前的 shell 中访问该组。</p> 
  <hr>
  <p>完成此操作后，用户有效地拥有服务器上的 root 访问权限，因此仅对受信任且具有不受限制的 sudo 访问权限的用户执行此操作。</p> 
 </div> 
</blockquote> 
<blockquote> 
 <h3>postgres how to backup</h3> 
 <p>查看全部的docker ： docker ps -a</p> 
 <p>查看全部的docker的image： docker imange ls</p> 
 <p>查看正在使用的docker：docker ps</p> 
 <p></p> 
 <p><img alt="" height="517" src="https://img-blog.csdnimg.cn/fa13013cfe8b429e8a18e0e24e06e949.png" width="1200"></p> 
 <p><img alt="" height="517" src="https://img-blog.csdnimg.cn/081b3055d11446b0b04c29f41f66c49a.png" width="1200"></p> 
</blockquote>
                
