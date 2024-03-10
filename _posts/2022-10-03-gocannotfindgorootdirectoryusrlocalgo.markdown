---
layout: post
title: "go: cannot find GOROOT directory: /usr/local/go"
date: "2022-10-03"
categories: 
---
<p>使用go的时候，出现了错误：</p>
<p>go: cannot find GOROOT directory: /usr/local/go</p>
<p><img height="199" src="/uploads/ckeditor/pictures/520/image-20221003161841-2.png" width="1157" /></p>
<p>修改文件： vim ~/.bashrc</p>
<p>到/usr/local/go目录下，可以看到根本没有go这个文件夹，那么就是go被卸载了。重新安装，并配置文件（138&mdash;&mdash;140）。</p>
<p>运行：source ~/.bashrc</p>
<p><img height="335" src="/uploads/ckeditor/pictures/519/image-20221003161738-1.png" width="1161" /></p>
