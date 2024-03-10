---
layout: post
title: "git config name or email "
date: "2022-08-22"
categories: 
---
<p><a href="https://stackoverflow.com/questions/13103083/how-do-i-push-to-github-under-a-different-username">https://stackoverflow.com/questions/13103083/how-do-i-push-to-github-under-a-different-username</a></p>
{% highlight html %}在git commit的时候就已经确定用户和email是谁，那么想要修改用户和邮箱，就需要在提交之前进行设置。
进行查看当前用户和邮箱，以及修改用户和邮箱：
# you can check what&#39;s currently:
git config user.name
git config user.email
git config user.name &quot;your_github_username&quot;
git config user.email &quot;your_github_email&quot;
# Again check what&#39;s currently:
git config user.name
git config user.email{% endhighlight %}
<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">{% highlight html %}设置全局生效使用--global{% endhighlight %}</div>
{% highlight html %}<span class="comment-copy">{% highlight html %}git config --global user.name &quot;Mona Lisa&quot;{% endhighlight %}</span>{% endhighlight %}
