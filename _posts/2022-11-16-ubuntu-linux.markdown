---
layout: post
title: "ubuntu - Linux 下的文件系统"
date: "2022-11-16"
categories: 
---
<p>参考：&nbsp;<a href="https://blog.csdn.net/weixin_42949808/article/details/110038095">https://blog.csdn.net/weixin_42949808/article/details/110038095</a></p>

<p>文件系统：</p>

<p><img alt="LINUX" src="https://img-blog.csdnimg.cn/20201124084134920.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mjk0OTgwOA==,size_16,color_FFFFFF,t_70#pic_center" /></p>

<p>Ubuntu 没有盘符这个概念，只有一个根目录 /，所有文件都在它下面</p>

<p><img src="https://img-blog.csdnimg.cn/20201124084203676.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Mjk0OTgwOA==,size_16,color_FFFFFF,t_70#pic_center" /></p>

<p>Linux主要目录</p>

<p>/：根目录，一般根目录下只存放目录，在 linux 下有且只有一个根目录，所有的东西都是从这里开始<br />
当在终端里输入 /home，其实是在告诉电脑，先从 /（根目录）开始，再进入到 home 目录</p>

<p>/bin、/usr/bin：可执行二进制文件的目录，如常用的命令 ls、tar、mv、cat 等</p>

<p>/boot：放置 linux 系统启动时用到的一些文件，如 linux 的内核文件：/boot/vmlinuz，系统引导管理器：/boot/grub</p>

<p>/dev：存放linux系统下的设备文件，访问该目录下某个文件，相当于访问某个设备，常用的是挂载光驱mount /dev/cdrom/mnt</p>

<p>/etc：系统配置文件存放的目录，不建议在此目录下存放可执行文件，重要的配置文件有<br />
/etc/inittab<br />
/etc/fstab<br />
/etc/init.d<br />
/etc/X11<br />
/etc/sysconfig<br />
/etc/xinetd.d</p>

<p>/home：系统默认的用户家目录，新增用户账号时，用户的家目录都存放在此目录下<br />
表示当前用户的家目录<br />
~edu 表示用户 edu 的家目录<br />
/lib、/usr/lib、/usr/local/lib：系统使用的函数库的目录，程序在执行过程中，需要调用一些额外的参数时需要函数库的协助</p>

<p>/lost+fount：系统异常产生错误时，会将一些遗失的片段放置于此目录下</p>

<p>/mnt: /media：光盘默认挂载点，通常光盘挂载于 /mnt/cdrom 下，也不一定，可以选择任意位置进行挂载</p>

<p>/opt：给主机额外安装软件所摆放的目录</p>

<p>/proc：此目录的数据都在内存中，如系统核心，外部设备，网络状态，由于数据都存放于内存中，所以不占用磁盘空间，比较重要的文件有：/proc/cpuinfo、/proc/interrupts、/proc/dma、/proc/ioports、/proc/net/*等</p>

<p>/root：系统管理员root的家目录</p>

<p>/sbin、/usr/sbin、/usr/local/sbin：放置系统管理员使用的可执行命令，如 fdisk、shutdown、mount 等。与 /bin 不同的是，这几个目录是给系统管理员 root使用的命令，一般用户只能&quot;查看&quot;而不能设置和使用</p>

<p>/tmp：一般用户或正在执行的程序临时存放文件的目录，任何人都可以访问，重要数据不可放置在此目录下</p>

<p>/srv：服务启动之后需要访问的数据目录，如 www 服务需要访问的网页数据存放在 /srv/www 内</p>

<p>/usr：应用程序存放目录</p>

<p>/usr/bin：存放应用程序</p>

<p>/usr/share：存放共享数据</p>

<p>/usr/lib：存放不能直接运行的，却是许多程序运行所必需的一些函数库文件</p>

<p>/usr/local：存放软件升级包</p>

<p>/usr/share/doc：系统说明文件存放目录</p>

<p>/usr/share/man：程序说明文件存放目录</p>

<p>/var：放置系统执行过程中经常变化的文件</p>

<p>/var/log：随时更改的日志文件</p>

<p>/var/spool/mail：邮件存放的目录</p>

<p>/var/run：程序或服务启动后，其 PID 存放在该目录下<br />
&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;<br />
版权声明：本文为CSDN博主「貔貅2020」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。<br />
原文链接：https://blog.csdn.net/weixin_42949808/article/details/110038095</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

