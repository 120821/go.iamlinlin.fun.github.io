---
layout: post
title: "burpsuite 设置JVM内存 大小"
date: "2023-12-03"
categories: 
---
<p>启动burpsuite默认使用64m,但是如果渗透的时候，有成千上万个请求通过burpsuite可能会导致burpsuite内存不足崩溃，所以需要设置内存：</p>

<p>一般设置为2g，如果电脑的内存足够，可以使用4g,或者电脑的内存很小，可以分配128m,例如：</p>

<pre>
<code>java -jar -Xmx2048M /your_burpsuite_path/burpsuite.jar</code></pre>

<p>参数-Xmx可以指定JVM的最大内存，单位是M或者G，如果使用G为单位，例如：</p>

<pre>
<code>java -jar -Xmx2G /your_burpsuite_path/burpsuite.jar</code></pre>

