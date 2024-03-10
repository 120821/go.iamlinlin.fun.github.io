---
layout: post
title: "phonenix - 创建数据库，启动server"
date: "2022-11-08"
categories: 
---
<p>配置数据库信息 ：</p>
{% highlight html %}vim config/dev.exs{% endhighlight %}
<p>与本地数据库或者docker的数据库进行连接例如这样：</p>
{% highlight html %}# Configure your database
config :lueluelue_backend, LueLueLueBackend.Repo,
&nbsp; username: &quot;admin&quot;,
&nbsp; password: &quot;88888888&quot;,
&nbsp; hostname: &quot;localhost&quot;,
&nbsp; database: &quot;lueluelue_backend&quot;,
&nbsp; stacktrace: true,
&nbsp; show_sensitive_data_on_connection_error: true,
&nbsp; pool_size: 10
# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to bundle .js and .css sources.
config :lueluelue_backend, LueLueLueBackendWeb.Endpoint,
&nbsp; # Binding to loopback ipv4 address prevents access from other machines.
&nbsp; # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
&nbsp; http: [ip: {127, 0, 0, 1}, port: 4000#(启动server的端口)],
&nbsp; check_origin: false,
&nbsp; code_reloader: true,
&nbsp; debug_errors: true,
&nbsp; secret_key_base: &quot;JpP+ld/4ErLPTtDmg+biACvp2Oc152hAOB0Qz6UpDtNgSFQ8RL+UYxNeo69hoByl&quot;,
&nbsp; watchers: [
&nbsp;&nbsp;&nbsp; # Start the esbuild watcher by calling Esbuild.install_and_run(:default, args)
&nbsp;&nbsp;&nbsp; esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
&nbsp; ]{% endhighlight %}
<p><img src="/uploads/ckeditor/pictures/698/image-20221108093442-1.png" style="height:414px; width:1040px" /></p>
<p>启动server：</p>
{% highlight html %}mix phx.server{% endhighlight %}
<p>打开浏览器</p>
<p><img src="/uploads/ckeditor/pictures/700/image-20221108093958-2.png" style="height:660px; width:1187px" /></p>
<p>&nbsp;</p>
