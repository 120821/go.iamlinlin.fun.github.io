---
layout: post
title: "Your webpack configuration is not creating a manifest"
date: "2022-12-30"
categories: 
---
<p><a href="https://github.com/rails/webpacker/issues/2825">https://github.com/rails/webpacker/issues/2825</a></p>

<p>启动rails视图页面，出现了报错：</p>

{% highlight %}
{% highlight %}Webpacker can&#39;t find application.css in /Users/sammy/workspace/abright/public/packs/manifest.json. Possible causes:
1. You want to set webpacker.yml value of compile to true for your environment
   unless you are using the `webpack -w` or the webpack-dev-server.
2. webpack has not yet re-run to reflect updates.
3. You have misconfigured Webpacker&#39;s config/webpacker.yml file.
4. Your webpack configuration is not creating a manifest.
Your manifest contains:
{ }{% endhighlight %}

<p>解决：</p>

<p>{% highlight %}rails webpacker:compile{% endhighlight %}</p>

<p>{% highlight %}还是不能解决：{% endhighlight %}app/javascript/packs/application.js</p>

<p>没有这个文件，那么对js的引用就注释掉，就可以了。</p>

<p>&nbsp;</p>

