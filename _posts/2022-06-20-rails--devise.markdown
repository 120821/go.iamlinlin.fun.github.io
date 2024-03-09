---
layout: post
title: "rails--devise 的基本使用"
date: "2022-06-20"
categories: 
---
<pre class="hljs bash">
<span class="hljs-comment"># Gemfile</span>
gem <span class="hljs-string">&#39;devise&#39;</span>
vim Gemfile
<span class="hljs-comment"># 运行下面三个命令</span>
$ bundle <span class="hljs-built_in">exec</span> rails generate devise:install
$ bundle <span class="hljs-built_in">exec</span> rails generate devise user
$ bundle <span class="hljs-built_in">exec</span> rails g devise:views
</pre>

<p>bundle exec rails generate devise user<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke&nbsp; active_record<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; db/migrate/20220621060226_devise_create_users.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/models/user.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke&nbsp;&nbsp;&nbsp; test_unit<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test/models/user_test.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test/fixtures/users.yml<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; insert&nbsp;&nbsp;&nbsp; app/models/user.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; route&nbsp; devise_for :users</p>

<p>bundle exec rails g devise:views<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke&nbsp; Devise::Generators::SharedViewsGenerator<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/shared<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/shared/_error_messages.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/shared/_links.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke&nbsp; form_for<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/confirmations<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/confirmations/new.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/passwords<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/passwords/edit.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/passwords/new.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/registrations<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/registrations/edit.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/registrations/new.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/sessions<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/sessions/new.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/unlocks<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/unlocks/new.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke&nbsp; erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/mailer<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/mailer/confirmation_instructions.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/mailer/email_changed.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/mailer/password_change.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/mailer/reset_password_instructions.html.erb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/views/devise/mailer/unlock_instructions.html.erb</p>

<pre class="hljs bash">
<span class="hljs-comment"># application controller 增加：: </span>
class ApplicationController &lt; ActionController::Base
  before_action :authenticate_user!
end
<span class="hljs-comment"># 为application.html.erb 增加 登录 ，退出等按钮</span>
          &lt;% <span class="hljs-keyword">if</span> user_signed_<span class="hljs-keyword">in</span>? %&gt;        
          &lt;ul class=<span class="hljs-string">&quot;nav navbar-nav&quot;</span> style=<span class="hljs-string">&#39;float:right&#39;</span>&gt;
            &lt;li&gt;&lt;%= link_to <span class="hljs-string">&quot;欢迎你：#{current_user.try :email}&quot;</span> %&gt;&lt;/li&gt;
            &lt;li&gt;
            &lt;%= link_to <span class="hljs-string">&#39;退出&#39;</span>, destroy_user_session_path, :method =&gt; :delete  %&gt;  
            &lt;/li&gt;
          &lt;/ul&gt;
          &lt;% <span class="hljs-keyword">else</span> %&gt;
          &lt;ul class=<span class="hljs-string">&quot;nav navbar-nav&quot;</span> style=<span class="hljs-string">&#39;float:right&#39;</span>&gt;
            &lt;li&gt;
            &lt;%= link_to <span class="hljs-string">&#39;登陆&#39;</span> , <span class="hljs-string">&#39;/users/sign_in&#39;</span>, :method =&gt; :get%&gt;
            &lt;/li&gt;
          &lt;/ul&gt;
          &lt;% end %&gt;

</pre>

