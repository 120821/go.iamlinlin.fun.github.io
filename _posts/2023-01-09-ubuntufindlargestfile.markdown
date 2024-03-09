---
layout: post
title: "清理磁盘空间 ubuntu find largest file"
date: "2023-01-09"
categories: 
---
<p>参考： <a href="https://www.cyberciti.biz/faq/linux-find-largest-file-in-directory-recursively-using-find-du/">https://www.cyberciti.biz/faq/linux-find-largest-file-in-directory-recursively-using-find-du/</a></p>

<p>首先进行磁盘空间使用情况的查看，可以看到电脑的内存已经使用了很多了。</p>

<pre>
<code>df -kh{% endhighlight %}

<p>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used Avail Use% Mounted on<br />
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.6G&nbsp; 3.4M&nbsp; 1.6G&nbsp;&nbsp; 1% /run<br />
/dev/nvme0n1p6&nbsp; 204G&nbsp; 181G&nbsp;&nbsp; 13G&nbsp; 94% /<br />
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7.7G&nbsp;&nbsp; 72K&nbsp; 7.7G&nbsp;&nbsp; 1% /dev/shm<br />
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.0M&nbsp; 4.0K&nbsp; 5.0M&nbsp;&nbsp; 1% /run/lock<br />
/dev/nvme0n1p1&nbsp; 256M&nbsp;&nbsp; 33M&nbsp; 224M&nbsp; 13% /boot/efi<br />
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.6G&nbsp; 2.0M&nbsp; 1.6G&nbsp;&nbsp; 1% /run/user/1000</p>

<p>使用命令，进行查看前20个大文件，从大到小的顺序排列。</p>

<pre>
<code>du -a /dir/ | sort -n -r | head -n 20{% endhighlight %}

<p>因为根据df -kh 查看的内容，我的大文件是放在根目录下的，/目录下，因此进行查看前1000个最大的文件，并且放入/tmp/largest文件内</p>

<pre>
<code>sudo du -a / | sort -n -r | head -n 1000 &gt; /tmp/largest{% endhighlight %}

<p>打开另一个窗口，使用tail命令进行时时查看：</p>

<pre>
<code>tail -f /tmp/largest{% endhighlight %}

<p>接着就可以看到最大的几个文件：</p>

<pre>
<code>201386529&nbsp;&nbsp; &nbsp;/

77590672&nbsp;&nbsp; &nbsp;/home

77590668&nbsp;&nbsp; &nbsp;/home/linlin

62639584&nbsp;&nbsp; &nbsp;/workspace

31962700&nbsp;&nbsp; &nbsp;/home/linlin/.asdf

31940660&nbsp;&nbsp; &nbsp;/home/linlin/.asdf/installs

28715144&nbsp;&nbsp; &nbsp;/var

25442076&nbsp;&nbsp; &nbsp;/home/linlin/.asdf/installs/postgres

24853856&nbsp;&nbsp; &nbsp;/home/linlin/.asdf/installs/postgres/9.5.25

24826308&nbsp;&nbsp; &nbsp;/home/linlin/.asdf/installs/postgres/9.5.25/data

24715640&nbsp;&nbsp; &nbsp;/home/linlin/.asdf/installs/postgres/9.5.25/data/base

24244388&nbsp;&nbsp; &nbsp;/var/lib

22833744&nbsp;&nbsp; &nbsp;/home/linlin/.asdf/installs/postgres/9.5.25/data/base/314927

19349872&nbsp;&nbsp; &nbsp;/home/linlin/Documents

19013476&nbsp;&nbsp; &nbsp;/home/linlin/Documents/WeChat Files

18228600&nbsp;&nbsp; &nbsp;/home/linlin/Documents/WeChat Files/wxid_nohxnmrqnsdr22

17844668&nbsp;&nbsp; &nbsp;/home/linlin/Documents/WeChat Files/wxid_nohxnmrqnsdr22/FileStorage

17434600&nbsp;&nbsp; &nbsp;/var/lib/docker

16735904&nbsp;&nbsp; &nbsp;/home/linlin/Documents/WeChat Files/wxid_nohxnmrqnsdr22/FileStorage/MsgAttach

14615996&nbsp;&nbsp; &nbsp;/var/lib/docker/overlay2

12096712&nbsp;&nbsp; &nbsp;/usr

11234484&nbsp;&nbsp; &nbsp;/home/linlin/.cache

10745673&nbsp;&nbsp; &nbsp;/snap

6923044&nbsp;&nbsp; &nbsp;/opt

6879968&nbsp;&nbsp; &nbsp;/usr/lib

5708844&nbsp;&nbsp; &nbsp;/var/lib/snapd

5492420&nbsp;&nbsp; &nbsp;/workspace/coding_tools

5302068&nbsp;&nbsp; &nbsp;/home/linlin/.asdf/installs/ruby

4958544&nbsp;&nbsp; &nbsp;/workspace/devise_rails

4272836&nbsp;&nbsp; &nbsp;/home/linlin/Documents/WeChat Files/wxid_nohxnmrqnsdr22/FileStorage/MsgAttach/83337d654db3823e39ac70116817c15c

4235612&nbsp;&nbsp; &nbsp;/var/log

4235152&nbsp;&nbsp; &nbsp;/home/linlin/Documents/WeChat Files/wxid_nohxnmrqnsdr22/FileStorage/MsgAttach/83337d654db3823e39ac70116817c15c/Image

4235148&nbsp;&nbsp; &nbsp;/home/linlin/Documents/WeChat Files/wxid_nohxnmrqnsdr22/FileStorage/MsgAttach/83337d654db3823e39ac70116817c15c/Image/2023-01

4161976&nbsp;&nbsp; &nbsp;/var/log/journal

4161972&nbsp;&nbsp; &nbsp;/var/log/journal/0fa067e1a5ae40eca3ba92afd6ec6a2e

4054332&nbsp;&nbsp; &nbsp;/var/lib/snapd/snaps

3626024&nbsp;&nbsp; &nbsp;/workspace/devise_rails/image

3553308&nbsp;&nbsp; &nbsp;/home/linlin/.wine

3550480&nbsp;&nbsp; &nbsp;/home/linlin/.wine/drive_c

3140592&nbsp;&nbsp; &nbsp;/home/linlin/.cache/yarn

3140588&nbsp;&nbsp; &nbsp;/home/linlin/.cache/yarn/v6

2945972&nbsp;&nbsp; &nbsp;/workspace/coding_tools/android_studio

2933440&nbsp;&nbsp; &nbsp;/home/linlin/Downloads{% endhighlight %}

<p>可以看出，微信以及workspace文件夹的devise文件夹，/var/log文件夹占用很大的空间。可以进行查看，不重要的就可以删除了。</p>

