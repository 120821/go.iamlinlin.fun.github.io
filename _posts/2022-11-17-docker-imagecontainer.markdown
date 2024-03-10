---
layout: post
title: "docker - 对于 image, container 等的基本操作"
date: "2022-11-17"
categories: 
---
<p>参考：<a href="http://siwei.me/blog/posts/docker-image-container">http://siwei.me/blog/posts/docker-image-container</a></p>
<p><strong>image</strong>: 镜像, 静态的,&nbsp; 可以被commit. 可以被删除。&nbsp;</p>
<p><strong>container</strong>:&nbsp; docker &quot;run&quot; （注意是不是start ) image 之后的到的.&nbsp; &nbsp;内容不会被自动保存。&nbsp; docker run 命令 就会产生新的。 而且docker 的理念是container 可以随时随地产生和抛弃。</p>
<p><strong>docker run</strong> 命令： 根据image 来得到一个运行中的 container .这是一个崭新的container. （如果启动postgres后，postgres停止了，然后再次启动的不是使用ID启动，就是启动了了新的postgres，IP address会不一样。当然ID也不一样）</p>
<p><strong>docker start</strong> 命令： 把之前停止的 container 跑起来</p>
<p>可以通过 --help 来查看 详细命令，例如&nbsp; $ docker run --help 会打印出详细的解释。</p>
<p><strong>docker run&nbsp; &lt;image_name&gt;&nbsp;</strong></p>
<p>根据已有的image&nbsp; 创建一个新的container 并运行</p>
<p>例子： 运行 image: 933f6,&nbsp; 使用host ip,&nbsp; 并且把 host 的 /workspace 文件夹加载到container 中的 /workspace</p>
{% highlight html %}docker run -v /workspace:/workspace --net=host -it --hostname=admin-container 933f6{% endhighlight %}
<p><strong>docker create&nbsp;</strong>&nbsp;创建一个新的container ,但是不启动</p>
<p><strong>docker start &lt;id&gt;&nbsp;</strong>&nbsp;运行一个已经存在的,并且已经停止的container&nbsp;&nbsp;</p>
<p><strong>docker stop &lt;id&gt;&nbsp;</strong>&nbsp;停止已经一个存在的container&nbsp;</p>
<p><strong>docker rm &lt;container id&gt;&nbsp;</strong>&nbsp;删除一个或者多个container&nbsp;</p>
<p><strong>docker image ls&nbsp; &nbsp;或者&nbsp; $ docker images</strong>&nbsp; &nbsp;&nbsp;查看本地所有的image</p>
<p><strong>docker exec -it &lt;container id&gt; /bin/bash</strong>&nbsp;直接类似于使用ssh 登录一个container&nbsp;</p>
<p><strong>docker attach &lt;container id&gt;&nbsp;</strong>&nbsp;查看某个container</p>
<p><strong>docker logs &lt;container id&gt;&nbsp;</strong>&nbsp;查看某个container 的shell的输出</p>
<p><strong>docker inspect &lt;container id&gt; , 查看某个container的详细情况. 包括ip 等。</strong></p>
<p><strong>docker ps&nbsp;</strong> &nbsp;列出运行中的container&nbsp; &nbsp; ( 如果要列出所有，包括已经启动的和已经停止的所有，就 docker ps -a )</p>
<p><strong>docker image ls&nbsp; 列出所有的docker image</strong></p>
<p>REPOSITORY TAG IMAGE ID CREATED SIZE<br />
ubuntu add_vim 4efbaa2d43fc About a minute ago 167MB</p>
<p><strong>docker export</strong>&nbsp; 把 container 导出 , 例如:&nbsp;&nbsp; docker export -o rails_container.tar c7180f611c13</p>
<p><strong>docker save</strong>&nbsp;&nbsp;把 image 导出, 例如：　docker save -o rails_image.tar 253ea174ad29</p>
<p><strong>docker load&nbsp;&nbsp;</strong>导入使用&nbsp;<a href="https://www.runoob.com/docker/docker-save-command.html" rel="noopener noreferrer" target="_blank">docker save</a>&nbsp;命令导出的镜像。</p>
<p>例如：&nbsp;导入镜像：</p>
{% highlight html %}$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
$ docker load &lt; busybox.tar.gz
Loaded image: busybox:latest
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busybox             latest              769b9341d937        7 weeks ago         2.489 MB
$ docker load --input fedora.tar
Loaded image: fedora:rawhide
Loaded image: fedora:20
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busybox             latest              769b9341d937        7 weeks ago         2.489 MB
fedora              rawhide             0d20aec6529d        7 weeks ago         387 MB
fedora              20                  58394af37342        7 weeks ago         385.5 MB
fedora              heisenbug           58394af37342        7 weeks ago         385.5 MB
fedora              latest              58394af37342        7 weeks ago         385.5 MB{% endhighlight %}
<p><strong>docker import</strong>&nbsp;&nbsp; 把image 导入。（但是不运行，仅仅导入到本地的image 仓库）</p>
<p><strong>docker cp&nbsp;</strong>&nbsp;把本地的copy到container 中。 或者反之</p>
<p><strong>docker cp &lt;containerId&gt;:/file/path/within/container /host/path/target</strong></p>
<p>或者&nbsp; docker cp ~/.vim &lt;containerid&gt;:/root</p>
<p><strong>docker run 运行docker ，并且加上各种参数。</strong></p>
<p>-v 加上本地存储</p>
<p><strong>docker-compose</strong></p>
<p>运行某个指定的yml文件：</p>
{% highlight html %}docker-compose -f ./docker-compose.yml up{% endhighlight %}
