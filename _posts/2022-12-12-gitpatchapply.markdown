---
layout: post
title: "git patch/apply的使用"
date: "2022-12-12"
categories: 
---
<p>参考：<a href="https://siwei.me/blog/posts/apply-a-patch-generated-from-a-specific-commit">https://siwei.me/blog/posts/apply-a-patch-generated-from-a-specific-commit</a></p>
<p>当某个分支出现错误的时候，比如不能正常拉取或者push的时候，可以使用：</p>
{% highlight html %}$ git format-patch -1 &lt;sha&gt; &nbsp; # =&gt; &nbsp;0001__.patch{% endhighlight %}
{% highlight html %}$ git apply &lt;path_file&nbsp;&gt;{% endhighlight %}
