---
layout: post
title: "fly.io ruby on rails"
date: "2022-06-09"
categories: 
---

                    <p><a class="has-card" href="https://fly.io/docs/getting-started/ruby/" title="Build, Deploy and Run a Ruby Application · Fly Docs"><span class="link-card-box"><span class="link-title">Build, Deploy and Run a Ruby Application · Fly Docs</span><span class="link-link"><img class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.1.3/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M4AD" alt="icon-default.png?t=M4AD">https://fly.io/docs/getting-started/ruby/</span></span></a>首先使用命令在项目文件夹安装curl -L https://fly.io/install.sh | sh</p> 
<pre><code>  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1415    0  1415    0     0   1889      0 --:--:-- --:--:-- --:--:--  1886
######################################################################## 100.0%
set channel to shell
flyctl was installed successfully to /home/linlin/.fly/bin/flyctl
Manually add the directory to your $HOME/.bash_profile (or similar)
  export FLYCTL_INSTALL="/home/linlin/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
Run '/home/linlin/.fly/bin/flyctl --help' to get started
</code></pre> 
<p>把这些代码放进文件中vim ~/.bashrc</p> 
<pre><code>export FLYCTL_INSTALL="/home/linlin/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
</code></pre> 
<p>flyctl auth login</p> 
<p>登录进flyctl,再次运行新的APP就不需要登录了 ，直接创建运行就可以，运行命令rackup</p> 
<p><img alt="" height="76" src="https://img-blog.csdnimg.cn/6f0be6ffcc6040d28bc5dc9aa85068b9.png" width="606"></p> 
<h3>把本地的一个简单的应用，部署到远程  </h3> 
<p>例如一个sinatra 应用。</p> 
<p>app.rb</p> 
<pre><code>#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'sinatra'

get '/' do
  "&lt;h1&gt;Hello From Ruby on Fly!&lt;/h1&gt;"
end

get '/:name' do
  "&lt;h1&gt;Hello From Ruby on Fly!&lt;/h1&gt;&lt;/br&gt;and hello to #{params[:name]}"
end
</code></pre> 
<p>Gemfile:</p> 
<pre><code>source 'https://rubygems.org'

ruby '3.1.0'
gem 'sinatra'
gem 'puma'</code></pre> 
<p>config.ru</p> 
<pre><code>require './app.rb'

run Sinatra::Application</code></pre> 
<h3>本地运行：$ rackup</h3> 
<pre><code>Puma starting in single mode...
* Puma version: 5.6.4 (ruby 3.1.0-p0) ("Birdie's Version")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 300873
* Listening on http://127.0.0.1:9292
* Listening on http://[::1]:9292
Use Ctrl-C to stop</code></pre> 
<h3>在远程运行   flyctl  launch 注意在存在rb  Gemfile文件夹内，此时是错误的文件夹</h3> 
<p>第一次在远程运行会出现加载较慢的情况，后续就不会了。</p> 
<p>创建APP的时候，注意名称不要重复，不要下划线，可以选择公开与否和地区。</p> 
<p><img alt="" height="937" src="https://img-blog.csdnimg.cn/c15ad7f80829451c97b402bed2f9e1d0.png" width="1200"></p> 
<p> 可以发现，在本地代码文件夹，会多出一个文件： fly.toml </p> 
<p><img alt="" height="91" src="https://img-blog.csdnimg.cn/f3bf7a6c40164f84bb4ed0b48d558967.png" width="555"></p> 
<pre><code># fly.toml file generated for 1234 on 2022-06-02T17:17:57+08:00

app = "1234"

kill_signal = "SIGINT"
kill_timeout = 5
processes = []

[env]

[experimental]
  allowed_public_ports = []
  auto_rollback = true

[[services]]
  http_checks = []
  internal_port = 8080
  processes = ["app"]
  protocol = "tcp"
  script_checks = []

  [services.concurrency]
    hard_limit = 25
    soft_limit = 20
    type = "connections"

  [[services.ports]]
    force_https = true
    handlers = ["http"]
    port = 80

  [[services.ports]]
    handlers = ["tls", "http"]
    port = 443

  [[services.tcp_checks]]
    grace_period = "1s"
    interval = "15s"
    restart_limit = 0
    timeout = "2s"
</code></pre> 
<p><img alt="" height="122" src="https://img-blog.csdnimg.cn/01ad05015321435594d23a3a1fc205be.png" width="871"></p> 
<p>远程会出现项目，点击进入，是详情页面 可以看到详细的信息<img alt="" height="592" src="https://img-blog.csdnimg.cn/195079afae11449a85ea8215918808e6.png" width="1200"></p> 
<h3>如何做部署  flyctl deploy  （前提：需要有个  fly.toml 文件）</h3> 
<p>执行命令，报错也没关系，因为不是在本地的docker运行的</p> 
<p><img alt="" height="193" src="https://img-blog.csdnimg.cn/98aa5dd539984ddc8d06e3969b51650c.png" width="1200"></p> 
<p>点击1234hostname的网址并不能打开页面，那么出错了，应该在hi目录下增加文件fly.toml,重新运行刚才的命令</p> 
<p>linlin@linlin-i5:/workspace/blog_fly/hi$ flyctl  launch</p> 
<p><img alt="" height="640" src="https://img-blog.csdnimg.cn/827a9b7ca4004bca967238ef10eb0dcd.png" width="1200"></p> 
<pre><code>

===&gt; EXPORTING
Adding layer 'heroku/ruby:env'
Adding layer 'heroku/ruby:gems'
Adding layer 'heroku/ruby:ruby'
Adding 1/1 app layer(s)
Adding layer 'launcher'
Adding layer 'config'
Adding layer 'process-types'
Adding label 'io.buildpacks.lifecycle.metadata'
Adding label 'io.buildpacks.build.metadata'
Adding label 'io.buildpacks.project.metadata'
Setting default process type 'web'
Saving registry.fly.io/1232:cache...
*** Images (dfe5ceea3db5):
      registry.fly.io/1232:cache
      registry.fly.io/1232:deployment-1654162525
Adding cache layer 'heroku/ruby:gems'
--&gt; Building image done
==&gt; Pushing image to fly
The push refers to repository [registry.fly.io/1232]
87dc756f0bc5: Pushed 
a248e8c4fc0a: Pushed 
195ce6778985: Pushed 
b8a76ee77a47: Pushed 
fd941a6af848: Pushed 
70d0bf6c5fc0: Pushed 
a1e3b8b5e582: Pushed 
0b9d6a2b9aef: Pushed 
219a884327cf: Pushed 
6c6007ce9a6d: Pushed 
c2fb59d1c64c: Pushed 
bf8cedc62fb3: Pushed 
deployment-1654162525: digest: sha256:3e73d65e03c43918798c6476038bbeefd61eab82b854c658a82c11b7e945c332 size: 2826
--&gt; Pushing image done
image: registry.fly.io/1232:deployment-1654162525
image size: 657 MB
==&gt; Creating release
--&gt; release v2 created

--&gt; You can detach the terminal anytime without stopping the deployment
==&gt; Monitoring deployment

v0 is being deployed
</code></pre> 
<p>运行的时间也是比较慢的，可以在远程看到新的APP已经是绿色的可以用了，<img alt="" height="167" src="https://img-blog.csdnimg.cn/2b6117bd76a44a80875f2515d0863a08.png" width="860"></p> 
<p> 在详情页面也可以看到，增加了许多内容</p> 
<p><img alt="" height="830" src="https://img-blog.csdnimg.cn/31c02e68bc654c459687889d758d89dd.png" width="1200"></p> 
<p>点击hostname进入网址，可以看到我们写的app<img alt="" height="141" src="https://img-blog.csdnimg.cn/550be1fd6f0042818556990a1cb57f3b.png" width="487"></p> 
<p>添加参数，也可以正常使用<img alt="" height="173" src="https://img-blog.csdnimg.cn/c9da7e5ca500453191c602af34778bc8.png" width="501"></p> 
<p> 设置ssl 域名</p> 
<p>点击图中的选项，可以进行域名的设置</p> 
<p><img alt="" height="467" src="https://img-blog.csdnimg.cn/12f6b726fb3f44078fbc34376c36a53e.png" width="1200"></p> 
<p> 保存之后，就可以输入域名进行访问了<img alt="" height="466" src="https://img-blog.csdnimg.cn/7d3d62a5562c4dfabeedb611505c96e9.png" width="1200"></p> 
<p>不需要的项目可以进行删除,比如最先创建的错误的APP1234 <img alt="" height="460" src="https://img-blog.csdnimg.cn/f8f96f8de2c54681940b02e872d95c49.png" width="1200"></p> 
<p></p>
                
