---
layout: post
title: "git push报错 无法提交远程 [rejected] main -＞ main (fetch first)error: failed to push some refs to"
date: "2022-06-09"
categories: 
---

                    <p><span style="color:#fe2c24;"> ! [rejected]        main -&gt; main (fetch first)<br> error: failed to push some refs to</span></p> 
<p> git push出现报错，也无法打开git hub页面<img alt="" height="527" src="https://img-blog.csdnimg.cn/1d79d70ecbb04ca999c585c8b2795754.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBA6K645aKo44Gu5bCP6J206J22,size_20,color_FFFFFF,t_70,g_se,x_16" width="1200"></p> 
<p>命令行直接使用命令</p> 
<pre><code>git fetch origin master:tmp</code></pre> 
<p>会出现报错不必理会</p> 
<pre><code>git rebase tmp</code></pre> 
<blockquote> 
 <p>error: cannot rebase: You have unstaged changes.<br> error: Please commit or stash them.</p> 
</blockquote> 
<p>命令继续输入即可</p> 
<pre><code>git push origin HEAD:master</code></pre> 
<pre><code>git restore----恢复文件原来的版本
git restore
git show  显示文件内容
git clone 第一次从远程获取文件
git pull 在不断完善，从远程获取协作的文件</code></pre>
                
