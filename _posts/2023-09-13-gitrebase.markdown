---
layout: post
title: "git rebase的简单使用"
date: "2023-09-13"
categories: 
---
<p>git 我本地有个分支，比远程落后一个commit，但是比远程多两个commit, 远程已经是push了，但是本地还没有拉取，提示rebase了，进行如下操作：<br />
1.在本地分支(确保当前的分支是存在*的）：</p>

<pre>
<code><span style="color:#ffd700">git branch</span>{% endhighlight %}

<p>2.拉取远程最新的修改：</p>

<pre>
<code>git pull <span style="color:#d4d0ab">--rebase</span>{% endhighlight %}

<p>3.如果冲突就解决：</p>

<pre>
<code>git rebase --<span style="color:#dcc6e0">continue</span>{% endhighlight %}

<p>4.如果放弃就：</p>

<pre>
<code>git rebase <span style="color:#d4d0ab">--abort</span>{% endhighlight %}

