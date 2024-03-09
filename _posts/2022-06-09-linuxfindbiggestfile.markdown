---
layout: post
title: "查看文件linux find biggest file"
date: "2022-06-09"
categories: 
---

                    <p>Type du -a /dir/ | sort -n -r | head -n 20.</p> 
<p>对文件进行排序</p> 
<p>/dir 是根目录，可以自行更换</p> 
<p> </p> 
<h2>Linux使用find递归查找目录中最大的文件</h2> 
<p>在 Linux 中查找包括目录在内的最大文件的过程如下：</p> 
<ol>
<li>打开终端应用程序</li>
<li>使用 root 用户登录 sudo -i命令</li>
<li>类型 du -a /dir/ | sort -n -r | head -n 20</li>
<li>du 将估计文件空间使用情况</li>
<li>sort 会对 du 命令的输出进行排序</li>
<li>head 将仅显示 /dir/ 中的前 20 个最大文件</li>
<li>还要检查 <a href="https://www.cyberciti.biz/open-source/install-ncdu-on-linux-unix-ncurses-disk-usage/?utm_source=Linux_Unix_Command&amp;utm_medium=faq&amp;utm_campaign=nixcmd" title="ncdu 命令 ">ncdu 命令 </a>以获取目录中最大的文件</li>
</ol>
<h3>Linux 在 / 中找到最大的文件</h3> 
<p>运行命令：<br><code>$ sudo du -a /dir/ | sort -n -r | head -n 20</code><br> 或者<br><code>$ sudo du -a / 2&gt;/dev/null | sort -n -r | head -n 20</code></p> 
{% highlight %}
    Open the terminal application
    Login as root user using the sudo -i command
    Type du -a /dir/ | sort -n -r | head -n 20
    du will estimate file space usage
    sort will sort out the output of du command
    head will only show top 20 largest file in /dir/
    Also check the ncdu command to get largest files in directory

Linux find a biggest files in /

Run the command:
$ sudo du -a /dir/ | sort -n -r | head -n 20

OR
$ sudo du -a / 2&gt;/dev/null | sort -n -r | head -n 20{% endhighlight %} 
<p></p>
                
