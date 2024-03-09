---
layout: post
title: "wmware tool 复制粘贴（只能从windows粘贴到虚拟机，不能虚拟机粘贴到windows）"
date: "2023-11-19"
categories: 
---
<p><a href="http://siwei.me/blog/posts/vmware-kali-vmware-tool-failed-to-launch-operation">http://siwei.me/blog/posts/vmware-kali-vmware-tool-failed-to-launch-operation</a></p>

<p>使用wmware安装的时候，需要手动粘贴的话，使用wmware tool：</p>

<p>1.需要点击vmware workstation顶部菜单 -&gt; 虚拟机 -&gt; 点击&quot;安装vm tools&quot; -&gt; 然后根据底部提示，进入到虚拟机（需要是关闭状态，开启的时候时候不能点击安装，是灰色的。）</p>

<p>2.运行 d:\setup.exe</p>

<p>3.重启：ubuntu桌面有个 vm tool CDROM,把内容复制到本地磁盘，tar zxvf 解压缩，</p>

<p>进入解压缩的文件夹：</p>

<p>sudo ./vmware-install.pl</p>

<p>4.运行 pl 文件（根据提示来做）</p>

<p>运行命令：（运行后需要重启）</p>

<p>$ /usr/bin/vmware-user&nbsp;<br />
$ sudo reboot&nbsp; &nbsp;&nbsp;</p>

<p><span style="white-space:pre-wrap">To enable advanced X features (e.g., guest resolution fit, drag and drop, and </span></p>

<pre>
file and text copy/paste), you will need to do one (or more) of the following:
1. Manually start /usr/bin/vmware-user
2. Log out and log back into your desktop session
3. Restart your X session.</pre>

<p>&nbsp;</p>

