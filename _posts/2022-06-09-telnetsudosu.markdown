---
layout: post
title: "telnet 的基本用途和用法 切换用户sudo su"
date: "2022-06-09"
categories: 
---
<p>telnet 的基本用途和用法。 telnet &lt;ip&gt; &lt;port&gt; , telnet 192.168.5.1 5432 的意思： 看一下 192.168.5.1 的5432 端口的进程启动了没有</p> 
<blockquote> 
<p>telnet命令还可做确定远程服务的状态，比如确定远程服务器的某个端口是否能访问。</p> 
<p><strong>1．</strong><strong>命令格式：</strong></p> 
<p style="margin-left:21pt;">telnet[参数][主机]</p> 
<p><strong>2．</strong><strong>命令功能：</strong></p> 
<p style="margin-left:21pt;">执行telnet指令开启终端机阶段作业，并登入远端主机。</p> 
</blockquote> 
<p><strong>使用命令 $sudo su 可以用户的切换。</strong></p> 
<p><img alt="" height="367" src="https://img-blog.csdnimg.cn/104f60aa9fa84e40a5a233708d36ac06.png" width="963"></p> 
<p>root@11f55a91272d:/# apt update</p> 
<p>apt install net-tools</p> 
<p>ifconfig -a</p> 
<p>查看ip，然后就可以进行 telnet</p> 
<p><img alt="" height="585" src="https://img-blog.csdnimg.cn/e333f55af7474f17aaefa4463b081f44.png" width="1047"></p> 
<p><strong>telnet 172.17.0.2 5432</strong></p> 
<p>进行查看，<strong>端口的状态</strong>，可以看到，并没有创建连接</p> 
{% highlight html %}Trying 172.17.0.2...
telnet: Unable to connect to remote host: Connection refused
{% endhighlight %} 
<blockquote> 
<p><strong>3．</strong><strong>命令参数：</strong></p> 
<p style="margin-left:21pt;">-8 允许使用8位字符资料，包括输入与输出。</p> 
<p style="margin-left:21pt;">-a 尝试自动登入远端系统。</p> 
<p style="margin-left:21pt;">-b&lt;主机别名&gt; 使用别名指定远端主机名称。</p> 
<p style="margin-left:21pt;">-c 不读取用户专属目录里的.telnetrc文件。</p> 
<p style="margin-left:21pt;">-d 启动排错模式。</p> 
<p style="margin-left:21pt;">-e&lt;脱离字符&gt; 设置脱离字符。</p> 
<p style="margin-left:21pt;">-E 滤除脱离字符。</p> 
<p style="margin-left:21pt;">-f 此参数的效果和指定"-F"参数相同。</p> 
<p style="margin-left:21pt;">-F 使用Kerberos V5认证时，加上此参数可把本地主机的认证数据上传到远端主机。</p> 
<p style="margin-left:21pt;">-k&lt;域名&gt; 使用Kerberos认证时，加上此参数让远端主机采用指定的领域名，而非该主机的域名。</p> 
<p style="margin-left:21pt;">-K 不自动登入远端主机。</p> 
<p style="margin-left:21pt;">-l&lt;用户名称&gt; 指定要登入远端主机的用户名称。</p> 
<p style="margin-left:21pt;">-L 允许输出8位字符资料。</p> 
<p style="margin-left:21pt;">-n&lt;记录文件&gt; 指定文件记录相关信息。</p> 
<p style="margin-left:21pt;">-r 使用类似rlogin指令的用户界面。</p> 
<p style="margin-left:21pt;">-S&lt;服务类型&gt; 设置telnet连线所需的IP TOS信息。</p> 
<p style="margin-left:21pt;">-x 假设主机有支持数据加密的功能，就使用它。</p> 
<p style="margin-left:21pt;">-X&lt;认证形态&gt; 关闭指定的认证形态。</p> 
<p><strong>4．</strong><strong>使用实例：</strong></p> 
<p style="margin-left:21pt;"><strong>实例</strong><strong>1：</strong><strong>远程服务器无法访问</strong></p> 
<p style="margin-left:21pt;"><strong>命令：</strong></p> 
<p style="margin-left:21pt;">telnet 192.168.120.206</p> 
<p style="margin-left:21pt;"><strong>输出：</strong></p> 
<p style="margin-left:21pt;"></p> 
<div> 
<div>
[root@localhost ~]
<span style="color:rgba(0,128,0,1);">#</span>
<span style="color:rgba(0,128,0,1);"> telnet 192.168.120.209</span>
<br> Trying 192.168.120.209...
<br> telnet: connect to address 192.168.120.209: No route to host
<br> telnet: Unable to connect to remote host: No route to host
<br> [root@localhost ~]
<span style="color:rgba(0,128,0,1);">#</span> 
</div> 
</div> 
</blockquote>
