---
layout: post
title: "How to build a release version binary in Go"
date: "2023-07-25"
categories: 
---
<p>refer: <a href="https://stackoverflow.com/questions/29599209/how-to-build-a-release-version-binary-in-go">https://stackoverflow.com/questions/29599209/how-to-build-a-release-version-binary-in-go</a></p>

<p>使用命令（生成一个可执行文件）</p>

<pre>
<code>go build{% endhighlight %}

<p>然后把生成的可执行文件进行执行即可。</p>

<p>如果要在生产模式下执行，可以根据提示：</p>

<pre>
<code>[GIN-debug] [WARNING] Running in &quot;debug&quot; mode. Switch to &quot;release&quot; mode in production.

&nbsp;- using env:&nbsp;&nbsp; &nbsp;export GIN_MODE=release

&nbsp;- using code:&nbsp;&nbsp; &nbsp;gin.SetMode(gin.ReleaseMode){% endhighlight %}

<p>运行：</p>

<pre>
<code>export GIN_MODE=release{% endhighlight %}

<p>然后执行可执行文件即可。</p>

<p>&nbsp;</p>

