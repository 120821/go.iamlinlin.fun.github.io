---
layout: post
title: "docker - 一些基本的运行机制（叫用法更合适）: volume, port, 使用mongodb 作为例子"
date: "2022-06-25"
categories:
---
<p>参考：https://cloudoki.com/mongodb-docker/</p>
<p>https://www.linode.com/docs/guides/set-up-mongodb-on-docker/</p>
<p>一句话记录一下吧。</p>
<p>docker默认是每次不保存变化的数据库。</p>
<p>但是对于数据库（mysql, redis, mongo）来说，则数据时刻在变化。</p>
<h3>对于数据库，需要使用 -v 参数，来绑定 docker 内部文件夹与 (host) 外部文件夹的对应。</h3>
<div>这个跟docker-compose的配置文件是一个作用。</div>
<p>下面是一个完整例子：</p>
<p>1. 创建本地volume:</p>
<p>$ sudo docker volume create mongo_volume&nbsp; # 它的默认位置是通过&nbsp;&nbsp;</p>
<p>docker volume inspect mongo_volume 可以查看的到的.</p>
<pre class="hljs bash">
sudo docker volume  inspect mysql_volume
[
{
<span class="hljs-string">&quot;CreatedAt&quot;</span>: <span class="hljs-string">&quot;2022-04-21T04:25:30Z&quot;</span>,
<span class="hljs-string">&quot;Driver&quot;</span>: <span class="hljs-string">&quot;local&quot;</span>,
<span class="hljs-string">&quot;Labels&quot;</span>: {},
<span class="hljs-string">&quot;Mountpoint&quot;</span>: <span class="hljs-string">&quot;/var/lib/docker/volumes/mysql_volume/_data&quot;</span>,
<span class="hljs-string">&quot;Name&quot;</span>: <span class="hljs-string">&quot;mysql_volume&quot;</span>,
<span class="hljs-string">&quot;Options&quot;</span>: {},
<span class="hljs-string">&quot;Scope&quot;</span>: <span class="hljs-string">&quot;local&quot;</span>
}
]
<p>使用的时候,直接 叫它的名字就行,不用加上文件的路径.&nbsp;</p>
<p>(带验证) 也可以根据下面的方式:</p>
<p>$ sudo mkdir /data/docker/mongo_volume -p</p>
<p>2. 使用mongo：</p>
<p>$ sudo docker pull mongo</p>
<p>（仅允许host 的127.0.0.1:27017 绑定到container的27017上。 并且&nbsp; host /data/docker/mongo_volume 文件夹映射到container的/data/db 文件夹）</p>
<p>$ sudo docker run -it -p 127.0.0.1:27017:27017 -v /data/docker/mongo_volume/:/data/db -d mongo(创建MongoDB，设置端口等信息）（data/docker/mongo_volume/是目录）</p>
