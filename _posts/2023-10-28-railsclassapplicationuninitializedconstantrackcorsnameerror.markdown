---
layout: post
title: "rails `class:Application': uninitialized constant Rack::Cors (NameError)"
date: "2023-10-28"
categories: 
---
<p>1.Gemfile增加：</p>

<pre>
<code>gem <span style="color:#abe338">&#39;rack-cors&#39;</span>, <span style="color:#abe338">require:</span> <span style="color:#abe338">&#39;rack/cors&#39;</span></code></pre>

<p>2.安装</p>

<pre>
<code>bundle install</code></pre>

<p>3.<code>config/application.rb</code> 文件增加</p>

<pre>
<code><span style="color:#dcc6e0">require</span> <span style="color:#abe338">&#39;rack/cors&#39;</span></code></pre>

<p>4.然后再增加cors即可(在 <code>config/application.rb</code> 文件中找到 <code>class Application &lt; Rails::Application</code> 代码块增加）</p>

<p>这是不区分接口，对所有接口都设置cors</p>

<pre>
<code>config.middleware.insert_before <span style="color:#f5ab35">0</span>, Rack::Cors <span style="color:#dcc6e0">do</span>
  allow <span style="color:#dcc6e0">do</span>
    origins <span style="color:#abe338">&#39;*&#39;</span> <span style="color:#d4d0ab"># 设置允许的来源，可以根据需要进行修改</span>
    resource <span style="color:#abe338">&#39;*&#39;</span>, <span style="color:#abe338">headers:</span> <span style="color:#abe338">:any</span>, <span style="color:#abe338">methods:</span> [<span style="color:#abe338">:get</span>] <span style="color:#d4d0ab"># 设置允许的 HTTP 方法，可以根据需要进行修改</span>
  <span style="color:#dcc6e0">end</span>
<span style="color:#dcc6e0">end</span></code></pre>

