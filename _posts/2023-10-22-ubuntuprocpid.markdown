---
layout: post
title: "Ubuntu /proc/pid 的使用"
date: "2023-10-22"
categories: 
---
<p><a href="https://blog.csdn.net/shenhuxi_yu/article/details/79697792">https://blog.csdn.net/shenhuxi_yu/article/details/79697792</a></p>
<div class="Message_row__ug_UU">
<div class="Message_botMessageBubble__aYctV">
<div class="Markdown_markdownContainer__Tz3HQ">
<p>{% highlight html %}/proc/pid{% endhighlight %} 显示有关正在运行的进程的信息。 &quot;pid&quot; 是进程的ID。</p>
<p>cd&nbsp; {% highlight html %}/proc/pid{% endhighlight %}</p>
<p>可以获取有关特定进程的各种信息，包括进程的状态、内存映射、打开的文件和目录、网络状态等。</p>
<p>用法：</p>
<ol>
<li>
<p><strong>查看进程状态：</strong> 读取 {% highlight html %}/proc/pid/status{% endhighlight %} 文件来获取有关进程的一般状态信息，如进程 ID、父进程 ID、进程状态（运行、睡眠、停止等）、进程所属用户等。</p>
</li>
<li>
<p><strong>查看进程的命令行参数：</strong> 进程的命令行参数可以在 {% highlight html %}/proc/pid/cmdline{% endhighlight %} 文件中找到。它以 NULL 字符（\0）分隔的字符串形式存储。</p>
</li>
<li>
<p><strong>查看进程的打开文件：</strong> {% highlight html %}/proc/pid/fd{% endhighlight %} 目录下包含了进程打开的文件描述符的符号链接。您可以查看这些符号链接来获取有关进程打开的文件的信息，如文件路径、文件类型等。</p>
</li>
<li>
<p><strong>查看进程的内存映射：</strong> {% highlight html %}/proc/pid/maps{% endhighlight %} 文件提供了进程的内存映射信息，包括代码段、数据段、共享库、堆栈等。这对于分析进程的内存使用情况非常有用。</p>
</li>
<li>
<p><strong>发送信号给进程：</strong> 将信号发送给进程，通过向 {% highlight html %}/proc/pid/signal{% endhighlight %} 文件写入相应的信号值。</p>
</li>
</ol>
<p>{% highlight html %}/proc/pid{% endhighlight %} 中的文件是虚拟的，并不实际存储在磁盘上，而是在运行时动态生成的。</p>
<p>{% highlight html %}/proc{% endhighlight %} 文件系统在不同的操作系统中可能会有所差异。</p>
</div>
</div>
</div>
