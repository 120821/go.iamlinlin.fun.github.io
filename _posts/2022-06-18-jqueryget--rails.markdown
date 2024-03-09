---
layout: post
title: "使用jQuery.get  调用接口--rails"
date: "2022-06-18"
categories: 
---
<p>参考：https://stackoverflow.com/questions/25779489/how-ajax-retrieve-data-from-ruby-on-rails-controller</p>

<p>https://www.codegrepper.com/code-examples/javascript/edit+rails+jquery+ajax+get（这个数据有问题使用的 时候自己修改）</p>

<p>增加routes</p>

<p>namespace :api do<br />
&nbsp;&nbsp;&nbsp; resources :my_blogs do<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collection do<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :test<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end</p>

<p>增加controller：app/controllers/api/my_blogs_controller.rb&nbsp;&nbsp;</p>

<p>module Api<br />
&nbsp; class MyBlogsController &lt; ActionController::Base<br />
&nbsp;&nbsp;&nbsp; def test<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; some_parameter = params[:some_parameter]<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @test = MyBlog.last<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render json: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result: &#39;ok&#39;,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data: &quot;hi, #{params[:name]}&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>

<p>&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end</p>

<p>end<br />
<img height="385" src="/uploads/ckeditor/pictures/44/image-20220618161704-2.png" width="1202" /></p>

<p>增加视图：api/my_blogs/test.html.erb</p>

<p>&lt;script&gt;<br />
&nbsp; $.ajax({<br />
&nbsp;&nbsp;&nbsp; type:&quot;GET&quot;,<br />
&nbsp;&nbsp;&nbsp; url:&quot;http://localhost:3000/api/my_blogs/test.json&quot;,<br />
&nbsp;&nbsp;&nbsp; dataType:&quot;json&quot;,<br />
&nbsp;&nbsp;&nbsp; data: {some_parameter: &quot;&lt;%= params[:some_parameter] %&gt;&quot;},<br />
&nbsp;&nbsp;&nbsp; success:function(data, some_parameter){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(data + &quot;hi&quot; + some_parameter);<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp; }) &nbsp;<br />
&lt;/script&gt;</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/43/image-20220618161650-1.png" width="1920" /></p>

