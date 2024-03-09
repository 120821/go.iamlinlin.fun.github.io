---
layout: post
title: "Linux--使用snap删除软件--snap uninstall--紧急部署"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>Linux下载软件偶尔会下载在snap文件下，是不需要的，应该删除掉，此时删除需要有特定的命令</p> 
 <pre><code>sudo snap remove 软件名</code></pre> 
</blockquote> 
<p>asdf命令</p> 
<pre><code>asdf global nodejs latest</code></pre> 
<pre><code>nodejs 16.5.0</code></pre> 
<blockquote> 
 <pre><code>    git format-patch -1

    $ git apply &lt;path_file &gt;</code></pre> 
 <p>在某个机器上，需要一个紧急部署，但是又不希望手工去修改（因为已经有了一个commit 了）。这样的情况下，可以使用git path 专门为某个commit 生成patch, 然后在这个远程机器上apply it. </p> 
 <p>git patch/apply 某一个commit ( apply a patch generated from a specific commit )</p> 
 <h1></h1> 
</blockquote>
                
