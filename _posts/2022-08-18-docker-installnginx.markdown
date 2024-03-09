---
layout: post
title: "docker  - install nginx "
date: "2022-08-18"
categories: 
---
<p><a href="https://www.runoob.com/w3cnote/nginx-install-and-config.html">Nginx 服务器安装及配置文件详解</a></p>

<p><a href="https://www.runoob.com/docker/docker-install-nginx.html">Docker 安装 Nginx</a></p>

<p><a href="https://www.runoob.com/?s=nginx">NGINX some Blogs</a></p>

<p>docker 安装 Nginx&nbsp;</p>

<p>查看可用的Nginx版本：</p>

<p>访问 Nginx 镜像库地址：&nbsp;<a href="https://hub.docker.com/_/nginx?tab=tags" rel="noopener noreferrer" target="_blank">https://hub.docker.com/_/nginx?tab=tags</a>。</p>

<p>可以通过 Sort by 查看其他版本的 Nginx，默认是最新版本&nbsp;<strong>nginx:latest</strong>。</p>

<p>或者使用命令进行查看可以使用的版本：</p>

{% highlight %}
{% highlight %}docker search nginx{% endhighlight %}

{% highlight %}
{% highlight %}$ docker search nginx
NAME                      DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
nginx                     Official build of Nginx.                        3260      [OK]       
jwilder/nginx-proxy       Automated Nginx reverse proxy for docker c...   674                  [OK]
richarvey/nginx-php-fpm   Container running Nginx + PHP-FPM capable ...   207                  [OK]
million12/nginx-php       Nginx + PHP-FPM 5.5, 5.6, 7.0 (NG), CentOS...   67                   [OK]
maxexcloo/nginx-php       Docker framework container with Nginx and ...   57                   [OK]
...{% endhighlight %}

<p>获取最新的Nginx</p>

{% highlight %}
{% highlight %}$ docker pull nginx:latest{% endhighlight %}

<p>{% highlight %}查看是否安装成功：{% endhighlight %}</p>

<p>&nbsp;</p>

{% highlight %}
$ docker images{% endhighlight %}

<p><img src="https://www.runoob.com/wp-content/uploads/2016/06/docker-nginx4.png" /></p>

{% highlight %}
进行启动Nginx container：
{% highlight %}$ docker run --name nginx-test -p 8080:80 -d nginx{% endhighlight %}

<p>参数说明：</p>

<ul>
	<li><strong>--name nginx-test</strong>：容器名称。</li>
	<li><strong>-p 8080:80</strong>： 端口进行映射，将本地 8080 端口映射到容器内部的 80 端口。</li>
	<li><strong>-d nginx</strong>： 设置容器在在后台一直运行。</li>
</ul>

<p>安装成功可以直接在8080端口进行查看</p>

<p>localhost://8080</p>

<p>Nginx 启动，停止：</p>

{% highlight %}
{% highlight %}$ nginx -s stop # 快速停止

$ nginx -s quit # 比较得体的停止

$ nginx -s reload # 重新读取配置文件（ 重启）

$ nginx -s reopen # 重新打开日志{% endhighlight %}

