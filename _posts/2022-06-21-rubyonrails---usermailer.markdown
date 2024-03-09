---
layout: post
title: "ruby on rails - 验证资格 --发送邮件, 使用user_mailer"
date: "2022-06-21"
categories: 
---
<p>配置环境文件：</p>

<pre><code>config/environments/$RAILS_ENV.rb</code></pre>

<p>把秘钥配置好</p>

<pre><code>config.action_mailer.delivery_method = :smtp config.action_mailer.smtp_settings = { &nbsp; address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;smtp.gmail.com&#39;, &nbsp; port:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 587, &nbsp; domain:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;example.com&#39;, &nbsp; user_name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;&lt;username&gt;&#39;, &nbsp; password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;&lt;password&gt;&#39;, &nbsp; authentication:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;plain&#39;, &nbsp; enable_starttls_auto: true, &nbsp; open_timeout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5, &nbsp; read_timeout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 }</code></pre>

<p>生成user_mailer</p>

<pre><code>bin/rails generate mailer User</code></pre>

<p>然后在前端页面进行设置</p>

<pre><code>&lt;script&gt; &nbsp; jQuery(&#39;#send_validation_code&#39;).click(function () { &nbsp;&nbsp;&nbsp; let email = jQuery(&#39;#account_email&#39;).val(); &nbsp;&nbsp;&nbsp; let url =&nbsp; &#39;/front_ends/send_validation_code?type=email&amp;to=&#39; + email &nbsp;&nbsp;&nbsp; if(email==&#39;&#39;){ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&#39;邮箱不能为空&#39;) &nbsp;&nbsp;&nbsp; }else{ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*发送前端验证码按钮变化*/ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ($(this).hasClass(&#39;disabled&#39;)) { &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else { &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var self = $(this); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var count = 60; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.addClass(&#39;disabled&#39;); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.text(count + &#39;s&#39;); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 定时器在这 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var timer = setInterval(function () { &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count--; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count &gt; 0) { &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.text(count + &#39;s&#39;); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else { &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clearInterval(timer); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.text(&#39;获取验证码&#39;); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.removeClass(&quot;disabled&quot;); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 1000); &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*1秒= 1000ms*/ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jQuery.get(url , function(data){ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.info(data) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(data.result == &#39;ok&#39;){ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(&quot;发送成功&quot;) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }else{ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&#39;该邮箱已经存在,无法被绑定，请确认邮箱是否正确&#39;) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } &nbsp;&nbsp;&nbsp; } &nbsp; }); &lt;/script&gt;</code></pre>

<p>在后端进行设置验证即可。</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>下边的不用看了。是尝试。</p>

<p>进行后台的api返回数据。判断是否有资格</p>

<p>增加routes</p>

<p>&nbsp;namespace :api do<br />
&nbsp;70&nbsp;&nbsp;&nbsp;&nbsp; resources :apps do<br />
&nbsp;71&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collection do<br />
&nbsp;72&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get :is_eligible<br />
&nbsp;73&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;74&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;75&nbsp;&nbsp; end</p>

<p>增加api接口</p>

<p>&nbsp; def is_eligible<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render json: {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result: Account.where(&#39;address = ? or email = ? or mobile = ?&#39;, params[:value], params[:value], params[:value]).first.present?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; end</p>

<p>前端进行引用，</p>

<p>&nbsp;</p>

