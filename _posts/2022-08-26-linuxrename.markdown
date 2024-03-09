---
layout: post
title: "linux rename命令批量修改文件名"
date: "2022-08-26"
categories: 
---
<p><a href="https://www.cnblogs.com/sddai/p/10274232.html">https://www.cnblogs.com/sddai/p/10274232.html</a></p>

<p><a href="https://phoenixnap.com/kb/rename-file-linux">https://phoenixnap.com/kb/rename-file-linux</a></p>

<p><a href="https://www.oschina.net/question/12_72277">https://www.oschina.net/question/12_72277</a></p>

<p>rename命令用字符串替换的方式批量改变文件名。<br />
格式：rename 原名 替换名 要改的文件<br />
原字符串：将文件名需要替换的字符串； 目标字符串：将文件名中含有的原字符替换成目标字符串； 文件：指定要改变文件名的文件列表。</p>

<pre>
<code class="language-text">[root@cache01 test]# ls 
01.txt  03.txt  05.txt  07.txt  09.txt
02.txt  04.txt  06.txt  08.txt  10.txt
[root@cache01 test]# rename txt jpg *
[root@cache01 test]# ls 
01.jpg  03.jpg  05.jpg  07.jpg  09.jpg
02.jpg  04.jpg  06.jpg  08.jpg  10.jpg{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">增加后缀：（）</div>

<pre class="prettyprint highlighter-hljs" has-selection="true" highlighted="true" name="code">
<code class="hljs livecodeserver has-numbering highlighter-hljs language-lua"><span class="hljs-built_in">rename</span> <span class="hljs-string">&#39;s/$/\.txt/&#39;</span> *{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code class="hljs livecodeserver has-numbering highlighter-hljs language-lua">修改后缀：</code></div>

<pre class="prettyprint highlighter-hljs" has-selection="true" highlighted="true" name="code">
<code class="hljs tex has-numbering highlighter-hljs language-lua"><span class="hljs-built_in">rename</span> <span class="hljs-string">&#39;s/\.txt/\.dat/&#39;</span> *{% endhighlight %}

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code class="hljs tex has-numbering highlighter-hljs language-lua">删除后缀：</code></div>

<pre>
<code>rename &#39;s/\.dat//&#39; *{% endhighlight %}

<p>1. rename后接一个正则表达式，是perl语法规则的，&lsquo;s/&rsquo; 是正则匹配的开始的意思，然后第一个／和第二个／之间的部分是被匹配内容，第二个／和第三个／之间是要替换成的内容。最后＊是对当前文件夹下&nbsp;<br />
所有文件进行匹配。&nbsp;<br />
2. $符号可以表示匹配最后一个位置（如增加后缀中），也可以表示捕获分组（如修改a为aa中）</p>

<p>&nbsp;</p>

