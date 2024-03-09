---
layout: post
title: "gitignore 忽略已经跟踪过的文件"
date: "2023-06-09"
categories: 
---
<p>当您修改.gitignore文件时，它只会影响新添加的文件。如果您在Git中已经跟踪了文件，`.gitignore`的更改不会影响它们。</p>

<p>您需要将已经跟踪的`config/environments`文件从Git中删除，并将其添加到忽略列表中。 您可以使用以下命令完成此操作：</p>

{% highlight %}

{% highlight %}git rm --cached -r config/environments/

git add .gitignore

git commit -m &quot;忽略config/environments文件&quot;{% endhighlight %}

&nbsp;{% endhighlight %}

<p>第一条命令将已经跟踪的文件从Git中删除，但不会从本地文件系统中删除。`--cached`选项告诉Git只删除索引中的文件，而不从工作树中删除文件。</p>

<p>使用这个命令时请注意，如果您正在`config/environments`文件夹中有任何重要文件或文件夹，它们将被删除并且不能恢复。</p>

