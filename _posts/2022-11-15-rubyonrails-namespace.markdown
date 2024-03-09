---
layout: post
title: "ruby on rails -namespace "
date: "2022-11-15"
categories: 
---
<p>参考：&nbsp;<a href="https://gist.github.com/paradigm314/5a0fc40c26594865ccc991c8f43daea9">https://gist.github.com/paradigm314/5a0fc40c26594865ccc991c8f43daea9</a></p>

<p>使用phonenix 生成路由的时候，想对比一下rails的内容，就实践一下，记录一下。</p>

<p>对应生成的路由就是和phonenix类似的 <a href="http://linlin.fun/blogs/520">phonenix routes</a>：</p>

<p><img src="http://linlin.fun/uploads/ckeditor/pictures/712/image-20221109172806-9.png" /></p>

<p>使用这两个命令就可以自动生成一些内容：</p>

<pre>
<code>rails&nbsp;g&nbsp;model&nbsp;Foo&nbsp;

rails&nbsp;g&nbsp;scaffold_controller&nbsp;Admin::Foo&nbsp;--model-name=Foo</code></pre>

<p>就会创建：</p>

<pre>
<code>Generates&nbsp;
# db/migrate/20160907201951_create_foo.rb&nbsp;
# app/models/foo.rb&nbsp;
# app/controllers/admin/foo_controller.rb&nbsp;
# app/views/admin/foo&nbsp;
# app/views/admin/foo/index.html.erb&nbsp;
# app/views/admin/foo/edit.html.erb&nbsp;
# app/views/admin/foo/show.html.erb&nbsp;
# app/views/admin/foo/new.html.erb&nbsp;
# app/views/admin/foo/_form.html.erb&nbsp;
&nbsp;&nbsp;
# Plus all the respctive tests and fixtures for your test suite&nbsp;</code></pre>

