---
layout: post
title: "ubuntu sed命令来替换文件夹内的字符串"
date: "2023-10-23"
categories: 
---
<p>ubuntu, 在命令行，可以使用<code>sed</code>命令来替换文件夹内的字符串:</p>

<p>在文件夹内替换字符串http://abc.com为https://abc.com</p>

<pre>
<code>find /path/to/folder -<span style="color:#f5ab35">type</span> f -<span style="color:#f5ab35">exec</span> sed -i <span style="color:#abe338">&#39;s|http://abc.com|https://abc.com|g&#39;</span> {} +{% endhighlight %}

<p><code>/path/to/folder</code>替换为您要进行替换操作的文件夹,例如</p>

<p>find . -type f -exec sed -i &#39;s|http://xxx|https://xxx|g&#39; {} +</p>

