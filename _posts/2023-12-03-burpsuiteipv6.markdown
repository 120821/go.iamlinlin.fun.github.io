---
layout: post
title: "burp suite 不支持ipv6"
date: "2023-12-03"
categories: 
---
<p>如果使用ipv6，命令行会报错：</p>

<pre>
<code>java.net.SocketException: Permission denied{% endhighlight %}

<p>在浏览器也会报错：</p>

<pre>
<code>Burp proxy error: Permission denied: connect{% endhighlight %}

<p>可以设置对IPv4的指定：</p>

<pre>
<code>java -jar -Xmx2048M -Djava.net.preferIPv4Stack=true /your_burpsuite_path/burpsuite.jar{% endhighlight %}

<p>使用-Djava.net.preferIPv4Stack=true参数的设置，使用ipv4,ipv6会被禁用</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

