---
layout: post
title: "rails  发送邮件--user_mailer--尚未完善 "
date: "2022-06-23"
categories: 
---
<p><a href="https://edgeguides.rubyonrails.org/action_mailer_basics.html">https://edgeguides.rubyonrails.org/action_mailer_basics.html</a></p>

<p>明确： 需要使用user_mailer，并且后端与前端创建好按钮的关系，使用jQuery</p>

<p>1.创建user_mailer</p>

<pre>
<code class="highlight console"><span class="nb">bin/rails </span>generate mailer User</code></pre>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><code class="highlight console">1.2</code>创建相关文件<code class="highlight ruby"><span class="c1">app/mailers/application_mailer.rb和</span></code> app/mailers/user_mailer.rb</div>

<pre>
<code># app/mailers/application_mailer.rb</code></pre>

<pre>
<code>class ApplicationMailer &lt; ActionMailer::Base
&nbsp; default from: &quot;from@example.com&quot;
&nbsp; layout &#39;mailer&#39;
end</code></pre>

<pre>
<code># app/mailers/user_mailer.rb
class UserMailer &lt; ApplicationMailer
end</code></pre>

<p>1.3编辑app/mailers/user_mailer.rb</p>

<pre>
<code>class UserMailer &lt; ApplicationMailer
end</code></pre>

<p>新增方法：</p>

<pre>
<code>class UserMailer &lt; ApplicationMailer
&nbsp; default from: &#39;notifications@example.com&#39;
&nbsp; def welcome_email
&nbsp;&nbsp;&nbsp; @user = params[:user]
&nbsp;&nbsp;&nbsp; @url&nbsp; = &#39;http://example.com/login&#39;
&nbsp;&nbsp;&nbsp; mail(to: @user.email, subject: &#39;Welcome to My Awesome Site&#39;)
&nbsp; end
end</code></pre>

<p>1.4新增视图页面：</p>

<pre>
<code>app/views/user_mailer/welcome_email.html.erb</code></pre>

<pre>
<code>&lt;!DOCTYPE html&gt;
&lt;html&gt;
&nbsp; &lt;head&gt;
&nbsp;&nbsp;&nbsp; &lt;meta content=&#39;text/html; charset=UTF-8&#39; http-equiv=&#39;Content-Type&#39; /&gt;
&nbsp; &lt;/head&gt;
&nbsp; &lt;body&gt;
&nbsp;&nbsp;&nbsp; &lt;h1&gt;Welcome to example.com, &lt;%= @user.name %&gt;&lt;/h1&gt;
&nbsp;&nbsp;&nbsp; &lt;p&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You have successfully signed up to example.com,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; your username is: &lt;%= @user.login %&gt;.&lt;br&gt;
&nbsp;&nbsp;&nbsp; &lt;/p&gt;
&nbsp;&nbsp;&nbsp; &lt;p&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To login to the site, just follow this link: &lt;%= @url %&gt;.
&nbsp;&nbsp;&nbsp; &lt;/p&gt;
&nbsp;&nbsp;&nbsp; &lt;p&gt;Thanks for joining and have a great day!&lt;/p&gt;
&nbsp; &lt;/body&gt;
&lt;/html&gt;</code></pre>

<p>1.5调用邮件程序：</p>

<pre>
<code>bin/rails generate scaffold user name email login
bin/rails db:migrate</code></pre>

<pre>
<code>class UsersController &lt; ApplicationController

&nbsp; # ...

&nbsp; # POST /users or /users.json

&nbsp; def create

&nbsp;&nbsp;&nbsp; @user = User.new(user_params)

&nbsp;&nbsp;&nbsp; respond_to do |format|

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if @user.save

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Tell the UserMailer to send a welcome email after save

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UserMailer.with(user: @user).welcome_email.deliver_later

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format.html { redirect_to(@user, notice: &#39;User was successfully created.&#39;) }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format.json { render json: @user, status: :created, location: @user }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format.html { render action: &#39;new&#39; }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format.json { render json: @user.errors, status: :unprocessable_entity }

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end

&nbsp;&nbsp;&nbsp; end

&nbsp; end

&nbsp; # ...

end</code></pre>

<p>1.6使用deviler_now</p>

<pre>
<code>class SendWeeklySummary

&nbsp; def run

&nbsp;&nbsp;&nbsp; User.find_each do |user|

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UserMailer.with(user: user).weekly_summary.deliver_now

&nbsp;&nbsp;&nbsp; end

&nbsp; end

end</code></pre>

<p>1.7传递参数：</p>

<pre>
<code>class AdminMailer &lt; ApplicationMailer

&nbsp; default to: -&gt; { Admin.pluck(:email) },

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from: &#39;notification@example.com&#39;

&nbsp; def new_registration(user)

&nbsp;&nbsp;&nbsp; @user = user

&nbsp;&nbsp;&nbsp; mail(subject: &quot;New User Signup: #{@user.email}&quot;)

&nbsp; end

end

def welcome_email

&nbsp; @user = params[:user]

&nbsp; mail(

&nbsp;&nbsp;&nbsp; to: email_address_with_name(@user.email, @user.name),

&nbsp;&nbsp;&nbsp; subject: &#39;Welcome to My Awesome Site&#39;

&nbsp; )

end</code></pre>

<p>1.8指定发件人：</p>

<pre>
<code>class UserMailer &lt; ApplicationMailer

&nbsp; default from: email_address_with_name(&#39;notification@example.com&#39;, &#39;Example Company Notifications&#39;)

end</code></pre>

<p>1.9传递多个参数：</p>

<pre>
<code>class UserMailer &lt; ApplicationMailer

&nbsp; default from: &#39;notifications@example.com&#39;

&nbsp; def welcome_email

&nbsp;&nbsp;&nbsp; @user = params[:user]

&nbsp;&nbsp;&nbsp; @url&nbsp; = &#39;http://example.com/login&#39;

&nbsp;&nbsp;&nbsp; mail(to: @user.email,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subject: &#39;Welcome to My Awesome Site&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; template_path: &#39;notifications&#39;,

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; template_name: &#39;another&#39;)

&nbsp; end

end</code></pre>

<p>然后视图页面，也就是邮件内容部分就可以进行使用参数的传递，例如验证码，URL等</p>

<p>创建需要的视图页面：（验证码）</p>

<pre>
<code>app/views/user_mailer/send_validation_email.html.erb</code></pre>

<pre>
<code>&lt;!DOCTYPE html&gt;

&lt;html&gt;

&nbsp; &lt;head&gt;

&nbsp;&nbsp;&nbsp; &lt;meta content=&#39;text/html; charset=UTF-8&#39; http-equiv=&#39;Content-Type&#39; /&gt;

&nbsp; &lt;/head&gt;

&nbsp; &lt;body&gt;

&nbsp;&nbsp;&nbsp; &lt;p&gt;The verification code is xxxx. You are verifying your identity to claim NFT. &lt;/p&gt;

&nbsp;&nbsp;&nbsp; &lt;p&gt;If you do not operate by yourself, please pay attention to account security. &lt;/p&gt;

&nbsp; &lt;/body&gt;

&lt;/html&gt;</code></pre>

<p>修改后端的controller，增加方法，</p>

<pre>
<code>app/controllers/api/apps_controller.rb</code></pre>

<pre>
<code>def send_validation_code

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #发送验证邮件

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UserMailer.send_validation_email(to, subject).deliver_now

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; render json: {

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result: &quot;success&quot;

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

+&nbsp;&nbsp;&nbsp; end</code></pre>

<p>参数的传递</p>

<pre>
<code>app/controllers/accounts_controller.rb</code></pre>

<pre>
<code>&nbsp;&nbsp; def send_email

&nbsp;&nbsp;&nbsp;&nbsp; to = params[:to]

&nbsp;&nbsp;&nbsp;&nbsp; subject = params[:subject]

+&nbsp;&nbsp;&nbsp; validation_code = params[:validation_code]

&nbsp;

&nbsp;&nbsp;&nbsp;&nbsp; UserMailer.welcome_email(to, subject).deliver_now

&nbsp;&nbsp;&nbsp;&nbsp; render plain: &#39;ok&#39;

+

+&nbsp;&nbsp;&nbsp; UserMailer.send_validation_email(to, subject).deliver_now

+&nbsp;&nbsp;&nbsp; render plain: &#39;ok&#39;

&nbsp;&nbsp; end</code></pre>

<pre>
<code>app/views/user_mailer/welcome_email.html.erb</code></pre>

<pre><code><p>
You have successfully signed up to xxx.com,

</p></code></pre>

<p>欢迎邮件可以不使用，根据功能进行判断是否保留</p>

<pre><code>&nbsp;app/mailers/user_mailer.rb</code></pre>

<pre>
<code>
<code>&nbsp;&nbsp;<code> def welcome_email to, subject

-&nbsp;&nbsp;&nbsp; mail to: to, subject: subject

+&nbsp;&nbsp;&nbsp; mail to: to, subject: &quot;Welcome to AIRDROP!&quot;

&nbsp;&nbsp; end

+

+&nbsp; def send_validation_email to, subject

+&nbsp;&nbsp;&nbsp; mail to: to,&nbsp; subject: &quot;AIRDROP validation code&quot;

+&nbsp; end

+

&nbsp;end</code></code></code></pre>

<pre>
<code><code>&nbsp;</code></code></pre>

<p><code>&nbsp;</code></p>

<div class="notranslate" style="all: initial;"><code><code><code>&nbsp;</code></code></code></div>

<div class="notranslate" style="all: initial;"><code>&nbsp;</code></div>

