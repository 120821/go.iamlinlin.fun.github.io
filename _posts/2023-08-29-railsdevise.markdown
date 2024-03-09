---
layout: post
title: "rails devise的简单使用"
date: "2023-08-29"
categories: 
---
<p>refer:&nbsp; <a href="https://github.com/heartcombo/devise">https://github.com/heartcombo/devise</a></p>

<p>1.安装devise依赖</p>

<pre>
gem &#39;devise&#39;</pre>

<p>2.初始化Devisea</p>

<pre>
bundle exec rails generate devise:install</pre>

<p>3.创建devise登录的用户</p>

<pre>
bundle exec rails generate devise user</pre>

<p>4.创建Devise的视图页面：</p>

<pre>
bundle exec rails g devise:views</pre>

<p>5.创建controller:(如果你的model是user,就写user. manager同理）</p>

<pre>
bundle exec rails g devise:controllers user</pre>

<p>6.增加登录验证：</p>

<pre>
class ApplicationController &lt; ActionController::Base
  before_action :authenticate_user!
end</pre>

<p>7.启动server即可注册登录。</p>

