---
layout: post
title: "ruby Redis jobs"
date: "2022-06-09"
categories: 
---

                    <p>首先安装Redis</p> 
<pre><code>asdf plugin-add redis https://github.com/smashedtoatoms/asdf-redis.git</code></pre> 
<p>然后启动</p> 
<p>redis-server<img alt="" height="1080" src="https://img-blog.csdnimg.cn/a0f06598c34c450790360eab18142bac.png" width="1200"></p> 
<p>在app/jobs 文件夹下，就可以使用了</p> 
<p>app/jobs/application_job.rb文件</p> 
<pre><code> class ApplicationJob &lt; ActiveJob::Base
  2   # Automatically retry jobs that encountered a deadlock
  3   # retry_on ActiveRecord::Deadlocked
  4 
  5   # Most jobs are safe to ignore if the underlying records are no longer available
  6   # discard_on ActiveJob::DeserializationError
  7 end
~         </code></pre> 
<p>job的简单使用</p> 
<p>然后在其他地方调用就OK</p> 
<pre><code class="language-ruby">class SayHiJob &lt; ApplicationJob
  queue_as :default

  def perform(args)
    # 演示如何获得参数
    name = args[:name]
    content = args[:content]
    puts "in SayHiJob, name: #{name}, content: #{content}"

    # 如何执行代码
    user = User.new
    user.name = 11
    user.email = "some@email.com"
    ........
    user.save!
  end 
end
</code></pre> 
<p></p> 
<p><img alt="" height="281" src="https://img-blog.csdnimg.cn/534f6eacac3a4a72918e5f549851b35e.png" width="503">bundle exec rails c</p> 
<p>Account.create address: '0xd8da6b'</p>
                
