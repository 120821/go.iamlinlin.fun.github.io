---
layout: post
title: "rm -r .git/refs/original/ 不会影响git stash的内容"
date: "2023-08-17"
categories: 
---
<p>来自poe的回答：</p>

<p>运行 {% highlight %}rm -r .git/refs/original/{% endhighlight %} 不会直接影响 Git Stash 的内容。Git Stash 的内容存储在 {% highlight %}.git/refs/stash{% endhighlight %} 文件中，而不是在 {% highlight %}.git/refs/original/{% endhighlight %} 目录中。</p>

<p>{% highlight %}.git/refs/original/{% endhighlight %} 目录通常是 {% highlight %}git filter-branch{% endhighlight %} 命令在重写历史记录时创建的备份文件。这些备份文件是为了在重写过程中保留原始的引用（refs）而创建的。</p>

<p>因此，删除 {% highlight %}.git/refs/original/{% endhighlight %} 目录不会直接影响 Git Stash 的内容。Git Stash 的内容仍然存在，并且可以正常访问和应用。</p>

<p>请注意，尽管删除 {% highlight %}.git/refs/original/{% endhighlight %} 目录不会直接影响 Git Stash，但执行任何对 Git 历史记录的重写操作都可能产生潜在的风险和影响。在进行此类操作</p>

