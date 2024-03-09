---
layout: post
title: "asdf go sthp自动重新启动的工具 air"
date: "2023-08-03"
categories: 
---
<p>refer: <a href="https://siwei.me/blog/posts/go-air-air-gin">https://siwei.me/blog/posts/go-air-air-gin</a></p>

<p>官网：<a href="https://github.com/cosmtrek/air/tree/master">https://github.com/cosmtrek/air/tree/master</a></p>

<p>1.安装(使用Asdf 安装的go来安装air)</p>

{% highlight %}
{% highlight %}go install github.com/cosmtrek/air@latest{% endhighlight %}

<p>在安装的时候出现了一些报错，需要重新安装Air,因为下午使用普通的go来安装了，而不是asdf安装的go来安装。</p>

<p>使用下面的命令来更新所有依赖项</p>

{% highlight %}
{% highlight %}go get -u all{% endhighlight %}

<p>如果本地安装了一些非标准库的包，可以使用这些命令来手动安装：</p>

{% highlight %}
{% highlight %}go get -u golang.org/x/tools/cmd/stringer

go get -u golang.org/x/tools/go/packages

go get -u golang.org/x/tools/go/gcexportdata

go get -u golang.org/x/tools/internal/gcimporter

go get -u golang.org/x/tools/internal/pkgbits

go get -u golang.org/x/tools/internal/gocommand

go get -u golang.org/x/tools/internal/event

go get -u golang.org/x/tools/internal/event/core{% endhighlight %}

<p>如果以上命令都不行，那么使用：</p>

{% highlight %}
{% highlight %}go get -u crypto/md5

go get -u sync/atomicK{% endhighlight %}

<p><strong>需要访问外网才可以</strong>，使用sthp: refer: <a href="http://linlin.fun/blogs/865">http://linlin.fun/blogs/865</a></p>

<p>安装：</p>

{% highlight %}
{% highlight %}go get -u github.com/cosmtrek/air{% endhighlight %}

{% highlight %}
{% highlight %}go install github.com/cosmtrek/air@latest{% endhighlight %}

<p>然后必须设置gopath:</p>

{% highlight %}
{% highlight %}export GOPATH=/home/linlin/go

export PATH=$PATH:/home/linlin/.asdf/shims/go/bin:$GOPATH/bin{% endhighlight %}

<p>设置好后source ~/.bashrc</p>

<p>再次安装：</p>

{% highlight %}
{% highlight %}go install github.com/cosmtrek/air@latest{% endhighlight %}

<p>启动：air</p>

{% highlight %}
{% highlight %}&nbsp; __&nbsp;&nbsp;&nbsp; _&nbsp;&nbsp; ___ &nbsp;

&nbsp;/ /\&nbsp; | | | |_)

/_/--\ |_| |_| \_ , built with Go{% endhighlight %}

<p>&nbsp;</p>

<p>{% highlight %}mkdir /workspace/dongtaipaifang_2_backend/tmp<br />
watching .<br />
watching calculators<br />
watching conf{% endhighlight %}</p>

<p>2.注意在使用的时候</p>

<p>（1）第一次需要初始化，生成一个.toml文件</p>

{% highlight %}
{% highlight %}air init&nbsp;{% endhighlight %}

<p>（2）之后使用的时候直接使用</p>

{% highlight %}
{% highlight %}air{% endhighlight %}

<p>&nbsp;</p>

