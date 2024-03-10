---
layout: post
title: "安装eclipse java"
date: "2022-06-09"
categories: 
---
<blockquote> 
<p>首先进入官网下载对应的版本，解压缩之后，进入目录，复制文件地址，在命令行执行，安装。</p> 
<p><img alt="" height="1080" src="https://img-blog.csdnimg.cn/c178c5c340f04102a973b645c75ca382.png" width="1200"></p> 
</blockquote> 
<blockquote> 
<p> 查看本机地址，直接输入命令ifconfig即可，在最后的段落可以看到，192.168.1.4.，就是本机地址<img alt="" height="1080" src="https://img-blog.csdnimg.cn/c178c5c340f04102a973b645c75ca382.png" width="1200"><img alt="" height="1080" src="https://img-blog.csdnimg.cn/e5e5837de9644a8a8dc76a3fed1366bb.png" width="1200"></p> 
</blockquote> 
<blockquote> 
<p>如果在命令行不能安装，提示安装时间过长的话，可以配置需要的环境。</p> 
<p>先安装python3  , pip3</p> 
<p>sudo apt install python3-pip</p> 
<p>然后 pip3 install pproxy</p> 
<p>使用： pproxy -r socks5://127.0.0.1:1099 -vv</p> 
<p>先在本地运行起一个 socks5 server , 跑在 1099端口</p> 
</blockquote> 
<p>192.168.1.4</p> 
<p>然后直接运行命令</p> 
{% highlight html %}export HTTP_PROXY="http://192.168.1.4:8080"
export HTTPS_PROXY="http://192.168.1.4:8080"
export http_proxy="http://192.168.1.4:8080"
export https_proxy="http://192.168.1.4:8080"{% endhighlight %} 
<p><img alt="" height="1080" src="https://img-blog.csdnimg.cn/fca965d4d7294356886a63c26be32978.png" width="1200"></p> 
<p>  ctrl +鼠标左键 点击 某个变量，就可以看到该变量的出处</p>
