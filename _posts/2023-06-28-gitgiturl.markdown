---
layout: post
title: "git  在原有git的项目里连接新的URL进行提交"
date: "2023-06-28"
categories: 
---
<p>要在现有的Git项目中连接新的URL进行提交，可以按照以下步骤操作：</p>

<p>1. 首先，打开命令行终端，导航到你的项目所在的文件夹。</p>

<p>2. 使用以下命令查看当前Git仓库的远程URL：<br />
<code>git remote -v</code><br />
这将显示你当前连接的远程仓库的URL。</p>

<p>3. 如果需要添加新的远程URL，可以使用以下命令添加一个新的远程仓库（使用自定义的远程名称，例如&quot;new-origin&quot;）：<br />
<code>git remote add new-origin &lt;new-url&gt;</code><br />
其中，`&lt;new-url&gt;`是新的远程仓库的URL。</p>

<p>4. 然后，再次运行`git remote -v`命令，以确保新的远程仓库已经添加成功。</p>

<p>5. 接下来，你可以使用`git push`命令将本地提交推送到新的远程仓库，指定远程名称：<br />
<code>git push new-origin &lt;branch-name&gt;</code><br />
其中，`&lt;branch-name&gt;`是要推送的分支名称。</p>

<p>注意：你还可以使用`git remote remove &lt;remote-name&gt;`命令来删除原有的远程仓库。使用`git remote rename &lt;old-name&gt; &lt;new-name&gt;`命令来重命名远程仓库。</p>

<p>希望这些步骤能帮助你在现有的Git项目中连接到新的URL并进行提交。</p>

