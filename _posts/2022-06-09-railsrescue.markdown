---
layout: post
title: "rails中以脚本的形式执行某段代码+定时运行+rescue"
date: "2022-06-09"
categories: 
---

                    <blockquote> 
 <p>1. 新建一个 文件： script/test_hi.rb</p> 
 <pre># 运行方式：
# $ bundle exec ruby script/test_hi.rb
</pre> 
 <pre><code>ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'

puts 'hihihi'
puts User.all</code></pre> 
 <p>2. 运行： $ bundle exec ruby script/test_hi.rb</p> 
</blockquote> 
<blockquote> 
 <pre><code>loop do
  7   
  8   User.all.each do |User|                                                   
  9     User.create_jobs #在/model/user.rb中存在更新user数据的方法 def create_jobs ...end
 10   end
 11   
 12   sleep 48 * 3600
 13                                                                                   
 14 end</code></pre> 
 <p>在script文件创建新的脚本，执行定时， 3600单位默认是s， 48*3600就是48小时，</p> 
 <p>同时，要考虑数据的更新策略：<br> 1. 全删，然后全加<br> 2. 只更新变化的部分 (优先用这个）</p> 
 <p>loop do中的方法是创建新的数据，所以考虑一下根据id 或者name进行判断，如果有变化，就更新，没有就不变。</p> 
</blockquote> 
<blockquote> 
 <p>使用 else 语句</p> 
 <p>如果提供了 else 子句，它一般是放置在 rescue 子句之后，任意 ensure 之前。</p> 
 <p>else 子句的主体只有在代码主体没有抛出异常时执行。<br> 语法<br> begin<br>    #.. 过程<br>    #.. 抛出异常<br> rescue<br>    #.. 处理错误<br> else<br>    #.. 如果没有异常则执行<br> ensure<br>    #.. 最后确保执行<br>    #.. 这总是会执行<br> end</p> 
 <pre><code>
实例
begin
 # 抛出 'A test exception.'
 puts "I'm not raising exception"
rescue Exception =&gt; e
  puts e.message
  puts e.backtrace.inspect
else
   puts "Congratulations-- no errors!"
ensure
  puts "Ensuring execution"
end
</code></pre> 
</blockquote> 
<blockquote> 
 <p></p> 
</blockquote> 
<p></p> 
<p></p>
                
