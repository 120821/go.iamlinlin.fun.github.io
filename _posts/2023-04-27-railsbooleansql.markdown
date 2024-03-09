---
layout: post
title: "rails boolean sql "
date: "2023-04-27"
categories: 
---
<p>在使用&lsquo;@goods_data_submissions.where(&#39;report_status_today = ?&#39;, params[:report_status_today])&rsquo;进行查询的时候返回的语句：</p>

<p>FROM `goods_data_submissions` WHERE (report_status_today = &#39;true&#39;)&rsquo;</p>

<p>可以看到查询的是字符串不是布尔值， 解决：</p>

<p>在 Rails 中，从 HTML 中接收的参数默认为字符串类型，而非布尔类型。因此，<code>params[:report_status_today]</code> 的值为字符串类型，很可能是 <code>&#39;true&#39;</code> 或 <code>&#39;false&#39;</code>，而非真正的布尔值。这就导致了查询语句中的字符串比较，而非布尔值比较。</p>

<p>为了解决这个问题，可以将查询条件中的字符串值转换为布尔值。一个简单的方法是使用 Ruby 中的 <code>ActiveRecord::Type::Boolean.new.cast</code> 方法，将字符串值转换为布尔值。修改控制器中的代码如下：</p>

<pre>
<code>@goods_data_submissions.where(&#39;report_status_today = ?&#39;, ActiveRecord::Type::Boolean.new.cast(params[:report_status_today]))</code></pre>

<p>这样就可以正确地将字符串值转换为布尔值，并进行正确的布尔值比较。</p>

