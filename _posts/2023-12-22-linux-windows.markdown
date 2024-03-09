---
layout: post
title: "linux-windows 查看软路由的命令"
date: "2023-12-22"
categories: 
---
<p>1.在Windows里查看软路由使用命令：</p>

<pre>
<code>ipconfig /all</code>
</pre>

<p>名为&quot;以太网适配器&quot;或&quot;无线局域网适配器&quot;的部分，其中列出了有关您的网络连接的详细信息</p>

<p>2.在linux里查看软路由是：</p>

<pre>
<code>ip route</code></pre>

<p>在返回的结果里，默认路由：以&quot;default&quot;开头的行，指示了您的计算机发送数据包时要使用的下一跳网关。</p>

<p>在默认路由行中，注意第三列的IP地址。这是您的软路由的IP地址，它是连接本机到网络的关键节点。</p>

<p>默认网关通常是软路由的IP地址，它是连接本机到网络的关键节点。</p>

<p>如果看到多个适配器，请选择与当前连接的网络对应的适配器。</p>

<p>注意默认网关的IP地址。这是软路由的IP地址，可以在浏览器中输入该地址来访问软路由的管理界面。</p>

<p>&nbsp;</p>

