---
layout: post
title: "rails  undefined method `untaint'"
date: "2023-06-27"
categories: 
---
<p><a href="https://stackoverflow.com/questions/73522137/search-up-undefined-method-untaint-error-after-ruby-upgrade">https://stackoverflow.com/questions/73522137/search-up-undefined-method-untaint-error-after-ruby-upgrade</a></p>

<p>把Gemfile.lock删除，重新生成。</p>

<p><code>/home/ubuntu/.asdf/installs/ruby/3.2.2/lib/ruby/gems/3.2.0/gems/bundler-1.17.2/lib/bundler/shared_helpers.rb:272:in `search_up&#39;: undefined method `untaint&#39; for &quot;/opt/app/web.art-bank.net/current&quot;:String (NoMethodError)</code></p>

<pre>
<code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current&nbsp; = File.expand_path(SharedHelpers.pwd).untaint</code></pre>

<p>&nbsp;</p>

