---
layout: post
title: "rails4.2 ActionController::RoutingError (No route matches [GET] "/favicon.ico"):"
date: "2022-11-30"
categories: 
---
<p><a href="https://blog.csdn.net/fantaxy025025/article/details/84543519">https://blog.csdn.net/fantaxy025025/article/details/84543519</a>&nbsp; <a href="https://ruby-china.org/topics/1229">https://ruby-china.org/topics/1229</a></p>

<p>出现问题的原因：</p>

<p>#1 生产环境下默认rails的server不作为静态资源服务<br />
#2 没有favicon文件</p>

<p>解决办法：</p>

<p>最好用nginx来统一处理静态资源，如下：</p>

<pre>
&nbsp;<code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; location ~* \.(ico)$&nbsp; {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root /projects/myproject/current/public;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gzip_static on; # to serve pre-gzipped version

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_header ETag &quot;&quot;;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expires max;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_header Cache-Control public;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</code></pre>

<p>或者增加图片favicon.ico，在application页面的head里增加，<a href="https://www.favicon.cc/">https://www.favicon.cc/</a>，可以手动进行制作图标，<a href="https://www.favicon.cc/?action=import_request">https://www.favicon.cc/?action=import_request</a>可以上传图片进行制作图标，制作后上传到assets目录，增加路径就好了</p>

<pre>
<code>&lt;link rel=&quot;icon&quot; href=&quot;favicon.ico&quot; type=&quot;image/x-icon&quot; /&gt;

&lt;link rel=&quot;shortcut icon&quot; href=&quot;favicon.ico&quot; type=&quot;image/x-icon&quot; /&gt;</code></pre>

