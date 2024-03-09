---
layout: post
title: "git branch--git 分支"
date: "2022-06-25"
categories: 
---
<p>文章：https://www.runoob.com/git/git-branch.html</p>

<p>创建分支命令：</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">git branch </span><span class="pun">(</span><span class="pln">branchname</span><span class="pun">)</span></pre>

<p>切换分支命令:</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">git checkout </span><span class="pun">(</span><span class="pln">branchname</span><span class="pun">)</span></pre>

<p>当你切换分支的时候，Git 会用该分支的最后提交的快照替换你的工作目录的内容， 所以多个分支不需要多个目录。</p>

<p>合并分支命令:</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">git merge </span></pre>

<p>你可以多次合并到统一分支， 也可以选择在合并之后直接删除被并入的分支。</p>

<p>开始前我们先创建一个测试目录：</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ mkdir gitdemo
$ cd gitdemo</span><span class="pun">/</span><span class="pln">
$ git init
</span><span class="typ">Initialized</span><span class="pln"> empty </span><span class="typ">Git</span><span class="pln"> repository</span><span class="pun">...</span><span class="pln">
$ touch README
$ git add README
$ git commit </span><span class="pun">-</span><span class="pln">m </span><span class="str">&#39;第一次版本提交&#39;</span><span class="pln">
</span><span class="pun">[</span><span class="pln">master </span><span class="pun">(</span><span class="pln">root</span><span class="pun">-</span><span class="pln">commit</span><span class="pun">)</span><span class="pln"> </span><span class="lit">3b58100</span><span class="pun">]</span><span class="pln"> </span><span class="pun">第一次版本提交</span><span class="pln">
 </span><span class="lit">1</span><span class="pln"> file changed</span><span class="pun">,</span><span class="pln"> </span><span class="lit">0</span><span class="pln"> insertions</span><span class="pun">(+),</span><span class="pln"> </span><span class="lit">0</span><span class="pln"> deletions</span><span class="pun">(-)</span><span class="pln">
 create mode </span><span class="lit">100644</span><span class="pln"> README</span></pre>

<hr />
<p>Git 分支管理</p>

<p>列出分支</p>

<p>列出分支基本命令：</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">git branch</span></pre>

<p>没有参数时，<strong>git branch</strong> 会列出你在本地的分支。</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git branch
</span><span class="pun">*</span><span class="pln"> master</span></pre>

<p>此例的意思就是，我们有一个叫做 <strong>master</strong> 的分支，并且该分支是当前分支。</p>

<p>当你执行 <strong>git init</strong> 的时候，默认情况下 Git 就会为你创建 <strong>master</strong> 分支。</p>

<p>如果我们要手动创建一个分支。执行 <span class="marked">git branch (branchname)</span> 即可。</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git branch testing
$ git branch
</span><span class="pun">*</span><span class="pln"> master
  testing</span></pre>

<p>现在我们可以看到，有了一个新分支 <strong>testing</strong>。</p>

<p>当你以此方式在上次提交更新之后创建了新分支，如果后来又有更新提交， 然后又切换到了 <strong>testing</strong> 分支，Git 将还原你的工作目录到你创建分支时候的样子。</p>

<p>接下来我们将演示如何切换分支，我们用 git checkout (branch) 切换到我们要修改的分支。</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ ls
README
$ echo </span><span class="str">&#39;runoob.com&#39;</span><span class="pln"> </span><span class="pun">&gt;</span><span class="pln"> test</span><span class="pun">.</span><span class="pln">txt
$ git add </span><span class="pun">.</span><span class="pln">
$ git commit </span><span class="pun">-</span><span class="pln">m </span><span class="str">&#39;add test.txt&#39;</span><span class="pln">
</span><span class="pun">[</span><span class="pln">master </span><span class="lit">3e92c19</span><span class="pun">]</span><span class="pln"> add test</span><span class="pun">.</span><span class="pln">txt
 </span><span class="lit">1</span><span class="pln"> file changed</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> insertion</span><span class="pun">(+)</span><span class="pln">
 create mode </span><span class="lit">100644</span><span class="pln"> test</span><span class="pun">.</span><span class="pln">txt
$ ls
README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test</span><span class="pun">.</span><span class="pln">txt
$ git checkout testing
</span><span class="typ">Switched</span><span class="pln"> to branch </span><span class="str">&#39;testing&#39;</span><span class="pln">
$ ls
README</span></pre>

<p>当我们切换到 <strong>testing</strong> 分支的时候，我们添加的新文件 test.txt 被移除了。切换回 <strong>master</strong> 分支的时候，它们又重新出现了。</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git checkout master
</span><span class="typ">Switched</span><span class="pln"> to branch </span><span class="str">&#39;master&#39;</span><span class="pln">
$ ls
README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test</span><span class="pun">.</span><span class="pln">txt</span></pre>

<p>我们也可以使用 git checkout -b (branchname) 命令来创建新分支并立即切换到该分支下，从而在该分支中操作。</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git checkout </span><span class="pun">-</span><span class="pln">b newtest
</span><span class="typ">Switched</span><span class="pln"> to a </span><span class="kwd">new</span><span class="pln"> branch </span><span class="str">&#39;newtest&#39;</span><span class="pln">
$ git rm test</span><span class="pun">.</span><span class="pln">txt 
rm </span><span class="str">&#39;test.txt&#39;</span><span class="pln">
$ ls
README
$ touch runoob</span><span class="pun">.</span><span class="pln">php
$ git add </span><span class="pun">.</span><span class="pln">
$ git commit </span><span class="pun">-</span><span class="pln">am </span><span class="str">&#39;removed test.txt、add runoob.php&#39;</span><span class="pln">
</span><span class="pun">[</span><span class="pln">newtest c1501a2</span><span class="pun">]</span><span class="pln"> removed test</span><span class="pun">.</span><span class="pln">txt</span><span class="pun">、</span><span class="pln">add runoob</span><span class="pun">.</span><span class="pln">php
 </span><span class="lit">2</span><span class="pln"> files changed</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> deletion</span><span class="pun">(-)</span><span class="pln">
 create mode </span><span class="lit">100644</span><span class="pln"> runoob</span><span class="pun">.</span><span class="pln">php
 </span><span class="kwd">delete</span><span class="pln"> mode </span><span class="lit">100644</span><span class="pln"> test</span><span class="pun">.</span><span class="pln">txt
$ ls
README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;runoob</span><span class="pun">.</span><span class="pln">php
$ git checkout master
</span><span class="typ">Switched</span><span class="pln"> to branch </span><span class="str">&#39;master&#39;</span><span class="pln">
$ ls
README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test</span><span class="pun">.</span><span class="pln">txt
</span></pre>

<p>如你所见，我们创建了一个分支，在该分支上移除了一些文件 test.txt，并添加了 runoob.php 文件，然后切换回我们的主分支，删除的 test.txt 文件又回来了，且新增加的 runoob.php 不存在主分支中。</p>

<p>使用分支将工作切分开来，从而让我们能够在不同开发环境中做事，并来回切换。</p>

<h3>删除分支</h3>

<p>删除分支命令：</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">git branch </span><span class="pun">-</span><span class="pln">d </span><span class="pun">(</span><span class="pln">branchname</span><span class="pun">)</span></pre>

<p>例如我们要删除 testing 分支：</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git branch
</span><span class="pun">*</span><span class="pln"> master
  testing
$ git branch </span><span class="pun">-</span><span class="pln">d testing
</span><span class="typ">Deleted</span><span class="pln"> branch testing </span><span class="pun">(</span><span class="pln">was </span><span class="lit">85fc7e7</span><span class="pun">).</span><span class="pln">
$ git branch
</span><span class="pun">*</span><span class="pln"> master</span></pre>

<h3>分支合并</h3>

<p>一旦某分支有了独立内容，你终究会希望将它合并回到你的主分支。 你可以使用以下命令将任何分支合并到当前分支中去：</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">git merge</span></pre>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git branch
</span><span class="pun">*</span><span class="pln"> master
  newtest
$ ls
README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;test</span><span class="pun">.</span><span class="pln">txt
$ git merge newtest
</span><span class="typ">Updating</span><span class="pln"> </span><span class="lit">3e92c19.</span><span class="pun">.</span><span class="pln">c1501a2
</span><span class="typ">Fast</span><span class="pun">-</span><span class="pln">forward
 runoob</span><span class="pun">.</span><span class="pln">php </span><span class="pun">|</span><span class="pln"> </span><span class="lit">0</span><span class="pln">
 test</span><span class="pun">.</span><span class="pln">txt   </span><span class="pun">|</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> </span><span class="pun">-</span><span class="pln">
 </span><span class="lit">2</span><span class="pln"> files changed</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> deletion</span><span class="pun">(-)</span><span class="pln">
 create mode </span><span class="lit">100644</span><span class="pln"> runoob</span><span class="pun">.</span><span class="pln">php
 </span><span class="kwd">delete</span><span class="pln"> mode </span><span class="lit">100644</span><span class="pln"> test</span><span class="pun">.</span><span class="pln">txt
$ ls
README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;runoob</span><span class="pun">.</span><span class="pln">php
</span></pre>

<p>以上实例中我们将 newtest 分支合并到主分支去，test.txt 文件被删除。</p>

<p>合并完后就可以删除分支:</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git branch </span><span class="pun">-</span><span class="pln">d newtest
</span><span class="typ">Deleted</span><span class="pln"> branch newtest </span><span class="pun">(</span><span class="pln">was c1501a2</span><span class="pun">).</span></pre>

<p>删除后， 就只剩下 master 分支了：</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">$ git branch
</span><span class="pun">*</span><span class="pln"> master</span></pre>

