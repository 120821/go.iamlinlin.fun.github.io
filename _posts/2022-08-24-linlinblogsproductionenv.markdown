---
layout: post
title: "linlin_blogs production env"
date: "2022-08-24"
categories: 
---
<p>运行命令启动，根据报错进行调试css，</p>

<p>RAILS_ENV=production bundle exec rails s -u thin</p>

<p>css调试好，出现了新的报错：</p>

<pre>
<code>Unexpected error while processing request: Missing `secret_token` and `secret_key_base` for &#39;production&#39; environment, set these values in `config/secrets.yml`</code></pre>

<p><img height="353" src="/uploads/ckeditor/pictures/324/image-20220824090726-1.png" width="1917" /></p>

<p>根据提示为config/secrets.yml增加内容（随便加一下token个secret）：</p>

<p><img height="353" src="/uploads/ckeditor/pictures/325/image-20220824090815-2.png" width="1917" /></p>

<p>重启，就可以显示画面了，但是css没有显示背景图片，进行调试。</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/326/image-20220824090928-1.png" width="1920" /></p>

<p>根据error提示，只有css出现错误，js文件正常使用，那么配置文件有问题，修改config/env../pro..文件，找到css的内容，取消注释，然后进行编译：rake assets:precompile --trace RAILS_ENV=production</p>

<p><img height="353" src="/uploads/ckeditor/pictures/327/image-20220824104759-1.png" width="1917" /></p>

<p>重启服务器，页面出现了样式，背景图片尚未加载</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/328/image-20220824104920-2.png" width="1920" /></p>

<p>查看源代码：asset已经进行编译了</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/329/image-20220824105253-1.png" width="1920" /></p>

<p>继续找原因：因为有两个背景图，其中一个加载不出，一个被冲突了，</p>

<p><img height="1080" src="/uploads/ckeditor/pictures/330/image-20220824105639-1.png" width="1920" /></p>

<p>还会出现一个问题是，在文件修改后，重启也不能生效，必须进行编译才可以生效，</p>

<pre><code>rake assets:precompile --trace RAILS_ENV=production

AILS_ENV=production bundle exec rails s -u thin</code></pre>

<p>&nbsp;</p>

