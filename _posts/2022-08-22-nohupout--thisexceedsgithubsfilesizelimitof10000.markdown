---
layout: post
title: "nohup.out --this exceeds GitHub's file size limit of 100.00"
date: "2022-08-22"
categories: 
---
{% highlight %}
{% highlight %}git push的时候出现报错，提示文件最大是100M，现在文件超过限制了。

find . -size +100M | cat &gt;&gt; .gitignore{% endhighlight %}

{% highlight %}使用这个命令进行大文件的忽略，但是现在是已经出现报错了，而且现在没有push的有十条记录，使用下面的这个命令进行删除文件即可，nohup.out 记录的都是日志，删除了也没有大问题<br />
git filter-branch -f --index-filter &#39;git rm --cached --ignore-unmatch nohup.out&#39; {% endhighlight %}

<p>&nbsp;</p>

