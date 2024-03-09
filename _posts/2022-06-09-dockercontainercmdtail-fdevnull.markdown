---
layout: post
title: "docker，如何 只启动container, 不启动命令： cmd: tail -F /dev/null"
date: "2022-06-09"
categories: 
---

                    <p>docker，如何 只启动container, 不启动命令： cmd: tail -F /dev/null</p> 
<p>database.yml 文件进行修改即可使用，连接数据库，不然会报错</p> 
<blockquote> 
 <p>如果没有这个附加命令，当 <code>shuf</code>命令完成，容器将停止。<br> 有了它，容器将保持空闲状态，这使得以后更容易连接到它（ <code>docker exec -it container_name bash</code>).</p> 
 <p><code>tail -f /dev/null</code>是一个无限运行且不使用任何 CPU 的命令，因为无法从中读取任何内容 <code>/dev/null</code>我们要求从中获得无尽的阅读。</p> 
 <p><a class="has-card" href="https://github.com/docker/getting-started/issues/201" title="Why run tail -f /dev/null to keep the container running? · Issue #201 · docker/getting-started · GitHub"><span class="link-card-box"><span class="link-title">Why run tail -f /dev/null to keep the container running? · Issue #201 · docker/getting-started · GitHub</span><span class="link-link"><img class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.1.3/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M4AD" alt="icon-default.png?t=M4AD">https://github.com/docker/getting-started/issues/201</span></span></a></p> 
 <p>Without this additional command, when the <code>shuf</code> command is finished, the container will stop.<br> With it, the container will remain idle, which makes it easier to connect to it later (<code>docker exec -it container_name bash</code>).</p> 
 <p><code>tail -f /dev/null</code> is a command that runs endlessly and doesn't use any CPU because nothing can be read from <code>/dev/null</code> and we are asking for an endless read from it.</p> 
</blockquote> 
<p>bundle exec rake db:create</p> 
<p>使用数据库创建的时候出现报错，那么与远程数据库无法连接，查看.toos-versions</p> 
<blockquote> 
 <p>/home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activesupport-4.2.8/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.<br><span style="color:#fe2c24;">SCRAM authentication requires libpq version 10 or above</span><br> /home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activerecord-4.2.8/lib/active_record/connection_adapters/postgresql_adapter.rb:651:in `initialize'<br> /home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activerecord-4.2.8/lib/active_record/connection_adapters/postgresql_adapter.rb:651:in `new'</p> 
 {% highlight %}ruby 2.6.9
postgres 11.12
{% endhighlight %} 
 <p>把数据库版本调整到10以上。</p> 
 <p>bundle</p> 
 <p>bundle exec rake db:create</p> 
 <p>还是报错</p> 
 <p>/home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activesupport-4.2.8/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.<br><span style="color:#fe2c24;">SCRAM authentication requires libpq version 10 or above</span></p> 
 <p>那么，进行删除rm Gemfile.lock</p> 
 <p>vim Gemfile</p> 
 <p>取消注释 source 'https://gems.ruby-china.com'</p> 
 <p>注释#source 'https://rubygems.org'</p> 
 <p>再次进行创建</p> 
 <p>bundle exec rake db:create</p> 
 <p></p> 
 <p>/home/linlin/.asdf/installs/ruby/2.6.9/lib/ruby/gems/2.6.0/gems/activesupport-4.2.8/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.</p> 
 <p></p> 
 <p></p> 
</blockquote> 
<p><img alt="" height="221" src="https://img-blog.csdnimg.cn/0ad0e38881a340ccaab742d8ef7c8359.png" width="1200"></p>
                
