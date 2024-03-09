---
layout: post
title: "SCP Remote to Local"
date: "2022-06-24"
categories: 
---
<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><a href="https://unix.stackexchange.com/questions/188285/how-to-copy-a-file-from-a-remote-server-to-a-local-machine"><code>参考：</code></a><br />
<code>scp username@ipaddress:pathtofile localsystempath</code></div>

<pre class="language-bash">
<code class="language-bash">scp [OPTIONS] [[user@]src_host:]file1 [[user@]dest_host:]file2
{% endhighlight %}

<ul>
	<li><code>scp</code><font style="vertical-align:inherit">- 它初始化命令并确保安全外壳到位。 </font></li>
	<li><code>OPTIONS</code><font style="vertical-align:inherit">- 他们根据使用方式授予不同的权限。 一些最常见的选项包括： </font></li>
	<li><strong><strong><font style="vertical-align:inherit">P </font></strong></strong><font style="vertical-align:inherit">(Caps) - 指定与远程主机建立连接的端口。 </font></li>
	<li><strong><strong><font style="vertical-align:inherit">p </font></strong></strong><font style="vertical-align:inherit">（小写） - 保留时间戳以便于修改和访问。 </font></li>
	<li><strong><strong><font style="vertical-align:inherit">r </font></strong></strong><font style="vertical-align:inherit">- 递归复制整个目录 </font></li>
	<li><strong><strong><font style="vertical-align:inherit">q </font></strong></strong><font style="vertical-align:inherit">- 安静地复制文件，不显示进度消息。 也称为安静模式。 </font></li>
	<li><strong><strong><font style="vertical-align:inherit">C </font></strong></strong><font style="vertical-align:inherit">- 用于在传输过程中压缩数据。 </font><br />
	<font style="vertical-align:inherit">要了解有关 OPTIONS 的更多信息，请阅读 </font><a href="https://linux.die.net/man/1/scp"><font style="vertical-align:inherit">scp options </font></a></li>
	<li><code>src_host</code><font style="vertical-align:inherit">- 文件所在的位置。 源可以是客户端或服务器，具体取决于文件的来源。 </font></li>
	<li><code>dest_host</code><font style="vertical-align:inherit">- 文件将被复制到的位置。 </font></li>
</ul>

