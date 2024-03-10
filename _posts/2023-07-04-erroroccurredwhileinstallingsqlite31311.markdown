---
layout: post
title: "error occurred while installing sqlite3 (1.3.11)"
date: "2023-07-04"
categories: 
---
<p><a href="https://stackoverflow.com/questions/34171874/an-error-occurred-while-installing-sqlite3-1-3-11-and-bundler-cannot-continue">https://stackoverflow.com/questions/34171874/an-error-occurred-while-installing-sqlite3-1-3-11-and-bundler-cannot-continue</a></p>
<p>bundle install 的时候出现了问题：</p>
<p>{% highlight html %}An error occurred while installing sqlite3 (1.3.11), and Bundler cannot continue.<br />
Make sure that `gem install sqlite3 -v &#39;1.3.11&#39; --source &#39;https://rubygems.org/&#39;` succeeds before bundling.{% endhighlight %}</p>
<p>使用提示的`gem install sqlite3 -v &#39;1.3.11&#39; --source &#39;https://rubygems.org/&#39;` 并不能直接安装，需要使用以下命令然后继续bundle：</p>
{% highlight html %}sudo apt-get install -y sqlite3 libsqlite3-dev{% endhighlight %}
