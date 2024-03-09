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

{% highlight %}git checkout development{% endhighlight %}

<p>2.把主分支上的代码进行更新到最新。</p>

{% highlight %}git pull origin development:development{% endhighlight %}

<p>3.创建新的分支并切换到该分支，用来保存已经commit的但是无法正常合并的内容</p>

{% highlight %}git branch new_branch{% endhighlight %}

{% highlight %}git checkout new_branch{% endhighlight %}

<p>4.在github网页或者本地打开异常的分支，查看commit的id(merge的id不需要cherry-pick）</p>

{% highlight %}git cherry-pick &lt;commit-id&gt;{% endhighlight %}

<p>如果没有冲突，就会直接commit，有冲突的话就自己进行修改对应的文件，</p>

{% highlight %}git add &lt;file_name&gt;{% endhighlight %}

<p>并且：</p>

{% highlight %}
{% highlight %}git cherry-pick --continue{% endhighlight %}

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

