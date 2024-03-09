---
layout: post
title: "go install"
date: "2022-10-09"
categories: 
---
<p>下载1.19 go ：<a href="https://go.dev/dl/go1.19.2.linux-amd64.tar.gz">https://go.dev/dl/go1.19.2.linux-amd64.tar.gz</a></p>

<p>解压缩：tar zxvf go1.19.1.linux-amd64.tar.gz</p>

<p><img height="124" src="/uploads/ckeditor/pictures/545/image-20221009174303-3.png" width="654" /></p>

<p>修改配置文件：（source ~/.bashrc）<br />
~/.bashrc</p>

<p>138 export GOROOT=/workspace/coding_tools/go/go #golang安装目录<br />
139 export GOPATH=$HOME #gopath<br />
140 export GOBIN=$GOROOT/go/bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #go编译可执行文件</p>

<p>把文件夹的1.18删除了，解压缩了1.19，然后安装gin</p>

<p><img height="143" src="/uploads/ckeditor/pictures/546/image-20221009174442-4.png" width="929" /></p>

<p>创建文件：</p>

<pre><code>package main

import (<br />
&nbsp; &quot;net/http&quot;

&nbsp; &quot;github.com/gin-gonic/gin&quot;<br />
)

func main() {<br />
&nbsp; r := gin.Default()<br />
&nbsp; r.GET(&quot;/ping&quot;, func(c *gin.Context) {<br />
&nbsp;&nbsp;&nbsp; c.JSON(http.StatusOK, gin.H{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;message&quot;: &quot;pong&quot;,<br />
&nbsp;&nbsp;&nbsp; })<br />
&nbsp; })<br />
&nbsp; r.Run() // listen and serve on 0.0.0.0:8080 (for windows &quot;localhost:8080&quot;)<br />
}</code></pre>

<pre><code># run example.go and visit 0.0.0.0:8080/ping (for windows &quot;localhost:8080/ping&quot;) on browser<br />
$ go run example.go</code></pre>

<p>&nbsp;</p>

