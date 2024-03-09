---
layout: post
title: "git cherry-pick "
date: "2023-02-02"
categories: 
---
<p>refer：<a href="http://siwei.me/blog/posts/git-cherry-pick">http://siwei.me/blog/posts/git-cherry-pick</a></p>

<p><a href="https://www.ruanyifeng.com/blog/2020/04/git-cherry-pick.html">https://www.ruanyifeng.com/blog/2020/04/git-cherry-pick.html</a></p>

<p>当一个已经push到远程的分支不能正常合并的时候，可以考虑创建一个新的分支，把尚未合并的异常的分支的commit放到新的分支上。</p>

<p>1.首先切换到主分支上，例如</p>

<pre><code>git checkout development</code></pre>

<p>2.把主分支上的代码进行更新到最新。</p>

<pre><code>git pull origin development:development</code></pre>

<p>3.创建新的分支并切换到该分支，用来保存已经commit的但是无法正常合并的内容</p>

<pre><code>git branch new_branch</code></pre>

<pre><code>git checkout new_branch</code></pre>

<p>4.在github网页或者本地打开异常的分支，查看commit的id(merge的id不需要cherry-pick）</p>

<pre><code>git cherry-pick &lt;commit-id&gt;</code></pre>

<p>如果没有冲突，就会直接commit，有冲突的话就自己进行修改对应的文件，</p>

<pre><code>git add &lt;file_name&gt;</code></pre>

<p>并且：</p>

<pre>
<code>git cherry-pick --continue</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

