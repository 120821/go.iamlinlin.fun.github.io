---
layout: post
title: "tail linux 的使用"
date: "2022-08-18"
categories: 
---
<p><a href="https://www.runoob.com/linux/linux-comm-tail.html">tail </a></p>

<p>tail 命令可用于查看文件的内容，有一个常用的参数 <span class="marked">-f</span> 常用于查阅正在改变的日志文件。</p>

<p><span class="marked">tail -f filename</span> 会把 filename 文件里的最尾部的内容显示在屏幕上，并且不断刷新，只要 filename 更新就可以看到最新的文件内容。</p>

<pre class="prettyprint prettyprinted" style="">
<code><span class="pln">tail </span><span class="pun">[参数]</span><span class="pln"> </span><span class="pun">[文件]</span><span class="pln">  </span>{% endhighlight %}

<ul>
	<li>-f 循环读取</li>
	<li>-q 不显示处理信息</li>
	<li>-v 显示详细的处理信息</li>
	<li>-c&lt;数目&gt; 显示的字节数</li>
	<li>-n&lt;行数&gt; 显示文件的尾部 n 行内容</li>
	<li>--pid=PID 与-f合用,表示在进程ID,PID死掉之后结束</li>
	<li>-q, --quiet, --silent 从不输出给出文件名的首部</li>
	<li>-s, --sleep-interval=S 与-f合用,表示在每次反复的间隔休眠S秒</li>
</ul>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">tail notes</span><span class="pun">.</span><span class="pln">log         </span><span class="com"># 默认显示最后 10 行</span></pre>

<p>跟踪名为 notes.log 的文件的增长情况（Ctrl c 停止）</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">tail </span><span class="pun">-</span><span class="pln">f notes</span><span class="pun">.</span><span class="pln">log</span></pre>

<p>显示文件 notes.log 的内容，从第 20 行至文件末尾:</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">tail </span><span class="pun">-</span><span class="pln">n </span><span class="pun">+</span><span class="lit">20</span><span class="pln"> notes</span><span class="pun">.</span><span class="pln">log</span></pre>

<p>显示文件 notes.log 的最后 10 个字符:</p>

<pre class="prettyprint prettyprinted" style="">
<span class="pln">tail </span><span class="pun">-</span><span class="pln">c </span><span class="lit">10</span><span class="pln"> notes</span><span class="pun">.</span><span class="pln">log</span></pre>

