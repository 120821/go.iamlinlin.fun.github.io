---
layout: post
title: "curl 保存css或者js"
date: "2023-05-05"
categories: 
---
<div id="rtf1268">
<div>
<p>要使用curl保存CSS或JS文件，可以使用以下命令：</p>

<ol>
	<li>下载CSS文件：</li>
</ol>

<pre>
<code>curl -o style.css https://example.com/style.css</code></pre>

<p>这将下载一个来自<a href="https://example.com/style.css%E7%9A%84CSS%E6%96%87%E4%BB%B6%EF%BC%8C%E5%B9%B6%E5%B0%86%E5%85%B6%E4%BF%9D%E5%AD%98%E4%B8%BA%E5%BD%93%E5%89%8D%E7%9B%AE%E5%BD%95%E4%B8%8B%E7%9A%84style.css%E6%96%87%E4%BB%B6%E3%80%82%E5%A6%82%E6%9E%9C%E6%82%A8%E6%83%B3%E6%8C%87%E5%AE%9A%E5%8F%A6%E4%B8%80%E4%B8%AA%E7%9B%AE%E5%BD%95%EF%BC%8C%E8%AF%B7%E6%8F%90%E4%BE%9B%E8%AF%A5%E7%9B%AE%E5%BD%95%E7%9A%84%E5%AE%8C%E6%95%B4%E8%B7%AF%E5%BE%84%E3%80%82">https://example.com/style.css的CSS文件，并将其保存为当前目录下的style.css文件。如果您想指定另一个目录，请提供该目录的完整路径。</a></p>

<ol start="2">
	<li>下载JavaScript文件：</li>
</ol>

<pre>
<code>curl -o script.js https://example.com/script.js</code></pre>

<p>这将下载一个来自<a href="https://example.com/script.js%E7%9A%84JavaScript%E6%96%87%E4%BB%B6%EF%BC%8C%E5%B9%B6%E5%B0%86%E5%85%B6%E4%BF%9D%E5%AD%98%E4%B8%BA%E5%BD%93%E5%89%8D%E7%9B%AE%E5%BD%95%E4%B8%8B%E7%9A%84script.js%E6%96%87%E4%BB%B6%E3%80%82">https://example.com/script.js的JavaScript文件，并将其保存为当前目录下的script.js文件。</a></p>

<p>您还可以使用-c参数追踪Cookies，并使用#号指定要保存的文件名。例如：</p>

<pre>
<code>curl -c cookies.txt -o style.css# https://example.com/style.css</code></pre>

<p>这将下载CSS文件和Cookies，并将其保存在当前目录下的style.css文件和cookies.txt文件中。</p>
</div>
</div>

