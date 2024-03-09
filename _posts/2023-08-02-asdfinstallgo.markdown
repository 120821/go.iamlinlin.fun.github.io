---
layout: post
title: "asdf install go"
date: "2023-08-02"
categories: 
---
<p>在使用go的时候，因为go不是使用asdf安装的，所以不能自动重新启动，为了方便使用，重新安装asdf的go.</p>

<p>1.安装Go插件</p>

<pre>
<code>asdf plugin add golang https://github.com/kennyp/asdf-golang.git</code></pre>

<p>2.更新插件列表</p>

<pre>
<code>asdf plugin update golang</code></pre>

<p>3.安装Go的1.18.3</p>

<pre>
<code>asdf install golang 1.18.3</code></pre>

<p>4.设置为全局使用</p>

<pre>
<code>asdf global golang 1.18.3</code></pre>

<p>5.查看go的位置和版本</p>

<pre>
<code>which go</code></pre>

<p>返回：</p>

<pre>
<code>which go

/home/linlin/.asdf/shims/go</code></pre>

<p>go version(此处，我没有正常显示，因为~/.bashrc文件定义了go的环境不是asdf的go,需要进行修改)</p>

<pre>
<code>go version

go: cannot find GOROOT directory: /workspace/coding_tools/go1-18/go</code></pre>

<p>修改为asdf go：</p>

<pre>
<code>asdf where golang 1.18.3

/home/linlin/.asdf/installs/golang/1.18.3</code></pre>

<p><code>asdf reshim golang 1.18.3</code></p>

<p>查看go的版本：（根据返回的结果，可知我还没修改好）</p>

<pre>
<code>go version

go: cannot find GOROOT directory: /workspace/coding_tools/go1-18/go</code></pre>

<pre>
<code>asdf where golang 1.18.3</code></pre>

<p>使用：</p>

<pre>
<code>export GOROOT=/home/linlin/.asdf/installs/golang/1.18.3</code></pre>

<p>再次查看：</p>

<pre>
<code>go version

go version go1.18.3 linux/amd64</code></pre>

<p>&nbsp;</p>

