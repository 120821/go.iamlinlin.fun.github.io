---
layout: post
title: "git rebase/merge"
date: "2023-04-25"
categories: 
---
<p>git reabse 的使用:</p>

<div id="rtf11795">
<div>
<p>git rebase 是一种比较常见的 Git 代码管理工具的操作命令，能够使代码管理更加清晰、明晰。具体用法如下：</p>

<ol>
	<li>
	<p>在切换到你要操作的分支后，执行 git fetch 命令。这个命令可以拉取最新的远程代码，确保你的本地代码与远程代码一致。</p>
	</li>
	<li>
	<p>执行命令 git rebase 远程分支名，即将你的当前分支与远程分支进行合并操作。比如合并远程的 master 分支，命令为 git rebase origin/master。</p>
	</li>
	<li>
	<p>接下来会进入到一个交互模式的对话框，提示你对于每个 commit 是否进行保留、修改、删除等操作。你可以根据需要进行操作。</p>
	</li>
	<li>
	<p>所有操作完成后，执行 git push 命令将合并后的代码推送到远程仓库。</p>
	</li>
</ol>

<p>需要注意的一点是，git rebase 命令会将你当前分支的 commit 记录挪到目标分支的最新提交之后，使得你的修改历史看起来更为清晰、干净。但它实际上会改变 commit 的 SHA 标识，因此在多人协作开发时，这个操作需要谨慎处理以避免不必要的冲突和误操作。</p>

<p>git merge 的使用：</p>

<p>git merge 是一种常见的 Git 代码管理工具的操作命令，用于将多个分支的代码合并到一个分支中。具体用法如下：</p>

<ol>
	<li>
	<p>在切换到你要合并的分支后，执行 git fetch 命令。这个命令可以拉取最新的远程代码，确保你的本地代码与远程代码一致。</p>
	</li>
	<li>
	<p>执行命令 git merge 目标分支名，即将你的当前分支与目标分支进行合并操作。比如将 master 分支合并到当前分支，命令为 git merge master。</p>
	</li>
	<li>
	<p>Git 会自动查找需要合并的两个分支的最近的共同祖先，然后将它们的代码合并到当前分支。对于每个文件，Git 只会尝试自动合并那些修改了不同部分的代码，不能自动合并的部分则需要手动解决。</p>
	</li>
	<li>
	<p>解决完合并冲突后，你可以通过 git add 和 git commit 命令将合并的代码提交到当前分支。</p>
	</li>
</ol>

<p>需要注意的一点是，git merge 命令可能会产生代码冲突，特别是在多人协作开发时，如果两个人修改了同一文件同一处代码，就会产生冲突。此时需要手动解决冲突，确保代码合并后能够正常运行。</p>

<p>git format 的使用：</p>

<p>git format 是 Git 提供的一个命令，用于将 Git 对象按照指定的格式进行输出。通常用于生成邮件补丁和提交信息等，具体使用方式如下：</p>

<ol>
	<li>
	<p>git format 显示 Git 对象的内容，可以指定输出的格式。</p>
	</li>
	<li>
	<p>git format &lt;格式字符串&gt; &lt;对象&gt; 格式化输出 Git 对象的内容，格式字符串中可以有占位符，用来替换对象的元数据信息。</p>
	</li>
</ol>

<p>常见的占位符有：</p>

<ul>
	<li>%H: 提交的完整哈希值</li>
	<li>%h: 提交的简化哈希值</li>
	<li>%s: 提交的主题/摘要信息</li>
	<li>%b: 提交的正文信息</li>
</ul>

<p>例如，执行 git format &quot;%h %s&quot; HEAD，可以将当前分支的最新提交信息格式化输出，输出结果包含简化哈希值和主题信息。</p>

<p>除了上述占位符，git format 还可以支持更加复杂的格式字符串，包括条件语句、循环语句等，可以根据不同的需求来进行定制化输出。</p>

<p>需要注意的是，git format 命令不会对 Git 对象进行任何修改，它只是对 Git 对象进行格式化输出，并不会更改 Git 仓库中的数据</p>

<p>git format patch 的使用：</p>

<p>git format-patch 是一个 Git 提供的命令，用于将一系列 Git 提交打包成邮件补丁的形式，方便邮件传送、代码审查等操作。使用 git format-patch 命令，可以将一系列 Git 提交生成为一个或多个 patch 文件。</p>

<p>使用格式如下：</p>

<pre>
<code>git format-patch &lt;start_commit&gt;..&lt;end_commit&gt; [--output-directory=&lt;dir&gt;]</code></pre>

<p>其中，<code>&lt;start_commit&gt;</code> 和 <code>&lt;end_commit&gt;</code> 分别为起始提交和结束提交的 SHA-1 标识，中间用两个点号 <code>..</code> 连接。这里的提交可以是一个提交标记，也可以是一个分支名称。</p>

<p>例如，执行以下命令：</p>

<pre>
<code>git format-patch HEAD~3..HEAD --output-directory=/path/to/patch</code></pre>

<p>该命令将生成最新的三个提交对应的 patch 文件，并将这些文件保存在 <code>/path/to/patch</code> 目录中。</p>

<p>git format-patch 命令还提供了一些选项，如指定输出文件名的前缀、邮件补丁的作者和时间信息等，具体使用方法可以通过 <code>git format-patch --help</code> 查看相关文档。</p>

<p>需要注意的是，执行 git format-patch 命令并不会自动发送邮件补丁，需要手动将生成的 patch 文件发送给目标用户或者使用其他工具进行自动化的发送处理。</p>

<p>git 在远程分支上push到远程分支，应该怎么push：</p>

<div id="rtf11851">
<div>
<p>在 Git 中，将本地分支 push 到远程分支的命令为：</p>

<pre>
<code>git push &lt;remote&gt; &lt;local_branch&gt;:&lt;remote_branch&gt;</code></pre>

<p>其中，<code>&lt;remote&gt;</code> 为远程仓库的名称；<code>&lt;local_branch&gt;</code> 为本地分支的名称；<code>&lt;remote_branch&gt;</code> 为远程分支的名称。</p>

<p>假设你希望将本地分支 <code>dev</code> 的代码推送到远程仓库 <code>origin</code> 的分支 <code>dev</code> 上，可以使用以下命令：</p>

<pre>
<code>git push origin dev:dev</code></pre>

<p>如果远程分支不存在，则会自动创建一个同名的远程分支，并将本地分支的代码推送到该分支。</p>

<p>如果想要将本地分支与远程分支建立关联关系，可以使用以下命令：</p>

<pre>
<code>git push -u origin dev</code></pre>

<p>该命令会将本地分支 <code>dev</code> 的代码推送到远程仓库 <code>origin</code> 的分支 <code>dev</code> 上，并将两个分支建立关联关系，使得以后的 push 和 pull 操作都可以省略远程分支名称。例如，之后只需要执行 <code>git push</code> 和 <code>git pull</code> 命令即可。</p>
</div>
</div>
</div>
</div>

<p>&nbsp;</p>

