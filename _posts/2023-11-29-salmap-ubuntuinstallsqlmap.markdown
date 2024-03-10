---
layout: post
title: "salmap - ubuntu install sqlmap"
date: "2023-11-29"
categories: 
---
<p>1.查看python的版本，并且更新依赖</p>
{% highlight html %}python3 --version{% endhighlight %}
<p>我得到了：</p>
{% highlight html %}<span style="color:#ffd700">Python</span> <span style="color:#f5ab35">3</span>.10.<span style="color:#f5ab35">12</span>{% endhighlight %}
<p>那么更新软件包列表：</p>
{% highlight html %}sudo apt update{% endhighlight %}
<p>2.安装sqlmap</p>
{% highlight html %}sudo apt install sqlmap{% endhighlight %}
<p>3.查看安装的版本：</p>
{% highlight html %}sqlmap <span style="color:#d4d0ab">--version</span>{% endhighlight %}
<p>得到了：</p>
{% highlight html %}sqlmap --version
1.6.4#stable
[09:09:05] [WARNING] your sqlmap version is outdated{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
