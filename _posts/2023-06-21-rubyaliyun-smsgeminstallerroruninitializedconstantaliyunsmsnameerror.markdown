---
layout: post
title: "ruby  aliyun-sms gem install error： uninitialized constant Aliyun::Sms (NameError)"
date: "2023-06-21"
categories: 
---
<p dir="auto">1.如果出现如下错误，则在运行上述命令时：</p>

<pre>
<code>./config/initializers/aliyun-sms.rb:1:in `&lt;top (required)&gt;&#39;: uninitialized constant Aliyun::Sms (NameError)</code></pre>

<p><code>解决：</code></p>

<pre>
<code>gem &#39;aliyun-sms&#39;, &#39;1.1.1&#39;, git: &#39;https://github.com/VICTOR-LUO-F/aliyun-sms.git&#39;</code></pre>

<p>目前阿里云sms只有三个版本：</p>

<div class="l-half--l">
<div class="versions">
<p>版本列表:</p>

<ol>
	<li><a class="t-list__item" href="https://rubygems.org/gems/aliyun-sms/versions/1.1.1">1.1.1</a> <small>- March 15, 2018</small> (12.0 KB)</li>
	<li><a class="t-list__item" href="https://rubygems.org/gems/aliyun-sms/versions/1.1.0">1.1.0</a> <small>- March 15, 2018</small> (12.0 KB)</li>
	<li><a class="t-list__item" href="https://rubygems.org/gems/aliyun-sms/versions/0.1.0">0.1.0</a> <small>- February 01, 2017</small> (4.5 KB)</li>
</ol>

<p>根据需要进行设置版本号。</p>
</div>
</div>

<p>&nbsp;</p>

<p>&nbsp;</p>

