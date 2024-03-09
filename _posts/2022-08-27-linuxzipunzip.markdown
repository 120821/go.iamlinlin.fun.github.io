---
layout: post
title: "Linux zip unzip"
date: "2022-08-27"
categories: 
---
<p>将 /home/html/ 这个目录下所有文件和文件夹打包为当前目录下的 html.zip：</p>

{% highlight %}
{% highlight %}zip -q -r html.zip /home/html{% endhighlight %}
{% endhighlight %}

<p>如果在我们在 /home/html 目录下，可以执行以下命令：</p>

{% highlight %}
{% highlight %}zip -q -r html.zip *{% endhighlight %}
{% endhighlight %}

<p>从压缩文件 cp.zip 中删除文件 a.c</p>

{% highlight %}
{% highlight %}zip -dv cp.zip a.c{% endhighlight %}
{% endhighlight %}

<p>对于 Windows 下的常见压缩文件 .zip 和 .rar，Linux 也有相应的方法来解压它们：</p>

<p><strong>1) 对于 .zip</strong></p>

<p>linux 下提供了 zip 和 unzip 程序，zip 是压缩程序，unzip 是解压程序。它们的参数选项很多，这里只做简单介绍，依旧举例说明一下其用法：</p>

<pre class="prettyprint prettyprinted" style="">
{% highlight %}<span class="com"># zip all.zip *.jpg</span>{% endhighlight %}

<p>这条命令是将所有 .jpg 的文件压缩成一个 zip 包:</p>

<pre class="prettyprint prettyprinted" style="">
{% highlight %}<span class="com"># unzip all.zip</span>{% endhighlight %}

<p>这条命令是将 all.zip 中的所有文件解压出来。</p>

