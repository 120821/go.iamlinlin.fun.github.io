---
layout: post
title: "linux下的常用命令 ( widely used linux commands) "
date: "2022-08-22"
categories: 
---
<p>参考：<a href="http://siwei.me/blog/posts/linux-widely-used-linux-commands">http://siwei.me/blog/posts/linux-widely-used-linux-commands</a></p>

<p>参考：&nbsp;<a href="https://blog.csdn.net/li1325169021/article/details/90769601">https://blog.csdn.net/li1325169021/article/details/90769601</a></p>

<p>参考：&nbsp;<a href="https://blog.csdn.net/a272329874a/article/details/124187121">https://blog.csdn.net/a272329874a/article/details/124187121</a></p>

<pre class="hljs sql">
ls 列出目前工作目录所含之文件及子目录
mkdir -p 创建多级文件夹，例如： test01/test02/test03 mkdir -p test01/test02/test03
top 查看运行的所有进程 top之后按c 可以查看具体的位置， 按1，可以查看cup
ps aux <span class="hljs-comment">--sort rss  按照正序进行排列所有的进程 相反： ps aux --sort -rss 进程根据倒序进行排序</span>
df -kh    查看分区大小
du . -kh  查看文件夹大小
ln -s 为某一个文件在另外一个位置建立一个同步的链接。
  例如：
# 在当前路径下创建文件demo
touch demo
# 给demo文件创建链接文件名为ldemo
ln -s demo ldemo
# 修改ldemo链接文件的内容
ls &gt; ldemo
# 查看demo文件的内容是否同样变化&nbsp;&nbsp; &nbsp;
cat demo
# 修改 demo文件内容
ls -l &gt; demo
# 查看ldemo链接文件内容是否同样变化&nbsp;&nbsp; &nbsp;
cat ldemo
# 删除原文件，链接文件会失效&nbsp;&nbsp; &nbsp;
rm demo
<span class="hljs-operator"><span class="hljs-keyword">kill</span> -<span class="hljs-number">9 把某个进行的进程强制结束， ps -ef | grep &#39;ruby &#39; 查看ruby运行的进程，可以根据进程号进行选择结束</span>
crontab -e </span>linux自带的定时任务
</pre>

<p>Linux&nbsp;crontab&nbsp;是用来定期执行程序的命令。<a href="https://www.runoob.com/linux/linux-comm-crontab.html">参考</a></p>

<p>当安装完成操作系统之后，默认便会启动此任务调度命令。</p>

<p><strong>crond</strong>&nbsp;命令每分钟会定期检查是否有要执行的工作，如果有要执行的工作便会自动执行该工作。</p>

<p><strong>注意：</strong>新创建的 cron 任务，不会马上执行，至少要过 2 分钟后才可以，当然你可以重启 cron 来马上执行。</p>

<p>而 linux 任务调度的工作主要分为以下两类：</p>

<ul>
	<li>1、系统执行的工作：系统周期性所要执行的工作，如备份系统数据、清理缓存</li>
	<li>2、个人执行的工作：某个用户定期要做的工作，例如每隔 10 分钟检查邮件服务器是否有新信，这些工作可由每个用户自行设置</li>
</ul>

<pre class="hljs sql"><code>
<span class="hljs-operator">vim /etc/nginx 修改Nginx的配置等
tail 方便查看log tail -f xx.log 可以实时查看log，而且可以进行保存log文件
head </span>可用于查看文件的开头部分的内容，有一个常用的参数&nbsp;-n&nbsp;用于显示行数，默认为 10，即显示 10 行的内容，使用：{% endhighlight %}

{% highlight %}
head -n 10 runoon_notes.log{% endhighlight %}

<pre class="hljs sql"><code>
 <a href="https://www.runoob.com/linux/linux-comm-head.html">参考</a><span class="hljs-operator">
grep *** 重中之重啊。 一定要知道各种形式的参数， 以及各种变种。 比如：   $ grep -F <span class="hljs-string">&#39;fixed string&#39;</span> -R <span class="hljs-comment">--include=*rb</span>
zgrep 搜索 压缩文件的内容
find . 可以查看当前目录的所有文件， .表示当前文件夹
rsync  传送文件
sftp </span>ftp命令和sftp命令的用法基本相似连接ftp服务器并下载多个文件
例如：</code>
</pre>

<pre>
<code>$ ftp IP/hostname
ftp&gt; mget *.html{% endhighlight %}

<p>显示远程主机上文件列表</p>

<pre>
<code>ftp&gt; mls *.html -
/ftptest/features.html
/ftptest/index.html
/ftptest/othertools.html
/ftptest/samplereport.html
/ftptest/usage.html<span class="hljs-operator">
ssh 用于登录远程服务器
wget 用于获取文件
curl HTTP 请求
vim ~/.bashrc 设置环境
chmod </span>使用(更改用户)： <strong>sudo chown ubuntu:ubuntu . -R</strong><span class="hljs-operator"><strong>  </strong>
 理解：Ubuntu：Ubuntu（用户：用户组）
      . 表示当前目录
chown </span>用于设置文件所有者和文件关联组的命令
例如：将当前前目录下的所有文件与子目录的拥有者皆设为 runoob，群体的使用者 runoobgroup:
  chown -R runoob:runoobgroup *<span class="hljs-operator">
passwd 用来更改使用者的密码 <a href="https://www.runoob.com/linux/linux-comm-passwd.html">参考</a>
例如： </span>{% endhighlight %}

<pre>
<code># passwd runoob  //设置runoob用户的密码
Enter new UNIX password:  //输入新密码，输入的密码无回显
Retype new UNIX password:  //确认密码
passwd: password updated successfully
# 显示账号信息{% endhighlight %}

<pre>
<code># passwd -S runoob
runoob P 05/13/2010 0 99999 7 -1{% endhighlight %}

<p><code>删除用户密码</code></p>

<pre>
<code># passwd -d lx138 
passwd: password expiry information changed.</code><span class="hljs-operator">
netstat </span>用于显示网络状态 <a href="https://www.runoob.com/linux/linux-comm-netstat.html">参考</a><span class="hljs-operator">
ifconfig 查看网卡信息
</span>netconfig命令用于设置网络环境 <a href="https://www.runoob.com/linux/linux-comm-netconfig.html">参考</a><span class="hljs-operator">
top 命令 （进入之后的各种参数， 按c,<span class="hljs-number">1</span> )
各种服务器的命令： nginx -s reload|<span class="hljs-keyword">stop</span>,  rails <span class="hljs-keyword">server</span>...
tar zxvf 解压缩
unzip 解压缩
pwd 获知当前目录
cp -r 复制整个目录
mv 移动文件或者文件夹
删除大文件： $ echo <span class="hljs-string">&#39;&#39;</span> &gt; big_file
知道各个系统文件夹的基本用处。  /<span class="hljs-keyword">var</span>/<span class="hljs-keyword">logs</span>,  /etc/
关机，重启，登出：</span>{% endhighlight %}

{% highlight %}
shutdown -h now 关闭系统(1)
init 0 关闭系统(2)
telinit 0 关闭系统(3)
shutdown -h hours:minutes &amp; 按预定时间关闭系统
shutdown -c 取消按预定时间关闭系统
shutdown -r now 重启(1)
reboot 重启(2)
logout 注销
<span class="hljs-operator">高级的：
pipe     find . | grep <span class="hljs-string">&#39;.rb&#39;  查找当前目录下文件为.rb的所有文件</span>
logrotate </span>用于管理记录文件<span class="hljs-operator">
split </span>用于将一个文件分割成数个<a href="https://www.runoob.com/linux/linux-comm-split.html">参考
</a>例如：{% endhighlight %}

<p>使用指令&quot;split&quot;将文件&quot;README&quot;每6行切割成一个文件，输入如下命令：</p>

<pre>
<code>$ split -6 README       #将README文件每六行分割成一个文件 </code><span class="hljs-operator">
awk </span>是一种处理文本文件的语言，是一个强大的文本分析工具<a href="https://www.runoob.com/linux/linux-comm-awk.html">参考</a>
例如：
<span class="hljs-operator">用法1：
</span></pre>

<pre>
<code>awk &#39;{[pattern] action}&#39; {filenames}   # 行匹配语句 awk &#39;&#39; 只能用单引号{% endhighlight %}

<p>使用：</p>

<pre>
<code># 每行按空格或TAB分割，输出文本中的1、4项
 $ awk &#39;{print $1,$4}&#39; log.txt
 ---------------------------------------------
 2 a
 3 like
 This&#39;s
 10 orange,apple,mongo
 # 格式化输出
 $ awk &#39;{printf &quot;%-8s %-10s\n&quot;,$1,$4}&#39; log.txt
 ---------------------------------------------
 2        a
 3        like
 This&#39;s
 10       orange,apple,mongo{% endhighlight %}

<p>用法2：</p>

<pre>
<code>awk -F  #-F相当于内置变量FS, 指定分割字符{% endhighlight %}

<pre>
<code># 使用&quot;,&quot;分割
 $  awk -F, &#39;{print $1,$2}&#39;   log.txt
 ---------------------------------------------
 2 this is a test
 3 Do you like awk
 This&#39;s a test
 10 There are orange apple
 # 或者使用内建变量
 $ awk &#39;BEGIN{FS=&quot;,&quot;} {print $1,$2}&#39;     log.txt
 ---------------------------------------------
 2 this is a test
 3 Do you like awk
 This&#39;s a test
 10 There are orange apple
 # 使用多个分隔符.先使用空格分割，然后对分割结果再使用&quot;,&quot;分割
 $ awk -F &#39;[ ,]&#39;  &#39;{print $1,$2,$5}&#39;   log.txt
 ---------------------------------------------
 2 this test
 3 Are awk
 This&#39;s a
 10 There apple{% endhighlight %}

<p>用法3</p>

<pre>
<code>awk -v  # 设置变量{% endhighlight %}

<pre>
<code>$ awk -va=1 &#39;{print $1,$1+a}&#39; log.txt
 ---------------------------------------------
 2 3
 3 4
 This&#39;s 1
 10 11
 $ awk -va=1 -vb=s &#39;{print $1,$1+a,$1b}&#39; log.txt
 ---------------------------------------------
 2 3 2s
 3 4 3s
 This&#39;s 1 This&#39;ss
 10 11 10s{% endhighlight %}

<p>其它使用方法请点开参考文章详细查看。</p>

{% highlight %}
<span class="hljs-operator">bash script 写脚本的一些规范 <a href="https://blog.csdn.net/CSDN1887/article/details/86132955">参考</a>
expect </span>expect是一个自动化交互套件，主要应用于执行命令和程序时，系统以交互形式要求输入指定字符串，实现交互通信。<a href="https://m.php.cn/article/486909.html">详细的看这里</a>{% endhighlight %}

