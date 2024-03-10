---
layout: post
title: "no acceptor (port is in use or requires root privileges) (RuntimeError)"
date: "2022-08-10"
categories: 
---
<p>参考：https://stackoverflow.com/questions/27851440/eventmachine-start-tcp-server-no-acceptor-port-is-in-use-or-requires-root</p>
<p>运行bundle exec ruby xxx.rb出现 了报错</p>
<p><img height="391" src="/uploads/ckeditor/pictures/180/image-20220810094040-2.png" width="1907" /></p>
<p>杀掉一个进程就可以了</p>
<p>&nbsp;ps ax | grep rails<br />
&nbsp;&nbsp; 5772 pts/5&nbsp;&nbsp;&nbsp; Sl+&nbsp;&nbsp;&nbsp; 0:03 puma 5.6.4 (tcp://localhost:3000) [rails_cable_test]<br />
&nbsp; 17731 pts/3&nbsp;&nbsp;&nbsp; S+&nbsp;&nbsp;&nbsp;&nbsp; 0:00 grep --color=auto rails<br />
linlin@linlin-i5:/workspace/eventmachine-websockets-demo$ kill 5772<br />
linlin@linlin-i5:/workspace/eventmachine-websockets-demo$ bundle exec ruby app.rb<br />
== Sinatra/1.4.3 has taken the stage on 3000 for development with backup from Thin<br />
&gt;&gt; Thin web server (v1.5.1 codename Straight Razor)<br />
&gt;&gt; Maximum connections set to 1024<br />
&gt;&gt; Listening on localhost:3000, CTRL+C to stop</p>
