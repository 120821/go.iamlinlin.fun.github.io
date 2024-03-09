---
layout: post
title: "windows install go"
date: "2023-02-09"
categories: 
---
<p>refer: <a href="https://wangzijia.blog.csdn.net/article/details/128336092?spm=1001.2014.3001.5506">https://wangzijia.blog.csdn.net/article/details/128336092?spm=1001.2014.3001.5506</a></p>

<p>1.下载<a href="https://golang.google.cn/dl/">https://golang.google.cn/dl/</a>， 点击安装。</p>

<p>2.进入cmd进行查看go的版本，用来查看是否安装成功.显示了版本号码就是安装成功。</p>

<p><code>go version</code></p>

<p>3.查看go的环境变量：</p>

<pre>
<code>go env{% endhighlight %}

<p>4.进入gopath，没有go文件夹，就创建go文件夹。</p>

<p>5.进入gopath创建三个文件夹：bin, pkg , src。</p>

<p>bin是管理你的一些命令的， pkg是管理包的，src才是你能正常写代码的地方。</p>

<p>6.系统环境变量中添加bin目录。</p>

<p>7.创建模块管理文件：go.mod</p>

<pre>
<code>go mod init src{% endhighlight %}

<p>8.在src目录下再创建俩个文件夹，一个叫main,一个叫tool。</p>

<pre>
<code>cd src{% endhighlight %}

<pre>
<code>mkdir main tool{% endhighlight %}

<p>9.在main文件夹写第一个测试文件hello_world.go：</p>

<pre>
<code>cat hello_world.go

package main{% endhighlight %}

<pre>
<code>import &quot;fmt&quot;

func main(){

&nbsp; fmt.Println(&quot;hello world&quot;)

&nbsp; fmt.Println(&quot;first commit&quot;)

}{% endhighlight %}

<p>10.运行hello_world.go</p>

<pre>
<code>go run hello_world.go{% endhighlight %}

<p>返回结果：</p>

<pre>
<code>hello_world{% endhighlight %}

<p>&nbsp;</p>

