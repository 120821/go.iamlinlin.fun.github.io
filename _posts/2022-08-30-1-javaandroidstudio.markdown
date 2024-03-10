---
layout: post
title: "安卓逆向1-安装环境java和Android studio"
date: "2022-08-30"
categories: 
---
<p>Android studio<a href="https://developer.android.com/studio">：https://developer.android.com/studio</a></p>
<p>java jdk：<a href="https://www.oracle.com/java/technologies/downloads/">https://www.oracle.com/java/technologies/downloads/</a></p>
<p>java jdk x64:<a href="https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.tar.gz">https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.tar.gz</a></p>
<p>查看是否安装：<span>java -version</span></p>
<p><img height="140" src="/uploads/ckeditor/pictures/356/image-20220829201447-1.png" width="1141" /></p>
<p>查看java在哪里安装：which java<br />
/usr/bin/java</p>
<p>设置环境：$java_home</p>
<p>把下载的jdk18复制到coding_tools文件夹下，进行解压缩:tar zxvf jdk-18_linux-x64_bin.tar.gz</p>
<p><img height="187" src="/uploads/ckeditor/pictures/357/image-20220829203723-2.png" width="1141" /></p>
<p>修改bashrc：</p>
<p>/workspace/coding_tools$ vim ~/.bashrc</p>
<p>export JAVA_HOME=&quot;/workspace/coding_tools/jdk18/jdk-18.0.2.1&quot;<br />
143 export PATH=&quot;$PATH:$JAVA_HOME/bin&quot;</p>
<p>并设置：source ~/.bashrc</p>
<p><img height="93" src="/uploads/ckeditor/pictures/358/image-20220829203817-3.png" width="1141" /></p>
<p>把java转移位置：sudo mv /usr/bin/java /usr/bin/java.backup</p>
<p><img height="93" src="/uploads/ckeditor/pictures/359/image-20220829204110-4.png" width="1141" /></p>
<p>安装Android studio</p>
<p>解压缩：tar zxvf android-studio-2021.2.1.16-linux.tar.gz</p>
<p><img height="283" src="/uploads/ckeditor/pictures/364/image-20220830140814-1.png" width="1391" /></p>
<p>到文件夹下：/workspace/coding_tools/android_studio/android-studio/bin</p>
<p>执行.sh文件</p>
<p>linlin@linlin-i5:/workspace/coding_tools/android_studio/android-studio/bin$ ./studio.sh</p>
<p><img height="240" src="/uploads/ckeditor/pictures/366/image-20220830141139-3.png" width="631" /></p>
<p>有文件可以导入就导入，没有就不导入。直接OK。</p>
<p>设置代理</p>
<p><img height="636" src="/uploads/ckeditor/pictures/367/image-20220830141326-4.png" width="836" /></p>
<p>选择模式：</p>
<p><img height="590" src="/uploads/ckeditor/pictures/368/image-20220830141340-5.png" width="791" /></p>
<p>下一步：</p>
<p><img height="590" src="/uploads/ckeditor/pictures/369/image-20220830141402-6.png" width="791" /></p>
<p>接受，下一步：<img height="590" src="/uploads/ckeditor/pictures/373/image-20220830141511-10.png" width="791" /></p>
<p>完成：</p>
<p><img height="590" src="/uploads/ckeditor/pictures/371/image-20220830141441-8.png" width="791" /></p>
<p>就会安装：</p>
<p><img height="590" src="/uploads/ckeditor/pictures/374/image-20220830141526-11.png" width="791" /></p>
<p>有一个内容没有安装好：</p>
<p><img height="479" src="/uploads/ckeditor/pictures/375/image-20220830143720-1.png" width="658" /></p>
<p>然后继续了：</p>
<p><img height="566" src="/uploads/ckeditor/pictures/376/image-20220830143734-2.png" width="777" /></p>
<p>可以继续使用，暂时使用。</p>
