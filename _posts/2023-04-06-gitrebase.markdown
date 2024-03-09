---
layout: post
title: "git rebase "
date: "2023-04-06"
categories: 
---
<p>refer：<a href="http://siwei.me/blog/posts/git-rebase-introduction">http://siwei.me/blog/posts/git-rebase-introduction</a></p>

<p>git rebase 是一种比较常见的 Git 代码管理工具的操作命令，能够使代码管理更加清晰、明晰。具体用法如下：</p>

<p>1. 在切换到你要操作的分支后，执行 git fetch 命令。这个命令可以拉取最新的远程代码，确保你的本地代码与远程代码一致。</p>

<p>2. 执行命令 git rebase 远程分支名，即将你的当前分支与远程分支进行合并操作。比如合并远程的 master 分支，命令为 git rebase origin/master。</p>

<p>3. 接下来会进入到一个交互模式的对话框，提示你对于每个 commit 是否进行保留、修改、删除等操作。你可以根据需要进行操作。</p>

<p>4. 所有操作完成后，执行 git push 命令将合并后的代码推送到远程仓库。</p>

<p>需要注意的一点是，git rebase 命令会将你当前分支的 commit 记录挪到目标分支的最新提交之后，使得你的修改历史看起来更为清晰、干净。但它实际上会改变 commit 的 SHA 标识，因此在多人协作开发时，这个操作需要谨慎处理以避免不必要的冲突和误操作。</p>

<p>用法：</p>

<p>1. git checkout &lt;当前工作分支&gt;</p>

<p>2. git merge master （把master上的最新代码合并到当前分支）&nbsp; （可能有冲突，要合并，）</p>

<p>3. git rebase master (把当前分支上的代码的base 变为 master上的最后一个)&nbsp;&nbsp; （可能要冲突，要合并）</p>

<p>然后就根据git status的各种提示来操作，有冲突就合并冲突。</p>

<p>&nbsp;</p>

