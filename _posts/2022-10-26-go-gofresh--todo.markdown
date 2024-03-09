---
layout: post
title: "go -Go 热加载之 fresh -- TODO"
date: "2022-10-26"
categories: 
---
<p><a href="https://juejin.cn/post/7133507084381306911">https://juejin.cn/post/7133507084381306911</a></p>

<p>热加载是指可以在不重启服务的情况下，保存后即可让更改的代码生效的一种开发模式。热加载可以显著的提升开发和调试的效率，有了热加载后，说明你不用重新再编译、再执行了。特别是涉及到效果渲染，如前端的开发中，如果每次改了代码后都要重新编译再执行，那开发效率太低了</p>

<p>首先确保你已经安装好了 Go 的环境 (Go 环境的安装特别简单)，然后安装 fresh</p>

<pre>
<code class="hljs language-shell copyable" lang="shell">go get github.com/pilu/fresh</code></pre>

<p><code class="hljs language-shell copyable" lang="shell">使用：</code>直接用<code>fresh</code> 替换原来的 <code>go run main.go</code></p>

<p>例如： go run main.go (需要修改后重启，才可以进行变化的查看）</p>

<p>使用fresh（不需要重启就看得到变化）</p>

<p>如果找不到命令：</p>

<p>fresh: command not found</p>

<pre>
<code class="hljs language-shell copyable" lang="shell">sudo ln -s ~/go/bin/fresh /usr/bin</code></pre>

<p><img height="63" src="/uploads/ckeditor/pictures/656/image-20221026145505-1.png" width="872" /></p>

<p>&nbsp;</p>

