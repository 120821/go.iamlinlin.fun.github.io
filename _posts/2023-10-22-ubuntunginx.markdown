---
layout: post
title: "ubuntu 重新安装nginx"
date: "2023-10-22"
categories: 
---
<p><a href="https://askubuntu.com/questions/235347/what-is-the-best-way-to-uninstall-nginx">https://askubuntu.com/questions/235347/what-is-the-best-way-to-uninstall-nginx</a></p>

<p>1.nginx停止，然后卸载：</p>

<pre>
<code>sudo apt-get purge nginx nginx-common</code></pre>

<p>2.重新安装：</p>

<p><code>apt install nginx</code></p>

<p>3.修改配置，然后重启即可</p>

<pre>
<code>nginx</code></pre>

