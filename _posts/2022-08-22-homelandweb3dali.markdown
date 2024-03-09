---
layout: post
title: "本地运行：homeland_web3_dali"
date: "2022-08-22"
categories: 
---
<p>首先进行克隆，然后修改配置文件</p>

<p>git clone <a href="https://github.com/sg552/homeland_web3_dali.git">https://github.com/sg552/homeland_web3_dali.git</a></p>

<p>修改配置文件：config/database.yml 和config/puma.rb</p>

<p>修改数据库的用户名和密码，修改PUMA的端口号，3000在用，3344也在用，换成其他，8080也在用的。</p>

<p>安装bundle：gem install bundler：2.3.3</p>

<p>（注意与Gemfile.lock底部内容相一致）</p>

<p>bundle -v：进行查看是否转换</p>

<p>bundle install：进行安装配置环境</p>

<p>有安装不了的gem，bundle fund，每月20美刀，每月账户。</p>

<p>先启动server吧：bundle exec rails s -p 4000</p>

<p>提示：bin/rails db:create</p>

<p>那么创建数据库和表</p>

<p>刷新页面：Webpacker::Manifest::MissingEntryError in Topics#index</p>

<p>进行查看和解决：<a href="https://stackoverflow.com/questions/54113179/rails-webpackermanifestmissingentryerror-in-homeindex">https://stackoverflow.com/questions/54113179/rails-webpackermanifestmissingentryerror-in-homeindex</a></p>

<p>有效的命令：yarn add @rails/webpacker</p>

<p>无效的命令：npm install， bundle exec rake webpacker:install</p>

<p>刷新页面，就显示社区了。</p>

<p><img height="697" src="/uploads/ckeditor/pictures/314/image-20220822171919-1.png" width="1527" /></p>

<p>和homeland的区别是，增加了metamask登录的功能，来试一下吧。</p>

<p>登录的时候，出现了报错：</p>

<header>
<p>Redis::CannotConnectError in TheUsersController#show_complete_email_page</p>
</header>

<main id="container" role="main">
<div class="exception-message">
<p class="message">Error connecting to Redis on localhost:6379 (Errno::ECONNREFUSED)</p>

<p class="message"><a href="http://linlin.fun/blogs/230">http://linlin.fun/blogs/230</a></p>

<p class="message">redis-server(如果不行就根据提示进行操作，以及这个文章)</p>

<p class="message">redis server</p>

<p class="message"><img height="716" src="/uploads/ckeditor/pictures/315/image-20220822173122-2.png" width="1914" /></p>

<p class="message">刷新页面 就提示先去注册。</p>

<p class="message">ps -ef |grep redis</p>

<p class="message">redis-server</p>

<p class="message">注册的时候填写邮箱，密码，和用户名（用户名默认邮箱昵称），不会验证邮箱（功能未完善），填写帖子的时候，需要在后台进行node的 创建，不然节点为空就不能保存。</p>

<p class="message"><img height="603" src="/uploads/ckeditor/pictures/316/image-20220822175130-1.png" width="1556" /></p>
</div>
</main>

<p>&nbsp;</p>

