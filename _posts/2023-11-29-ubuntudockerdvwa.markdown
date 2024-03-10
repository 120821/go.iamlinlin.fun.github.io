---
layout: post
title: "ubuntu docker配置dvwa环境"
date: "2023-11-29"
categories: 
---
<p>我已经安装了docker:</p>
{% highlight html %}<span style="color:#ffd700">docker</span> ps
<span style="color:#ffd700">CONTAINER</span> ID   IMAGE                      COMMAND                  CREATED         STATUS          PORTS                                       NAMES
<span style="color:#ffd700">fd578e16e9b4</span>   cnrancher/autok<span style="color:#f5ab35">3</span>s:v<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">5</span>.<span style="color:#f5ab35">1</span>   <span style="color:#abe338">&quot;autok3s serve --bin&hellip;&quot;</span>   <span style="color:#f5ab35">12</span> months ago   Up <span style="color:#f5ab35">11</span> minutes                                               focused_rhodes
<span style="color:#ffd700">5f676e2bc93e</span>   cnrancher/autok<span style="color:#f5ab35">3</span>s:v<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">5</span>.<span style="color:#f5ab35">1</span>   <span style="color:#abe338">&quot;autok3s serve --bin&hellip;&quot;</span>   <span style="color:#f5ab35">12</span> months ago   Up <span style="color:#f5ab35">11</span> minutes   <span style="color:#f5ab35">0.0.0.0:8010</span>-&gt;<span style="color:#f5ab35">8010</span>/tcp, :::<span style="color:#f5ab35">8010</span>-&gt;<span style="color:#f5ab35">8010</span>/tcp   mystifying_murdock{% endhighlight %}
<p>需要拉取DVWA Docker镜像：</p>
{% highlight html %}<span style="color:#ffd700">sudo docker pull vulnerables</span>/web-dvwa{% endhighlight %}
<p>启动DVWA Docker：</p>
{% highlight html %}<span style="color:#ffd700">sudo</span> docker run -d -p <span style="color:#f5ab35">80</span>:<span style="color:#f5ab35">80</span> vulnerables/web-dvwa{% endhighlight %}
{% highlight html %}sudo docker pull vulnerables/web-dvwa
Using default tag: latest
latest: Pulling from vulnerables/web-dvwa
3e17c6eae66c: Pull complete
0c57df616dbf: Pull complete
eb05d18be401: Pull complete
e9968e5981d2: Pull complete
2cd72dba8257: Pull complete
6cff5f35147f: Pull complete
098cffd43466: Pull complete
b3d64a33242d: Pull complete
Digest: sha256:dae203fe11646a86937bf04db0079adef295f426da68a92b40e3b181f337daa7
Status: Downloaded newer image for vulnerables/web-dvwa:latest
docker.io/vulnerables/web-dvwa:latest{% endhighlight %}
<p>会返回，例如：</p>
{% highlight html %}sudo docker run -d -p 80:80 vulnerables/web-dvwa
d8904db73cd9591203f7990f6c5db32ce379e90b8c527af1fefe3cbcd41815f3{% endhighlight %}
<p>&nbsp;</p>
<p>&nbsp;</p>
