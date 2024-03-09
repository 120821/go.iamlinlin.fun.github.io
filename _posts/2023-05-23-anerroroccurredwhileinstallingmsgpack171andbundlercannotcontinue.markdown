---
layout: post
title: "An error occurred while installing msgpack (1.7.1), and Bundler cannot continue. "
date: "2023-05-23"
categories: 
---
<p>您可以尝试以下解决方法：</p>

<ol>
	<li>
	<p>确认您的系统中是否安装了msgpack的依赖库：libmsgpack-dev。如果没有安装，请使用以下命令安装:</p>

	<pre>
<code>sudo apt-get install -y libmsgpack-dev{% endhighlight %}
	</li>
	<li>
	<p>尝试使用以下命令重新安装msgpack:（亲测有效）</p>

	<pre>
<code>gem install msgpack -- --with-cflags=&quot;-std=c99&quot;{% endhighlight %}
	</li>
	<li>
	<p>清除bundle缓存，然后重新安装:</p>

	<pre>
<code>bundle clean --force
bundle install{% endhighlight %}
	</li>
</ol>

<p>如果以上方法无法解决问题，您也可以尝试使用其他版本的msgpack或升级您的Bundler版本。</p>

