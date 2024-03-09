---
layout: post
title: "mongodb 启动rails server"
date: "2022-06-09"
categories: 
---
<pre>
<code>oot@5d5b156fb1b0:/# cat /etc/*release*
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION=&quot;Ubuntu 20.04.4 LTS&quot;
NAME=&quot;Ubuntu&quot;
VERSION=&quot;20.04.4 LTS (Focal Fossa)&quot;
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME=&quot;Ubuntu 20.04.4 LTS&quot;
VERSION_ID=&quot;20.04&quot;
HOME_URL=&quot;https://www.ubuntu.com/&quot;
SUPPORT_URL=&quot;https://help.ubuntu.com/&quot;
BUG_REPORT_URL=&quot;https://bugs.launchpad.net/ubuntu/&quot;
PRIVACY_POLICY_URL=&quot;https://www.ubuntu.com/legal/terms-and-policies/privacy-policy&quot;
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
</code></pre>

<blockquote>
<p>步骤：</p>

<p>1. 创建mongo专用的文件夹（保存mongo的数据)<br />
mkdir /workspace/docker_folder/mongo5.0.6</p>

<p>2. 运行docker : mongo 5.0.6<br />
sudo docker run -it -v /workspace/docker_folder/mongo5.0.6:/data/db -d mongo:5.0.6</p>

<p>0dc15e2b2899eccd42070b8c0c537dd071bdbd12fd95929eb9d37fb5361e11b6</p>

<p>3. 查看本机运行的docker</p>

<p>sudo docker ps</p>

<p>4. 把从mongo db的数据库备份（）我通过scp 命令从远程拉过来的&nbsp; ) copy 到docker中:</p>

<p>sudo docker cp /workspace/lueluelue-operation-backend/20220428-042348.archive&nbsp; &lt;container_id&gt;:/</p>

<p><br />
5.&nbsp; 进入docker 并使用mongo</p>

<p>sudo docker exec -it &lt;container&gt; bash</p>

<p>mongorestore --archive=20220428-042348.archive</p>

<p>6.&nbsp; 在host中访问 该docker 就可以了 （搜索一下如何使用rails访问本地的mongo数据库）</p>

<p>&nbsp;</p>

<p>使用docker-compose up 启动mongo</p>

<p>$ sudo docker-compose up</p>

<p>&nbsp;</p>
</blockquote>

<p>Creating network &quot;lueluelue-operation-backend_default&quot; with the default driver</p>

<p><img alt="" src="https://img-blog.csdnimg.cn/53b558941af54fcbbf66c7cfdc032a49.png" style="height:141px; width:894px" /></p>

<p>在mongo docker中，启动mongo<img alt="" src="https://img-blog.csdnimg.cn/81faec92f71e47a2bb011d0ea2b5f3ad.png" style="height:409px; width:1104px" />&nbsp;</p>

<p>把远程分支放到本地</p>

<p><img alt="" src="https://img-blog.csdnimg.cn/140459e29c864e8795e0edf4092ab7b6.png" style="height:457px; width:630px" /></p>

<p>更新源 为安装做准备</p>

<blockquote>
<p>apt update<img alt="" src="https://img-blog.csdnimg.cn/11f2b0ed59124fcb9d0a5b6ad03cf640.png" style="height:447px; width:1085px" /></p>
</blockquote>

<p>&nbsp;apt install vim</p>

<p>安装vim</p>

<p><img alt="" src="https://img-blog.csdnimg.cn/08a44f7db4cd4536b14972a91bb26b92.png" style="height:340px; width:852px" /></p>

<blockquote>
<p>telnet ip port</p>
</blockquote>

<p>telnet 127.0.0.1 27017</p>

<p>查看对应的端口是否打开<img alt="" src="https://img-blog.csdnimg.cn/2f345f8557da4284b19a42edf47e119d.png" style="height:119px; width:872px" /></p>

<p>&nbsp;</p>

