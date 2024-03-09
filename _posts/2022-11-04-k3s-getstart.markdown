---
layout: post
title: "k3s - get start "
date: "2022-11-04"
categories: 
---
<p><a href="https://k3s.io/">https://k3s.io/</a></p>

<p><a href="https://www.w3cschool.cn/tedsy/tedsy-zvnb3pi4.html">https://www.w3cschool.cn/tedsy/tedsy-zvnb3pi4.html</a></p>

<pre class="prism-code language-sh codeBlock_bY9V thin-scrollbar" tabindex="0">
<code class="codeBlockLines_e6Vv"><span class="token-line" style="color: rgb(191, 199, 213);"><span class="token plain">curl -sfL https://get.k3s.io | sh - </span></span>{% endhighlight %}

<p><img height="383" src="/uploads/ckeditor/pictures/692/image-20221104154910-2.png" width="1331" /></p>

<p>use aliyun install&nbsp; <a href="https://www.w3cschool.cn/tedsy/tedsy-tgxk3pi2.html">https://www.w3cschool.cn/tedsy/tedsy-tgxk3pi2.html</a></p>

<pre lang="text" style="max-width: 100%;">
<code class="text">curl -sfL https://rancher-mirror.oss-cn-beijing.aliyuncs.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -{% endhighlight %}

<p><img height="490" src="/uploads/ckeditor/pictures/691/image-20221104154625-1.png" width="1920" /></p>

<p>通过以下&nbsp;Docker&nbsp;命令，一键启动&nbsp;AutoK3s&nbsp;本地&nbsp;UI，快速体验相关功能。</p>

<p>docker run -itd --restart=unless-stopped -p 8010:8010 cnrancher/autok3s:v0.5.1</p>

<p><img height="347" src="/uploads/ckeditor/pictures/693/image-20221104154928-3.png" width="1364" /></p>

<p>如果您想要在&nbsp;docker&nbsp;中使用&nbsp;K3d&nbsp;provider，那么您需要使用宿主机网络启动&nbsp;AutoK3s&nbsp;镜像。</p>

<pre lang="text">
<code class="text">docker run -itd --restart=unless-stopped --net host -v /var/run/docker.sock:/var/run/docker.sock cnrancher/autok3s:v0.5.1{% endhighlight %}

<p><img height="80" src="/uploads/ckeditor/pictures/694/image-20221104155023-4.png" width="1854" /></p>

<p>启动：</p>

{% highlight %}sudo k3s server &amp;<br />
# Kubeconfig is written to /etc/rancher/k3s/k3s.yaml<br />
sudo k3s kubectl get node

# On a different node run the below command.<br />
# NODE_TOKEN comes from /var/lib/rancher/k3s/server/node-token on your server<br />
sudo k3s agent --server https://myserver:6443 --token ${NODE_TOKEN}{% endhighlight %}

<p>如果您想卸载&nbsp;AutoK3s，可以执行以下命令：</p>

<pre lang="text">
<code class="text">/usr/local/bin/autok3s-uninstall.sh
{% endhighlight %}

