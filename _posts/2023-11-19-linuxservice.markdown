---
layout: post
title: "linux service 自启动"
date: "2023-11-19"
categories: 
---
<p>refer： <a href="https://blog.csdn.net/dreamstar613/article/details/124063201">https://blog.csdn.net/dreamstar613/article/details/124063201</a></p>

<p>1 需要编辑文件：</p>

<pre>
<code><span style="color:#f5ab35">#</span> 编辑服务单元文件
sudo vim /etc/systemd/system/myservice.service</code></pre>

<p>内容如下：</p>

<pre>
<code>[Unit]
Description=My Service
After=network.target

[Service]
ExecStart=/path/to/your/service
Type=simple

[Install]
WantedBy=multi-user.target</code></pre>

<p>例如：</p>

<pre>
<code>[Unit]

Description=My Service Start Trojan

After=network.target</code></pre>

<p>&nbsp;</p>

<p>[Service]<br />
WorkingDirectory=/workspace/coding_tools/trojan/<br />
ExecStart=/workspace/coding_tools/trojan/trojan<br />
Type=simple [Install]<br />
WantedBy=multi-user.target</p>

<p>2.保存好，重新加载：</p>

<pre>
<code>sudo systemctl daemon-reload</code></pre>

<p>3.启动：</p>

<pre>
<code>sudo systemctl enable myservice</code></pre>

<p>手动启动：</p>

<pre>
<code>sudo systemctl start myservice</code></pre>

<p>手动停止：</p>

<pre>
<code>sudo systemctl stop myservice</code></pre>

<p>重启：</p>

<pre>
<code>sudo systemctl restart myservice</code></pre>

<p>查看状态：</p>

<pre>
<code>sudo systemctl status myservice</code></pre>

<p>不能这样写：</p>

<pre>
<code><span style="color:#00e0e0">[Unit]</span>
Description=My Service Start Trojan
After=network.target

<span style="color:#00e0e0">[Service]</span>
ExecStart=/home/linlin/trojan
Type=simple

<span style="color:#00e0e0">[Install]</span>
WantedBy=multi-user.target</code></pre>

<p>因为我的可执行文件start_trojan是一个需要到文件夹后在执行的文件：service是需要绝对路径，而不是相对路径。参考：<a href="https://blog.csdn.net/dreamstar613/article/details/124063201">https://blog.csdn.net/dreamstar613/article/details/124063201</a></p>

<p>如果没有启动成功，使用命令查看日志：</p>

<p><code>journalctl -u myservice</code></p>

<p>修改文件后，需要重启：</p>

<pre>
<code>sudo<span style="color:#dcc6e0"> system</span>ctl daemon-reload
sudo<span style="color:#dcc6e0"> system</span>ctl start myservice</code></pre>

<p>例如我终于成功后：</p>

<pre>
<code>sudo systemctl daemon-reload

sudo systemctl start myservice

linlin@linlin-i5:/workspace/coding_tools/trojan$ lsof -i:1090

COMMAND&nbsp;&nbsp;&nbsp; PID&nbsp;&nbsp; USER&nbsp;&nbsp; FD&nbsp;&nbsp; TYPE DEVICE SIZE/OFF NODE NAME

firefox-b 6553 linlin&nbsp;&nbsp; 68u&nbsp; IPv4 558344&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:40500-&gt;localhost:1090 (ESTABLISHED)

firefox-b 6553 linlin&nbsp;&nbsp; 91u&nbsp; IPv4 548605&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:40508-&gt;localhost:1090 (ESTABLISHED)

firefox-b 6553 linlin&nbsp;&nbsp; 96u&nbsp; IPv4 568903&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0t0&nbsp; TCP localhost:40512-&gt;localhost:1090 (ESTABLISHED)</code></pre>

<p>可以看到之前失败的日志还保存着：</p>

<pre>
<code>journalctl -u myservice

11月 19 14:08:37 linlin-i5 systemd[1]: Started My Service Start Trojan.

11月 19 14:08:37 linlin-i5 systemd[1112]: myservice.service: Failed to execute /home/linlin/start_trojan: Exec format error

11月 19 14:08:37 linlin-i5 systemd[1112]: myservice.service: Failed at step EXEC spawning /home/linlin/start_trojan: Exec format error

11月 19 14:08:37 linlin-i5 systemd[1]: myservice.service: Main process exited, code=exited, status=203/EXEC

11月 19 14:08:37 linlin-i5 systemd[1]: myservice.service: Failed with result &#39;exit-code&#39;.

11月 19 14:14:37 linlin-i5 systemd[8718]: myservice.service: Failed to execute /home/linlin/start_trojan: Exec format error

11月 19 14:14:37 linlin-i5 systemd[8718]: myservice.service: Failed at step EXEC spawning /home/linlin/start_trojan: Exec format error

11月 19 14:14:37 linlin-i5 systemd[1]: Started My Service Start Trojan.

11月 19 14:14:37 linlin-i5 systemd[1]: myservice.service: Main process exited, code=exited, status=203/EXEC

11月 19 14:14:37 linlin-i5 systemd[1]: myservice.service: Failed with result &#39;exit-code&#39;.

11月 19 14:16:15 linlin-i5 systemd[8763]: myservice.service: Failed to execute /home/linlin/start_trojan: Exec format error

11月 19 14:16:15 linlin-i5 systemd[8763]: myservice.service: Failed at step EXEC spawning /home/linlin/start_trojan: Exec format error

11月 19 14:16:15 linlin-i5 systemd[1]: Started My Service Start Trojan.

11月 19 14:16:15 linlin-i5 systemd[1]: myservice.service: Main process exited, code=exited, status=203/EXEC

11月 19 14:16:15 linlin-i5 systemd[1]: myservice.service: Failed with result &#39;exit-code&#39;.

11月 19 14:16:30 linlin-i5 systemd[1]: Started My Service Start Trojan.

11月 19 14:16:30 linlin-i5 trojan[8823]: Welcome to trojan 1.16.0

11月 19 14:16:30 linlin-i5 trojan[8823]: [2023-11-19 14:16:30] [FATAL] fatal: config.json: cannot open file

11月 19 14:16:30 linlin-i5 trojan[8823]: [2023-11-19 14:16:30] [FATAL] exiting. . .

11月 19 14:16:30 linlin-i5 systemd[1]: myservice.service: Main process exited, code=exited, status=1/FAILURE

11月 19 14:16:30 linlin-i5 systemd[1]: myservice.service: Failed with result &#39;exit-code&#39;.

11月 19 14:18:37 linlin-i5 systemd[1]: Started My Service Start Trojan.

11月 19 14:18:37 linlin-i5 trojan[8887]: Welcome to trojan 1.16.0

11月 19 14:18:37 linlin-i5 trojan[8887]: [2023-11-19 14:18:37] [WARN] trojan service (client) started at 127.0.0.1:1090

11月 19 14:18:38 linlin-i5 trojan[8887]: [2023-11-19 14:18:38] [ALL] 127.0.0.1:40500 incoming connection

11月 19 14:18:38 linlin-i5 trojan[8887]: [2023-11-19 14:18:38] [INFO] 127.0.0.1:40500 requested connection to tch271958.tch.poe.com:443

11月 19 14:18:38 linlin-i5 trojan[8887]: [2023-11-19 14:18:38] [ALL] 127.0.0.1:40500 demo2.nextc1oud.com is resolved to 154.39.65.3</code></pre>

<p>&nbsp;</p>

