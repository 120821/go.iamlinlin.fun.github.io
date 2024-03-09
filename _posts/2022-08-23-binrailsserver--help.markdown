---
layout: post
title: "bin/rails server --help"
date: "2022-08-23"
categories: 
---
<p>在rails项目使用生产模式的时候，出现了报错，(js_compressor=&#39;: unknown compressor: terser (Sprockets::Error))</p>

<p>根据提示，进行查看命令怎么使用：</p>

<p><img height="266" src="/uploads/ckeditor/pictures/319/image-20220823164613-2.png" width="1850" /></p>

<pre>
<code>bin/rails server --help
Usage:
&nbsp; rails server -u [thin/puma/webrick] [options]
Options:
&nbsp; -e, [--environment=ENVIRONMENT]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Specifies the environment to run this server under (test/development/production).
&nbsp; -p, [--port=port]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Runs Rails on the specified port - defaults to 3000.
&nbsp; -b, [--binding=IP]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Binds Rails to the specified IP - defaults to &#39;localhost&#39; in development and &#39;0.0.0.0&#39; in other environments&#39;.
&nbsp; -c, [--config=file]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Uses a custom rackup configuration.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Default: config.ru
&nbsp; -d, [--daemon], [--no-daemon]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Runs server as a Daemon.
&nbsp; -u, [--using=name]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Specifies the Rack server used to run the application (thin/puma/webrick).
&nbsp; -P, [--pid=PID]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Specifies the PID file - defaults to tmp/pids/server.pid.
&nbsp; -C, [--dev-caching], [--no-dev-caching]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Specifies whether to perform caching in development.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--early-hints], [--no-early-hints]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Enables HTTP/2 early hints.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--log-to-stdout], [--no-log-to-stdout]&nbsp; # Whether to log to stdout. Enabled by default in development when not daemonized.</code></pre>

<p>&nbsp;错误用法：</p>

<p>bundle exec rails s -u puma RAILS_ENV=production</p>

<p>识别不出-u是什么：</p>

<p><img height="266" src="/uploads/ckeditor/pictures/318/image-20220823164514-1.png" width="1850" /></p>

<p>使用：</p>

<p>RAILS_ENV=production bundle exec rails s -u puma</p>

<p>然后出现了报错，搜索资料，发现是config/envi../pro...不对，然后根据提示进行修改，怎么该都不对，可能就是之前用asset pipeline出现了错误，那么进行恢复，checkout</p>

<p><img height="326" src="/uploads/ckeditor/pictures/320/image-20220823165250-1.png" width="1850" /></p>

<p>然后进行server，就可以打开</p>

<p><img height="326" src="/uploads/ckeditor/pictures/321/image-20220823165411-2.png" width="1850" /></p>

<p>视图页面是出现了报错，那么进行修改</p>

<p><img height="326" src="/uploads/ckeditor/pictures/322/image-20220823165436-3.png" width="1850" /></p>

<p>进入log目录，tail -f production.rb</p>

<p>发现是找不到application.css.erb,在之前的文章也有记录，进行查看，需要进行编译：</p>

<p>rake assets:precompile --trace RAILS_ENV=production</p>

<p>出现了报错，有一个用不上的css文件报错了，那么删除文件，再次执行命令，只出现警告，那么就可以了。</p>

<p>重启server，&nbsp;RAILS_ENV=production bundle exec rails s -u thin</p>

<p>然后，把log多按几下回车，刷新页面，出现了内容，log也没有报错。没有css没有关系，因为是新项目，还没css。</p>

<p><img height="524" src="/uploads/ckeditor/pictures/323/image-20220823172208-1.png" width="1851" /></p>

