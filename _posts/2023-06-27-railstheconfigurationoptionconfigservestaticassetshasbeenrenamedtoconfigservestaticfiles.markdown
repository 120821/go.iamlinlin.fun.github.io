---
layout: post
title: "rails The configuration option `config.serve_static_assets` has been renamed to `config.serve_static_files`"
date: "2023-06-27"
categories: 
---
<p>关于配置选项的更改。之前，Rails应用程序中的`config.serve_static_assets`选项用于启用对&quot;public&quot;文件夹中的所有内容的服务，并且与asset pipeline无关。为了阐明其作用，这个选项已经被重命名为`config.serve_static_files`。`serve_static_assets`这个别名将在Rails 5.0中被移除。所以你需要修改你的配置文件，将`config.serve_static_assets`替换为`config.serve_static_files`。</p>

<pre>
<code>DEPRECATION WARNING: The configuration option `config.serve_static_assets` has been renamed to `config.serve_static_files` to clarify its role (it merely enables serving everything in the `public` folder and is unrelated to the asset pipeline). The `serve_static_assets` alias will be removed in Rails 5.0. Please migrate your configuration files accordingly. (called from block in &lt;top (required)&gt; at /opt/app/xxx/current/config/environments/production.rb:23)</code></pre>

