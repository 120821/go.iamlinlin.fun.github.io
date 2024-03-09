---
layout: post
title: "rails rake cache"
date: "2023-03-07"
categories: 
---
<p><a href="https://github.com/rack/rack-cache">https://github.com/rack/rack-cache</a></p>

<p>1.install</p>

<pre>
<code>gem install rack-cache</code></pre>

<p><code>2.usage</code></p>

<p>Rack::Cache 被实现为一个 Rack 中间件，可以与任何基于 Rack 的应用程序一起使用。&nbsp; 如果您的应用程序包含 rackup (.ru) 文件或使用 Rack::Builder 构建应用程序管道，只需按如下方式要求和使用：</p>

<pre>
<code>require &#39;rack/cache&#39;

use Rack::Cache,
  metastore:    &#39;file:/var/cache/rack/meta&#39;,
  entitystore:  &#39;file:/var/cache/rack/body&#39;,
  verbose:      true

run app</code></pre>

<p>假设您已将后端应用程序设计为利用 HTTP 的缓存功能，则基本缓存不需要进一步的代码或配置。</p>

<p><strong>在rails中使用：</strong></p>

<pre>
<code># config/application.rb
config.action_dispatch.rack_cache = true
# or
config.action_dispatch.rack_cache = {
   verbose:     true,
   metastore:   &#39;file:/var/cache/rack/meta&#39;,
   entitystore: &#39;file:/var/cache/rack/body&#39;
}</code></pre>

<p>您现在应该看到中间件管道中列出的 Rack::Cache：</p>

<pre>
<code>rake middleware</code></pre>

<p>&nbsp;</p>

