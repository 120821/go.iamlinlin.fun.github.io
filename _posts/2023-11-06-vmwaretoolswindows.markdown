---
layout: post
title: "VMware Tools 实现windows和虚拟机之间文件互传"
date: "2023-11-06"
categories: 
---
<p><a href="https://zhuanlan.zhihu.com/p/624885877?utm_id=0">https://zhuanlan.zhihu.com/p/624885877?utm_id=0</a></p>

<p>1.在虚拟机器里，点击设置，然后点击选项，点击共享文件夹，添加需要共享文件夹</p>

<p>2.使用命令共享文件夹：</p>

<p>/usr/bin/vmhgfs-fuse .host:/share /mnt/hgfs/share -o subtype=vmhgfs-fuse,allow_other</p>

<p>这个命令的意思:</p>

<p>把ubuntu上的文件夹/mnt/hgfs/share作为共享的文件夹，/share是刚才点击选择设置的文件夹</p>

<p>然后就可以使用了。</p>

<p>&nbsp;</p>

