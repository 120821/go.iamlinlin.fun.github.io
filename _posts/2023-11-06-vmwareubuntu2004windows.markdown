---
layout: post
title: "VMware虚拟机安装Ubuntu20.04 粘贴功能可以使用（在虚拟机和windows之间）"
date: "2023-11-06"
categories: 
---
<p><a href="https://blog.csdn.net/weixin_41805734/article/details/120698714?spm=1001.2014.3001.5506">https://blog.csdn.net/weixin_41805734/article/details/120698714?spm=1001.2014.3001.5506</a></p>

<p>使用以下三个命令进行虚拟机和windows之间可以复制粘贴（过程中可能会有依赖没有安装，尝试安装就可以了。）</p>

<pre>
<code>sudo apt-<span style="color:#dcc6e0">get</span> <span style="color:#dcc6e0">auto</span><span style="color:#d4d0ab">remove open-vm-tools</span>
sudo apt-<span style="color:#dcc6e0">get</span> install <span style="color:#dcc6e0">open</span>-vm-tools
sudo apt-<span style="color:#dcc6e0">get</span> install <span style="color:#dcc6e0">open</span>-vm-tools-desktop</code></pre>

