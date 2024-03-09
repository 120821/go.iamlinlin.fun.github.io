---
layout: post
title: "gins - error: reference to undefined identifier ‘unsafe.Slice’"
date: "2022-10-03"
categories: 
---
<p><a href="https://github.com/gin-gonic/gin#contents">https://github.com/gin-gonic/gin#contents</a></p>

<p>安装gin的时候：go get -u github.com/gin-gonic/gin</p>

<p><img height="331" src="/uploads/ckeditor/pictures/521/image-20221003163807-1.png" width="1845" /></p>

<p>有效：go mod init gins.go</p>

<p>&nbsp;&nbsp; 输入go mod init +&ldquo;文件名称&rdquo;，例子中文件名称为test.go，所以我们输入go mod init test回车运行后会在当前目录下生成一个go.mod文件</p>

<p>继续：go get github.com/gin-gonic/gin（无效）</p>

<p><img height="335" src="/uploads/ckeditor/pictures/522/image-20221003163911-2.png" width="1843" /></p>

<p>使用：go mod tidy</p>

<p><img height="430" src="/uploads/ckeditor/pictures/523/image-20221003164346-3.png" width="1857" /></p>

<p>&nbsp;</p>

