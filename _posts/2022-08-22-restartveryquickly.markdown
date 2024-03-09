---
layout: post
title: "快速重启的脚本 restart very quickly "
date: "2022-08-22"
categories: 
---
<p><a href="http://siwei.me/blog/posts/rails-restart-very-quickly">http://siwei.me/blog/posts/rails-restart-very-quickly</a></p>

{% highlight %}kill -9 `ps -ef | grep admin | grep 9701 | awk {&#39;print $2&#39;}`<br />
setsid nohup bundle exec puma -C config/puma.rb &amp;{% endhighlight %}

