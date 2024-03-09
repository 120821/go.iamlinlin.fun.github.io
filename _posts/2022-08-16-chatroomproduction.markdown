---
layout: post
title: "chatroom production 运行"
date: "2022-08-16"
categories: 
---
<p>生产模式</p>

<p>tail production.log&nbsp; -f</p>

<p>运行Redis ：redis server</p>

<p><img height="692" src="/uploads/ckeditor/pictures/216/image-20220816100830-1.png" width="1920" /></p>

<p>修改数据库的配置，生产开发模式使用同一个数据库：</p>

<p>linlin@linlin-i5:/workspace/chatroom-rails$ cat config/database.yml<br />
default: &amp;default<br />
&nbsp; adapter: postgresql<br />
&nbsp; encoding: unicode<br />
&nbsp; # For details on connection pooling, see Rails configuration guide<br />
&nbsp; # https://guides.rubyonrails.org/configuring.html#database-pooling<br />
&nbsp; pool: &lt;%= ENV.fetch(&quot;RAILS_MAX_THREADS&quot;) { 5 } %&gt;<br />
&nbsp; timeout: 5000<br />
&nbsp; encoding: utf-8<br />
&nbsp; #host: 192.168.10.54<br />
&nbsp; host: localhost<br />
&nbsp; #user: postgres<br />
&nbsp; #username: postgres<br />
&nbsp; user: admin<br />
&nbsp; username: admin<br />
&nbsp; password: 88888888<br />
&nbsp; port: 5432</p>

<p>development:<br />
&nbsp; &lt;&lt;: *default<br />
&nbsp; database: chatroom_rails_development</p>

<p>test:<br />
&nbsp; &lt;&lt;: *default<br />
&nbsp; database: chatroom_rails_test</p>

<p>#&nbsp;&nbsp; production:<br />
#&nbsp;&nbsp;&nbsp;&nbsp; url: &lt;%= ENV[&quot;MY_APP_DATABASE_URL&quot;] %&gt;<br />
#<br />
production:<br />
&nbsp; &lt;&lt;: *default<br />
&nbsp; database: chatroom_rails_development</p>

<p><code>安装node， yarn， 编译assets:&nbsp; rake assets:precompile RAILS_ENV=production</code></p>

<p><code>修改config/production.rb:</code></p>

<p>-&nbsp; config.public_file_server.enabled = ENV[&quot;RAILS_SERVE_STATIC_FILES&quot;].present?<br />
+&nbsp; config.public_file_server.enabled = true # ENV[&quot;RAILS_SERVE_STATIC_FILES&quot;].present?</p>

<p><img height="297" src="/uploads/ckeditor/pictures/217/image-20220816101258-2.png" width="969" /></p>

<p>修改：config/application.rb</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; # config.eager_load_paths &lt;&lt; Rails.root.join(&quot;extras&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp; config.time_zone = &quot;Beijing&quot;<br />
+&nbsp;&nbsp;&nbsp; config.middleware.delete Rack::Lock</p>

<p><img height="338" src="/uploads/ckeditor/pictures/218/image-20220816101411-3.png" width="690" /></p>

