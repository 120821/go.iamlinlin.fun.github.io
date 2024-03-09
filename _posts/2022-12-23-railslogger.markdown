---
layout: post
title: "rails  logger 的使用"
date: "2022-12-23"
categories: 
---
<p>refer： <a href="https://stackify.com/rails-logger-and-rails-logging-best-practices/">https://stackify.com/rails-logger-and-rails-logging-best-practices/</a></p>

<p>1.在脚本使用log文件，基础的用法</p>

<pre>
<code>Rails.logger = Logger.new(STDOUT)
config.logger = ActiveSupport::Logger.new(&quot;log/#{Rails.env}.log&quot;)</code></pre>

<p>2.或者使用这样的内容：</p>

<pre>
<code>Rails.logger = Logger.new(STDOUT)
Rails.logger.level = Logger::DEBUG</code></pre>

