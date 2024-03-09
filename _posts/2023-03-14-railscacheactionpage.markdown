---
layout: post
title: "rails cache action/page "
date: "2023-03-14"
categories: 
---
<p>1.在Gemfile增加：</p>

<pre>
<code>+gem &#39;rack-cache&#39;

+gem &#39;actionpack-action_caching&#39;

+gem &#39;actionpack-page_caching&#39;</code></pre>

<pre>
<code>$ bundle install</code></pre>

<p>2.修改配置文件：</p>

<p>（1）config/application.rb：</p>

<pre>
<code>module BeiersdorfInforGathering

&nbsp;&nbsp;&nbsp;&nbsp; # config.time_zone = &quot;Central Time (US &amp; Canada)&quot;

&nbsp;&nbsp;&nbsp;&nbsp; # config.eager_load_paths &lt;&lt; Rails.root.join(&quot;extras&quot;)

&nbsp;&nbsp;&nbsp;&nbsp; config.active_support.key_generator_hash_digest_class = OpenSSL::Digest::SHA1

+&nbsp;&nbsp;&nbsp; config.action_dispatch.rack_cache = {

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verbose:&nbsp;&nbsp;&nbsp;&nbsp; true,

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; metastore:&nbsp;&nbsp; &#39;file:/var/cache/rack/meta&#39;,

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entitystore: &#39;file:/var/cache/rack/body&#39;

+&nbsp;&nbsp;&nbsp; }

+&nbsp;&nbsp;&nbsp; config.action_controller.cache_store = :memory_store

+&nbsp;&nbsp;&nbsp; # 确保开启缓存，dev环境下默认是没有开启的。

+&nbsp;&nbsp;&nbsp; config.action_controller.perform_caching = true

&nbsp;&nbsp; end</code></pre>

<p>（2）config/environments/production.rb</p>

<pre>
<code>+

+&nbsp; #config.action_dispatch.rack_cache = {

+&nbsp; #&nbsp; verbose: true,

+&nbsp; #&nbsp; metastore: File.join(ENV[&quot;MEMCACHED_URL&quot;], &quot;meta&quot;),

+&nbsp; #&nbsp; entitystore: File.join(ENV[&quot;MEMCACHED_URL&quot;], &quot;body&quot;)

+&nbsp; #}

+&nbsp; config.consider_all_requests_local&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = false

+&nbsp; config.action_controller.enable_fragment_cache_logging = true

+&nbsp; config.action_controller.page_cache_directory = Rails.root.join(&quot;public&quot;, &quot;cached_pages&quot;)

+&nbsp; config.action_controller.cache_store = :memory_store

&nbsp;end</code></pre>

<p>(3)生产环境和开发环境的使用：</p>

<p>development: $ bin/rails dev:cache</p>

<p>开启（默认是关闭），运行后，返回结果：</p>

<pre>
<code>Development mode is no longer being cached.</code></pre>

<p>&nbsp;</p>

<p>关闭， 运行后，返回结果：</p>

<p><code>Development mode is now being cached.</code></p>

<p>production: (config/environments/production.rb) config.action_controller.perform_caching = true&nbsp;&nbsp; （&nbsp;RAILS_ENV=production SECRET_KEY_BASE=production_test_key rails s -p 3333）</p>

<p>3.使用cache</p>

<pre>
<code>$ rake middleware </code></pre>

<pre>
<code>use ActionDispatch::HostAuthorization

use Rack::Sendfile

use ActionDispatch::Static

use Module

use ActionDispatch::Executor

use ActionDispatch::ServerTiming

use Rack::Runtime

use Rack::MethodOverride

use ActionDispatch::RequestId

use ActionDispatch::RemoteIp

use Sprockets::Rails::QuietAssets

use Rails::Rack::Logger

use ActionDispatch::ShowExceptions

use WebConsole::Middleware

use ActionDispatch::DebugExceptions

use ActionDispatch::ActionableExceptions

use ActionDispatch::Reloader

use ActionDispatch::Callbacks

use ActiveRecord::Migration::CheckPending

use ActionDispatch::Cookies

use ActionDispatch::Session::CookieStore

use ActionDispatch::Flash

use ActionDispatch::ContentSecurityPolicy::Middleware

use ActionDispatch::PermissionsPolicy::Middleware

use Rack::Head

use Rack::ConditionalGet

use Rack::ETag

use Rack::TempfileReaper

use Warden::Manager

run BeiersdorfInforGathering::Application.routes</code></pre>

<p>4.在controller进行使用：</p>

<pre>
<code>&nbsp;class ServersController &lt; ApplicationController&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

&nbsp;&nbsp; before_action :set_server, only: %i[ show edit update destroy ]

+&nbsp; caches_action :index, expires_in: 10.seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

+&nbsp; caches_page :show, expires_in: 10.seconds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

&nbsp;&nbsp; # GET /servers or /servers.json

&nbsp;&nbsp; def index</code></pre>

<p>对需要缓存的页面或者action进行缓存，在有效期间刷新页面，不会从数据库进行查询，而是在cache进行读取，减少服务器的压力。</p>

<p>例如：普通index页面， 没有缓存的状态下：</p>

<pre>
<code>&nbsp; ↳ app/views/servers/index.html.erb:68

&nbsp; Ip Load (1.3ms)&nbsp; SELECT `ips`.* FROM `ips` INNER JOIN `ip_mappings` ON `ips`.`id` = `ip_mappings`.`ip_id` WHERE `ip_mappings`.`server_id` = 3380

&nbsp; ↳ app/views/servers/index.html.erb:68

&nbsp; Rendered servers/index.html.erb within layouts/application (Duration: 2764.5ms | Allocations: 1316449)

&nbsp; Rendered layout layouts/application.html.erb (Duration: 2767.0ms | Allocations: 1319103)

Write fragment views/localhost:3333/index (0.1ms)

Completed 200 OK in 2777ms (Views: 1408.4ms | ActiveRecord: 1363.8ms | Allocations: 1322613)</code></pre>

<p>接着，刷新页面，有十秒钟的缓存时间：</p>

<pre>
<code>cache: [GET /servers] miss

Started GET &quot;/servers&quot; for 127.0.0.1 at 2023-03-14 10:18:42 +0800

Processing by ServersController#index as HTML

&nbsp; Manager Load (0.3ms)&nbsp; SELECT `managers`.* FROM `managers` WHERE `managers`.`id` = 1 ORDER BY `managers`.`id` ASC LIMIT 1

Read fragment views/localhost:3333/index (0.1ms)&nbsp;&nbsp; # 注意看，这里进行了缓存数据的读取

Completed 200 OK in 3ms (ActiveRecord: 0.3ms | Allocations: 1809)</code></pre>

<p>进入show页面，</p>

<p>cache: [GET /servers] miss # 再次刷新show页面，也没有数据的读取，因为已经进行了缓存</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

