---
layout: post
title: "做一个rails的脚本，使用httparty 进行接口内容的抓取"
date: "2022-06-09"
categories: 
---

                    <p>首先，在项目文件中，Gemfile 增加</p> 
<pre><code>gem install httparty</code></pre> 
<p>然后进行执行命令,然后重启服务</p> 
<pre><code>bundle install</code></pre> 
<p>明确，要实现的是这样的内容</p> 
<blockquote> 
 <p>GET <a href="https://ethgasstation.info/api/ethgasAPI.json" title="https://ethgasstation.info/api/ethgasAPI.json">https://ethgasstation.info/api/ethgasAPI.json</a></p> 
 <p>抓取内容，打印出 fastest 的值</p> 
 <p>提示：使用 httparty, JSON.parse</p> 
</blockquote> 
<p>创建一个rb文件，类似这样的</p> 
<pre><code>ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'
require 'json'

puts 'lueluelue'</code></pre> 
<p>在命令行执行，</p> 
<pre><code>ruby 文件名</code></pre> 
<p>就可以看到打印出来的“lueluelue”</p> 
<p>同样的，也可执行我们需要的内容，文件上半部分的内容是固定不变，如果有报错就根据提示注释一下上边的内容，比如注释一下第二行，一般是不必的。</p> 
<pre><code>ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
#require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'
require 'json'

require 'httparty'


temp = HTTParty.get "https://ethgasstation.info/api/ethgasAPI.json"

puts temp.body

temp2 = JSON.parse(temp.body)

puts temp2["fastest"]
puts temp2["safeLow"]

</code></pre> 
<p></p>
                
