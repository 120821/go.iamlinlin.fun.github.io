---
layout: post
title: "rails email smtp gem 'delayed_job_active_record' (error: NoMethodError (undefined method +' for nil:NilClass))"
date: "2023-08-29"
categories: 
---
<p>1.根据教程进行配置，设置邮箱端口等：</p>

<pre>
<code>config.action_mailer.delivery_method = <span style="color:#abe338">:smtp</span>
config.action_mailer.smtp_settings = {
  <span style="color:#abe338">address:</span> <span style="color:#abe338">&#39;smtp.example.com&#39;</span>,
  <span style="color:#abe338">port:</span> <span style="color:#f5ab35">587</span>,
  <span style="color:#abe338">user_name:</span> <span style="color:#abe338">&#39;your_username&#39;</span>,
  <span style="color:#abe338">password:</span> <span style="color:#abe338">&#39;your_password&#39;</span>,
  <span style="color:#abe338">authentication:</span> <span style="color:#abe338">:plain</span>,
  <span style="color:#abe338">enable_starttls_auto:</span> <span style="color:#f5ab35">true</span>
}</code></pre>

<p>2.增加mailer 方法以及邮件内容等（省略）</p>

<p>3.如果配置对，可以再console测试，就可以直接成功，如果在视图页面调用，可以增加gem:</p>

<pre>
<code>gem &#39;delayed_job_active_record&#39;</code></pre>

<p><code>这样就好。</code></p>

