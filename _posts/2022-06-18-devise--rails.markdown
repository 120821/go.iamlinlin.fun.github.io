---
layout: post
title: "devise --rails"
date: "2022-06-18"
categories: 
---
<p>参考 https://github.com/heartcombo/devise#starting-with-rails</p>

<p>编辑Gemfile 增加：</p>

<div class="highlight highlight-source-ruby notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="gem 'devise'">
<pre>
<span class="pl-en">gem</span> <span class="pl-s">&#39;devise&#39;</span></pre>

<p>Devise 4.0 可与 Rails 4.1 及更高版本一起使用。</p>

<p>安装： <code>bundle install 和 </code>bundle exec rails generate devise:install</p>

<p>Using upyun 1.0.9<br />
Using web-console 2.3.0<br />
Bundle complete! 22 Gemfile dependencies, 90 gems now installed.<br />
Use `bundle info [gemname]` to see where a bundled gem is installed.</p>

<p>-----------------------------------------------------</p>
</div>

<p>bundle exec rails generate devise:install<br />
/home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activesupport-4.2.8/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp; config/initializers/devise.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp; config/locales/devise.en.yml<br />
===============================================================================</p>

<p>Depending on your application&#39;s configuration some manual setup may be required:</p>

<p>&nbsp; 1. Ensure you have defined default url options in your environments files. Here<br />
&nbsp;&nbsp;&nbsp;&nbsp; is an example of default_url_options appropriate for a development environment<br />
&nbsp;&nbsp;&nbsp;&nbsp; in config/environments/development.rb:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config.action_mailer.default_url_options = { host: &#39;localhost&#39;, port: 3000 }</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; In production, :host should be set to the actual host of your application.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; * Required for all applications. *</p>

<p>&nbsp; 2. Ensure you have defined root_url to *something* in your config/routes.rb.<br />
&nbsp;&nbsp;&nbsp;&nbsp; For example:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root to: &quot;home#index&quot;<br />
&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Not required for API-only Applications *</p>

<p>&nbsp; 3. Ensure you have flash messages in app/views/layouts/application.html.erb.<br />
&nbsp;&nbsp;&nbsp;&nbsp; For example:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;p class=&quot;notice&quot;&gt;&lt;%= notice %&gt;&lt;/p&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;p class=&quot;alert&quot;&gt;&lt;%= alert %&gt;&lt;/p&gt;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp; * Not required for API-only Applications *</p>

<p>&nbsp; 4. You can copy Devise views (for customization) to your app by running:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rails g devise:views<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Not required *</p>

<p>===============================================================================</p>

<p>&nbsp;</p>

<p>在文件 <code>config/environments/development.rb</code>增加：</p>

<div class="highlight highlight-source-ruby notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }">
<pre>
<span class="pl-en">config</span><span class="pl-kos">.</span><span class="pl-en">action_mailer</span><span class="pl-kos">.</span><span class="pl-en">default_url_options</span> <span class="pl-c1">=</span> <span class="pl-kos">{</span> <span class="pl-pds">host</span>: <span class="pl-s">&#39;localhost&#39;</span><span class="pl-kos">,</span> <span class="pl-pds">port</span>: <span class="pl-c1">3000</span> <span class="pl-kos">}</span><img src="/uploads/ckeditor/pictures/42/image-20220618101830-1.png" style="width: 928px; height: 55px; float: left;" /></pre>
</div>

<p>&nbsp;增加model ：bundle exec rails&nbsp; generate devise MODEL</p>

<p>bundle exec rails&nbsp; generate devise MODEL<br />
/home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activesupport-4.2.8/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke&nbsp; active_record<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; db/migrate/20220618021947_devise_create_models.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp; app/models/model.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke&nbsp;&nbsp;&nbsp; test_unit<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test/models/model_test.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test/fixtures/models.yml<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; insert&nbsp;&nbsp;&nbsp; app/models/model.rb<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; route&nbsp; devise_for :models</p>

<p>增加 migrate：bundle exec rake db:migrate</p>

<p>bundle exec rake db:migrate<br />
/home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activesupport-4.2.8/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.<br />
== 20220618021947 DeviseCreateModels: migrating ===============================<br />
-- create_table(:models)<br />
&nbsp;&nbsp; -&gt; 0.0042s<br />
-- add_index(:models, :email, {:unique=&gt;true})<br />
&nbsp;&nbsp; -&gt; 0.0016s<br />
-- add_index(:models, :reset_password_token, {:unique=&gt;true})<br />
&nbsp;&nbsp; -&gt; 0.0015s<br />
== 20220618021947 DeviseCreateModels: migrated (0.0074s) ======================</p>

<p>Devise 将创建helper以在您的controller和view中使用。 要设置具有用户身份验证的controller，只需添加此 before_action（假设您的设计模型是&ldquo;user&rdquo;）：</p>

<div class="highlight highlight-source-ruby notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="before_action :authenticate_user!">
<pre>
<span class="pl-en">before_action</span> <span class="pl-pds">:authenticate_user!</span></pre>
</div>

<p>&nbsp;</p>

