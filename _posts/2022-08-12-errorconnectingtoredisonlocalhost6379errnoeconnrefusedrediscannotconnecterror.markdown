---
layout: post
title: " Error connecting to Redis on localhost:6379 (Errno::ECONNREFUSED) (Redis::CannotConnectError)"
date: "2022-08-12"
categories: 
---
<p><a href="https://stackoverflow.com/questions/34729752/sidekiq-error-connecting-to-redis-on-127-0-0-16379-errnoeconnrefused-on-doc">https://stackoverflow.com/questions/34729752/sidekiq-error-connecting-to-redis-on-127-0-0-16379-errnoeconnrefused-on-doc</a></p>

<p>chatroom启动的时候，不能发送消息，然后服务器会自动断开，redis尚未成功使用，启动即可，然后继续rails s就可以发送即时消息了</p>

<pre class="lang-yaml s-code-block">
<code class="hljs language-yaml"><span class="hljs-string">redis-server</span></code></pre>

<p><img height="681" src="/uploads/ckeditor/pictures/210/image-20220812092444-1.png" width="1920" /></p>

