---
layout: post
title: "rails devise 的使用：用户登录"
date: "2023-03-04"
categories: 
---
<p><a href="https://github.com/heartcombo/devise#starting-with-rails">https://github.com/heartcombo/devise#starting-with-rails</a></p>

<p>在Gemfile增加gem：</p>

<p>gem &#39;devise&#39;</p>

<p>安装：</p>

<p>bundle install</p>

<p>增加devise-user/manager</p>

<p>bundle exec rails generate devise:install</p>

<p>bundle exec rails generate devise user/manager...</p>

<p>bundle exec rails g devise:views</p>

<p>bundle install bin/rails db:migrate RAILS_ENV=development</p>

<p>设置用户权限：</p>

<div class="highlight highlight-source-ruby notranslate overflow-auto position-relative">
<pre>
before_action :authenticate_user!</pre>
</div>

