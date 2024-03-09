---
layout: post
title: "caddy  go install xcaddy"
date: "2022-11-03"
categories: 
---
<p><a href="http://siwei.me/blog/posts/ssl-caddy-wild-card-api-token">http://siwei.me/blog/posts/ssl-caddy-wild-card-api-token</a></p>

<p>如果是/opt/app目录下，注意进行用户的切换，安装的时候不要使用asdf安装caddy，不然cloudfile 的cdn不能使用，安装如下</p>

<p>例如：为了安装/opt/app/caddy</p>

<p>把go安装在/opt/app/go目录下</p>

<p>那么在/opt/app/go目录下</p>

<p>1. 下载go&nbsp; （把路径设置为安装的路径，不是asdf安装的路径，下载：<a href="https://go.dev/dl/">https://go.dev/dl/</a> ）</p>

<pre>
<code>wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz

tar zxvf ggo1.19.3.linux-amd64.tar.gz{% endhighlight %}

<p>添加go 命令到 $PATH中。</p>

<pre>
<code>#golang安装目录

export GOROOT=/opt/app/go/go

#gopath

export GOPATH=/opt/app

#go编译可执行文件

export GOBIN=$GOPATH/bin

export PATH=$GOPATH:$GOBIN:$GOROOT/bin:/opt/app/go/go:$PATH{% endhighlight %}

<p>2. 下载xcaddy</p>

<pre>
<code>go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest{% endhighlight %}

<p>3. 根据xcaddy来编译 caddy + cloudflare</p>

<pre>
<code>xcaddy build --with github.com/caddy-dns/cloudflare{% endhighlight %}

<p>这样一个新版的 caddy 就构建好了，放在当前目录下的 caddy文件夹中。</p>

<p>4. 重新运行caddy</p>

<p>5. 编辑Caddyfile</p>

