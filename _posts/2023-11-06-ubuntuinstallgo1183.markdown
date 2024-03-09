---
layout: post
title: "ubuntu install go 1.18.3"
date: "2023-11-06"
categories: 
---
<p>&nbsp;</p>

<p>1.下载安装包</p>

{% highlight %}
{% highlight %}<span style="color:#ffd700">wget</span> https://golang.org/dl/go<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">18</span>.<span style="color:#f5ab35">3</span>.linux-amd<span style="color:#f5ab35">64</span>.tar.gz{% endhighlight %}

<p>2.解压缩</p>

{% highlight %}
{% highlight %}<span style="color:#ffd700">tar</span> -xvf go<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">18</span>.<span style="color:#f5ab35">3</span>.linux-amd<span style="color:#f5ab35">64</span>.tar.gz{% endhighlight %}

<p>3.移动到：</p>

{% highlight %}
{% highlight %}sudo mv go /usr/local{% endhighlight %}

<p>{% highlight %}4.修改环境配置{% endhighlight %}</p>

{% highlight %}
{% highlight %}~/.bashrc{% endhighlight %}

<p>增加go的环境变量和路径：</p>

{% highlight %}
{% highlight %}<span style="color:#f5ab35">export</span> <span style="color:#ffd700">GOPATH</span>=<span style="color:#ffa07a">$HOME</span>/go
<span style="color:#f5ab35">export</span> <span style="color:#ffd700">PATH</span>=/usr/local/go/bin:$PATH:$GOPATH/bin{% endhighlight %}

<p>{% highlight %}保存后，设置生效：{% endhighlight %}</p>

{% highlight %}
{% highlight %}source ~/.bashrc{% endhighlight %}

<p>{% highlight %}5.验证版本：{% endhighlight %}</p>

{% highlight %}
{% highlight %}go version{% endhighlight %}

