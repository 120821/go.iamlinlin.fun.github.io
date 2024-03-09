---
layout: post
title: "html form 和对应组件（input, textarea, checkbox, radio button）向服务器后端传递参数的原理"
date: "2022-08-23"
categories: 
---
<p><a href="https://www.jianshu.com/p/baec052d1e54">https://www.jianshu.com/p/baec052d1e54</a></p>

<p>form表单结构。action后面跟的是路径url，methord是用哪种方式来传递，一般都是get和post两种方式，form表单里面有一些input标签。</p>

<div>
<div>
<p>1、表单提交时表单内容会被浏览器封装为HTTP请求报，里面包含了所有表单元素的name属性值和value属性的值，形式为name=value。</p>

<p>2、该HTTP请求报被webserver获取后会被解析并封装成一个Request对象，Request对象里有一个<b>Parameters集合</b>专门用来存放所有的表单元素键值对，这里的parameters即Firefox的HttpRequester插件Parameters。</p>

<p>3、每个表单元素名值对被封装成一个Parameter，而Parameter其实就是一个Map，所以你的Server里就可以用request.getParameter(name)获取其value了</p>

<p>如果用get方式提交表单，会在地址栏显示 param=value 这种形式，比如说提交路径是http://localhost/MyDemo/testAction.do?id=test&amp;status=insert&nbsp;&nbsp; get是默认的提交方式</p>

<p>然后通过Firefox的HttpRequester插件（参数可以写入Content to Send、Headers、Parameters传递给后端），发起一个http url请求。</p>

<div>
<p>通常情况下，HTTP协议的工作原理很好理解，用户通过客户端向服务端发起一个请求，创建一个TCP连接，指定端口号，默认是80，然后连接到服务器工作。在那个端口监听浏览器请求。一旦监听到客户端请求，分析请求类型后，服务器会向客户端返回一个响应状态，比如&quot;HTTP/1.0 ,&nbsp; 404 ,OK&quot;，同时会返回特定的数据内容，如请求的资源，错误代码，其它状态信息等等。</p>

<p>当浏览器向服务器发送一个请求到Web服务器,它发送一个数据块,或请求信息,HTTP请求信息包括3部分:1、请求方法URI协议/版本；2、请求头(Request Header)；3、请求正文；</p>

<div>
<p>.submit()方法，走的是请求http,get,或者post,&nbsp; 一般get是从服务器上获取数据，post是向服务器传送数据。get是把参数数据队列加到提交表单的ACTION属性所指的URL中，值和表单内各个字段一一对应，在URL中可以看到。post是通过HTTP。post机制，将表单内各个字段与其内容放置在HTML HEADER内一起传送到ACTION属性所指的URL地址。用户看不到这个过程。</p>
</div>
</div>
</div>

<p>&nbsp;</p>
</div>

