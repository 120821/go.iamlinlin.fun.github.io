---
layout: post
title: "使用user_mailer发送邮件"
date: "2022-08-26"
categories: 
---
<p>首先进行配置文件的修改，增加email的地址，设置密码，在{% highlight %}config/environments/$RAILS_ENV.rb{% endhighlight %}</p>

{% highlight %}
{% highlight %}config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {

&nbsp; address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;smtp.gmail.com&#39;,

&nbsp; port:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 587,

&nbsp; domain:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;example.com&#39;,

&nbsp; user_name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;&lt;username&gt;&#39;,

&nbsp; password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;&lt;password&gt;&#39;,

&nbsp; authentication:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;plain&#39;,

&nbsp; enable_starttls_auto: true,

&nbsp; open_timeout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,

&nbsp; read_timeout:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 }{% endhighlight %}

<p>配置好后，创建user_mailer</p>

<p>bin/rails generate mailer User</p>

<p>会自动生成多个文件：</p>

{% highlight %}
<code class="highlight console"><span class="go">create  app/mailers/user_mailer.rb
create  app/mailers/application_mailer.rb
invoke  erb
create    app/views/user_mailer
create    app/views/layouts/mailer.text.erb
create    app/views/layouts/mailer.html.erb
invoke  test_unit
create    test/mailers/user_mailer_test.rb
create    test/mailers/previews/user_mailer_preview.rb</span>{% endhighlight %}

<p>&nbsp;</p>

{% highlight %}
{% highlight %}&lt;script&gt;

&nbsp; jQuery(&#39;#send_validation_code&#39;).click(function () {

&nbsp;&nbsp;&nbsp; let email = jQuery(&#39;#account_email&#39;).val();

&nbsp;&nbsp;&nbsp; let url =&nbsp; &#39;/front_ends/send_validation_code?type=email&amp;to=&#39; + email

&nbsp;&nbsp;&nbsp; if(email==&#39;&#39;){

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&#39;邮箱不能为空&#39;)

&nbsp;&nbsp;&nbsp; }else{

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*发送前端验证码按钮变化*/

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ($(this).hasClass(&#39;disabled&#39;)) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var self = $(this);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var count = 60;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.addClass(&#39;disabled&#39;);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.text(count + &#39;s&#39;);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 定时器在这

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var timer = setInterval(function () {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count--;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count &gt; 0) {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.text(count + &#39;s&#39;);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clearInterval(timer);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.text(&#39;获取验证码&#39;);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.removeClass(&quot;disabled&quot;);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, 1000);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*1秒= 1000ms*/

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jQuery.get(url , function(data){

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.info(data)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(data.result == &#39;ok&#39;){

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log(&quot;发送成功&quot;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }else{

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&#39;该邮箱已经存在,无法被绑定，请确认邮箱是否正确&#39;)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

&nbsp;&nbsp;&nbsp; }

&nbsp; });

&lt;/script&gt;{% endhighlight %}

<p>&nbsp;</p>

