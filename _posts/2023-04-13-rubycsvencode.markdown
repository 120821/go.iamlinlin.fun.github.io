---
layout: post
title: "ruby csv encode"
date: "2023-04-13"
categories: 
---
<p><a href="https://ruby-doc.org/core-2.5.0/Encoding.html">https://ruby-doc.org/core-2.5.0/Encoding.html</a></p>

<p>file.encode的使用：</p>

<p>如果不使用`file.encode(&#39;utf-8&#39;, &#39;utf-8&#39;)`，可以尝试使用其他编码方式来转换文件内容，例如：</p>

<pre>
<code>send_data file.encode(&#39;gbk&#39;), :type =&gt; &#39;text/csv; charset=gbk; header=present&#39;, :disposition =&gt; &quot;attachment&quot;</code></pre>

<p>这里使用了GBK编码来转换文件内容。如果原始文件内容已经是UTF-8编码，可以直接将编码方式改为UTF-8，如下所示：</p>

<pre>
<code>send_data file, :type =&gt; &#39;text/csv; charset=utf-8; header=present&#39;, :disposition =&gt; &quot;attachment&quot;</code></pre>

<p>这将直接将原始的UTF-8编码文件内容发送给浏览器。</p>

<p>错误的写法：`file.encode(&#39;utf-8&#39;, &#39;utf-8&#39;)`</p>

<p>解释：</p>

<p>`file.encode(&#39;utf-8&#39;, &#39;utf-8&#39;)`的作用是将文件内容按照UTF-8编码格式进行编码。其参数含义如下：</p>

<p>- 第一个参数：表示目标编码，即将原始编码格式的文件内容转换为UTF-8编码格式。<br />
- 第二个参数：表示源编码，即原始文件内容的编码格式是什么，这里指定为UTF-8。</p>

<p>`send_data`方法的作用是将数据发送给浏览器进行下载。整个语句的含义是将经过UTF-8编码的文件内容以文本CSV格式进行发送，文件名默认为&quot;attachment&quot;。具体参数含义如下：</p>

<p>- `file.encode(&#39;utf-8&#39;, &#39;utf-8&#39;)`：经过UTF-8编码的文件内容。<br />
- `:type =&gt; &#39;text/csv; charset=utf-8; header=present&#39;`：表示文件类型为文本CSV，编码格式为UTF-8。<br />
- `:disposition =&gt; &quot;attachment&quot;`：表示将文件作为附件进行下载。也可以使用`:inline`表示在浏览器中直接打开文件。</p>

<p>综合而言，这段代码的作用就是将CSV文件发送给浏览器进行下载，并确保文件内容的编码格式为UTF-8。</p>

<p>应该修改为：</p>

<pre>
<code>file， :type =&gt; &#39;text/csv; charset=utf-8; header=present&#39;, :disposition =&gt; &quot;attachment</code></pre>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

