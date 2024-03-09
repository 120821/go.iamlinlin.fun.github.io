---
layout: post
title: "jquery ajax get ---rails alert 简单使用"
date: "2022-06-18"
categories: 
---
<p>参考：https://stackoverflow.com/questions/25779489/how-ajax-retrieve-data-from-ruby-on-rails-controller</p>

<p>https://www.codegrepper.com/code-examples/javascript/edit+rails+jquery+ajax+get（这个数据有问题使用的 时候自己修改）</p>

<p>首先在controller 增加action</p>

<p>class MyBlogsController &lt; ApplicationController<br />
&nbsp;&nbsp;&nbsp; ...............</p>

<p>&nbsp; def test<br />
&nbsp;&nbsp;&nbsp; some_parameter = params[:some_parameter]<br />
&nbsp;&nbsp;&nbsp; # do something with some_parameter and return the results</p>

<p>&nbsp;&nbsp;&nbsp; @test = MyBlog.last<br />
&nbsp;&nbsp;&nbsp; respond_to do |format|<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format.html<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format.json {render json: @test}<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; .......</p>

<p>在routes.rb增加路由</p>

<p>Rails.application.routes.draw do<br />
&nbsp;..............</p>

<p>&nbsp; resources :my_blogs do<br />
&nbsp;&nbsp;&nbsp; collection do<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :test<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end</p>

<p>然后自己视图页面app/views/my_blogs/test.html.erb</p>

<p>&lt;script&gt;<br />
&nbsp; $.ajax({<br />
&nbsp;&nbsp;&nbsp; type:&quot;GET&quot;,<br />
&nbsp;&nbsp;&nbsp; url:&quot;http://localhost:3333/my_blogs/test&quot;,<br />
&nbsp;&nbsp;&nbsp; dataType:&quot;json&quot;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data: {some_parameter: &quot;&lt;%= params[:some_parameter] %&gt;&quot;},<br />
&nbsp;&nbsp;&nbsp; success:function(data, some_parameter){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(data + &quot;hi&quot; + some_parameter);<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp; })<br />
&lt;/script&gt;<br />
&nbsp;&nbsp; 得到的结果是这样的</p>

<p><img height="806" src="/uploads/ckeditor/pictures/41/image-20220618094142-1.png" width="1849" /></p>

<p>&nbsp;</p>

