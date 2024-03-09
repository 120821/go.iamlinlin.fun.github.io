---
layout: post
title: "created_at 格式化 rails"
date: "2022-06-09"
categories: 
---

                    <pre><code>&lt;%= @account.created_at.to_s(:db) %&gt;
</code></pre> 
<blockquote> 
 <p> 使用to_s(:db) 时间会出现日期加上时间，否则就会出现原始的UTC<img alt="" height="150" src="https://img-blog.csdnimg.cn/5fb5171605474f278d4e27130e2a5633.png" width="509"></p> 
 <p> </p> 
</blockquote> 
<p><img alt="" height="109" src="https://img-blog.csdnimg.cn/503dd1c35a5847cba0f537e1a76c22d0.png" width="450"></p> 
<blockquote> 
 <p>Rails 时间 to_s 方法</p> 
 <p>在一个 Rails 项目中，会有很多地方会显示时间，我们希望采用一致的方式输出。</p> 
 <p>除了 <code>strftime</code> 方法，Rails 也可以直接呼叫 <code>to_s</code> 来转换输出格式，例如</p> 
 <pre>datetime = Time.now

datetime.to_s(:db)            # =&gt; "2007-12-04 00:00:00"
datetime.to_s(:number)        # =&gt; "20071204000000"
datetime.to_s(:short)         # =&gt; "04 Dec 00:00"
datetime.to_s(:long)          # =&gt; "December 04, 2007 00:00"
datetime.to_s(:long_ordinal)  # =&gt; "December 4th, 2007 00:00"
datetime.to_s(:rfc822)        # =&gt; "Tue, 04 Dec 2007 00:00:00 +0000"
datetime.to_s(:iso8601)       # =&gt; "2007-12-04T00:00:00+00:00"
</pre> 
 <p>另外，也可以自行配置项目常用的格式。例如，请编辑 <code>config/application.rb</code>，在最后新增一行：</p> 
 <pre> Time::DATE_FORMATS.merge!(:default =&gt; '%Y/%m/%d %I:%M %p', :ymd =&gt; '%Y/%m/%d')
</pre> 
 <p>这样就会</p> 
 <ol>
<li>修改默认的时间显示格式</li>
<li>注册一个新的格式是 <code>ymd</code> 只有日期</li>
</ol>
 <p>重启 <code>rails s</code> 服务器。</p> 
 <p>修改 <code>app/views/events/index.html.erb</code></p> 
 <pre>app/views/events/index.html.erb
-  &lt;%= event.created_at.strftime("%Y/%m/%d %I:%M %p") %&gt;
+  &lt;%= event.created_at.to_s %&gt; 
</pre> 
 <p>就会得到一样的结果 <code>2017/04/10 05:53 PM</code> 了。</p> 
 <p>如果只想显示日期，可以改成 <code>&lt;%= event.created_at.to_s(:ymd) %&gt;</code></p> 
</blockquote> 
<blockquote> 
 <p>strftime 格式化时间</p> 
 <p>在修改默认时区后，Rails 默认的时间显示格式例如 <code>2017-04-10 17:53:55 +0800</code> 包含了时区资讯，通常我们不会显示给用户，那要如何修改时间的显示方式呢？</p> 
 <p>Ruby 内建了 strftime 这个方法来格式化输出，请修改 <code>app/views/events/index.html.erb</code></p> 
 <pre>app/views/events/index.html.erb
-  &lt;%= event.created_at %&gt;
+  &lt;%= event.created_at.strftime("%Y/%m/%d %I:%M %p") %&gt;
</pre> 
 <p>这样就会输出成例如 <code>2017/04/10 05:53 PM</code> 了<br> 这个 strftime 方法接受了一个字符串参数是格式。详细这个格式代表什么意义，请参考 <a href="https://ruby-doc.org/core-2.3.4/Time.html#strftime-method" title="strftime">strftime</a> 文档上的说明，例如 <code>%m</code> 就代表月份(会补零)，而 <code>%M</code> 代表分钟</p> 
</blockquote> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p>
                
