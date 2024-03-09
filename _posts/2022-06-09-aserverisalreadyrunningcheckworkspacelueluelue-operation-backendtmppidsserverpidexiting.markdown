---
layout: post
title: "A server is already running. Check /workspace/lueluelue-operation-backend/tmp/pids/server.pid.Exiting"
date: "2022-06-09"
categories: 
---
<blockquote>
<p><span style="color:#4da8ee">bundle exec rails s -p 3030</span><br />
=&gt; Booting Puma<br />
=&gt; Rails 6.1.5 application starting in development<br />
=&gt; Run `bin/rails server --help` for more startup options<br />
<span style="color:#fe2c24">A server is already running. Check /workspace/lueluelue-operation-backend/tmp/pids/server.pid.<br />
Exiting</span><br />
<span style="color:#a2e043">sudo lsof -i:3030</span><br />
[sudo] password for linlin:<br />
<span style="color:#a2e043">telnet localhost 3030</span><br />
Trying 127.0.0.1...<br />
telnet: Unable to connect to remote host: Connection refused<br />
<span style="color:#a2e043">rm /workspace/lueluelue-operation-backend/tmp/pids/server.pid</span><br />
<span style="color:#38d8f0">bundle exec rails s -p 3030</span></p>
</blockquote>

