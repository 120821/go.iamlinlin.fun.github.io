---
layout: post
title: "ubuntu 重启后自启动nginx"
date: "2023-11-19"
categories: 
---
<p>1.写一个启动的文件：</p>

<p><code>/etc/systemd/system/nginx.service</code></p>

<p>内容是这样的：</p>

<pre>
<code>[Unit]
Description=Nginx HTTP server
After=network.target

[Service]
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/usr/sbin/nginx -s quit
ExecStartPre=/usr/sbin/nginx -t
Restart=always
Type=forking

[Install]
WantedBy=multi-user.target</code></pre>

<p>2.写好后，可以使用命令启动一下nginx：</p>

<pre>
<code>sudo systemctl daemon-reload
sudo systemctl start nginx</code></pre>

<p>3.查看nginx状态：</p>

<pre>
<code>sudo systemctl status nginx</code></pre>

<p>4.设置自启动：</p>

<pre>
<code>sudo systemctl enable nginx</code></pre>

