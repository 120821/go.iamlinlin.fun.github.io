---
layout: post
title: "ubuntu cocker install patator"
date: "2023-12-01"
categories: 
---
<p>1.查看有哪些版本：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %}<span style="color:#ffd700">docker</span> search patator
<span style="color:#ffd700">NAME</span>                              DESCRIPTION               STARS     OFFICIAL   AUTOMATED
<span style="color:#ffd700">patator69</span>/docker<span style="color:#f5ab35">101</span>tutorial                                 <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">metascan</span>/patator                                            <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">lanjelot</span>/patator                  latest commit <span style="color:#f5ab35">on</span> master   <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">gh0s7</span>/patator                                               <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">m4ch1n3s</span>/patator                                            <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">thepalesun</span>/patator_experimental                             <span style="color:#f5ab35">0</span>                    
<span style="color:#ffd700">shadowker</span>/docker-patator          patator in docker         <span style="color:#f5ab35">0</span>{% endhighlight %}

<p>2.安装需要的版本：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:left">
{% highlight %}docker pull lanjelot/patator{% endhighlight %}

<p>3.使用：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:left">
{% highlight %}docker run --rm -it lanjelot/patator patator ssh_login host=example.com user=FILE0 password=FILE1 0=users.txt 1=passwords.txt -x ignore:mesg=&#39;Authentication failed.&#39;{% endhighlight %}

<pre style="margin-left:0px; margin-right:0px; text-align:left">
{% highlight %}解释：`--rm`选项表示容器在运行结束后将被自动删除，`-it`选项允许与容器进行交互。{% endhighlight %}

<p>{% highlight %}我还没测试。{% endhighlight %}</p>

