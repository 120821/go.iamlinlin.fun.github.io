---
layout: post
title: "rails 1.day.ago"
date: "2023-04-25"
categories: 
---
<div id="rtf10739">
<div>
<p><code>1.day.ago</code> 是 Rails 的时间操作方法，用于获取一段时间之前的时间戳，具体使用方法如下：</p>

<pre>
<code>Time.now # 当前时间，例如：2022-01-01 00:00:00 +0800
1.day.ago # 一天前的时间，例如：2021-12-31 00:00:00 +0800</code></pre>

<p>使用 <code>1.day.ago</code> 可以很方便地获取一天之前的时间，而不需要手动计算时间戳。这个方法返回的是一个 <code>ActiveSupport::TimeWithZone</code> 类型的对象，可以直接用于比较时间。</p>

<p>例如，以下代码将返回一个 Boolean 值，判断是否在一天之内：</p>

<pre>
<code>if some_time &gt; 1.day.ago
  # some time is within the last day
else
  # some time is older than a day
end</code></pre>

<p>需要注意的是，使用 <code>1.day.ago</code> 方法需要先安装 ActiveSupport 扩展库，可以在 Gemfile 中添加如下代码引入：</p>

<pre>
<code>gem &#39;activesupport&#39;</code></pre>

<p>然后在需要使用的文件或控制台中 require 即可。</p>
</div>
</div>

