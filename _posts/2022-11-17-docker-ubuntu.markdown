---
layout: post
title: "docker - 安装Ubuntu "
date: "2022-11-17"
categories: 
---
<p>参考：<a href="https://www.runoob.com/docker/docker-install-ubuntu.html">https://www.runoob.com/docker/docker-install-ubuntu.html</a></p>

<p>访问 Ubuntu 镜像库地址：&nbsp;<a href="https://hub.docker.com/_/ubuntu?tab=tags&amp;page=1" rel="noopener noreferrer" target="_blank">https://hub.docker.com/_/ubuntu?tab=tags&amp;page=1</a>。</p>

<p>可以通过 Sort by 查看其他版本的 Ubuntu。默认是最新版本 ubuntu:latest 。</p>

<p>安装其他版本，例如：</p>

<pre><code>docker pull ubuntu:18.04</code></pre>

<p>拉取最新的Ubuntu镜像 ：</p>

<pre>
<code>$ docker pull ubuntu</code></pre>

<p>或者</p>

<pre>
<code>$ docker pull ubuntu:latest</code></pre>

<p>查看本地镜像：</p>

<pre>
<code>$ docker images</code></pre>

<p>运行容器，并且可以通过 exec 命令进入 ubuntu 容器</p>

<pre>
<code>$ docker run -itd --name ubuntu-test ubuntu</code></pre>

<p>安装成功</p>

<p>可以使用docker ps 进行查看</p>

<p><img src="https://www.runoob.com/wp-content/uploads/2019/11/docker-ubuntu4.png" /></p>

