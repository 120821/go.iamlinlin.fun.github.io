---
layout: post
title: "Ruby read JSON file"
date: "2022-06-09"
categories: 
---

                    <p>json 的使用  Ruby: How to read/write JSON File<a class="has-card" href="https://hackernoon.com/ruby-how-to-readwrite-json-file-a23h3vxa" title="Ruby: How to read/write JSON File | HackerNoon"><span class="link-card-box"><span class="link-title">Ruby: How to read/write JSON File | HackerNoon</span><span class="link-link"><img alt="" class="link-link-icon" src="https://csdnimg.cn/release/blog_editor_html/release2.1.3/ckeditor/plugins/CsdnLink/icons/icon-default.png?t=M4AD">https://hackernoon.com/ruby-how-to-readwrite-json-file-a23h3vxa</span></span></a></p> 
<pre><code>gem install json</code></pre> 
<pre><code>require 'json'
 =&gt; true</code></pre> 
<pre><code class="language-ruby">ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'                 
  2 require File.expand_path(File.dirname(__FILE__) + "/../config/environment")       
  3 require 'rails'                                        
  4 require 'rubygems'                                                   
  5 require 'json'                                                                    
  6 
  7 file = File.read('data_graph_account/text10.json')
  8 json = JSON.parse(file)
  9 Rails.logger.info "===json: #{json}"                   
 10 json['data']['subdomains'].each do |e|
 11    account = Account.where('address = ?', e['owner']).first                       
 12    Rails.logger.info "-=============before save account is #{account.inspect}"
 13    Rails.logger.info "-=============before save e is #{e.inspect}"
 14    if account.blank? 
 15       Account.create address: e['owner']
 16    end
 17    Rails.logger.info "-=============after save account is #{account.inspect}"
 18 end
</code></pre> 
<p>使用单个文件逐一进行数据的读取是可以的，进行整个目录的读取也是可以的。</p> 
<pre><code class="language-ruby">Dir["./data_graph_account/*.json"].each do |json_file|
 22   Rails.logger.info "========json_file is #{json_file}"
 23   json = JSON.parse(File.read(json_file))
 24   Rails.logger.info "====json is #{json}"
 25   json['data']['subdomains'].each do |e|
 26     account = Account.where('address = ?', e['owner']).first
 27     Rails.logger.info "-=============before save account is #{account.inspect}"
 28     Rails.logger.info "-=============before save e is #{e.inspect}"
 29     if account.blank?
 30       Account.create address: e['owner']
 31     end
 32     Rails.logger.info "-=============after save account is #{account.inspect}"
 33  end
 34 end
</code></pre> 
<p><img alt="" height="484" src="https://img-blog.csdnimg.cn/13a7fe8223a14cc880230f1036da50f0.png" width="1200"></p> 
<p></p> 
<p><img alt="" height="417" src="https://img-blog.csdnimg.cn/eef3e3a34bf2434c8c8fb104383be175.png" width="897"></p> 
<blockquote> 
 <pre><code>require 'json'

Dir["**/*.json"].each do |json_file|
  JSON.parse(File.read(json_file))
end</code></pre> 
 <p><a class="has-card" href="https://gist.github.com/burtlo/0726166e41481c286ede" title="Find all the JSON files in the local directory and any subdirectories and attempt to parse them with a Ruby JSON parser. If any of them fail to load an error message will be displayed. · GitHub"><span class="link-card-box"><span class="link-title">Find all the JSON files in the local directory and any subdirectories and attempt to parse them with a Ruby JSON parser. If any of them fail to load an error message will be displayed. · GitHub</span><span class="link-desc">Find all the JSON files in the local directory and any subdirectories and attempt to parse them with a Ruby JSON parser. If any of them fail to load an error message will be displayed. - son_lint.rb</span><span class="link-link"><img alt="" class="link-link-icon" src="https://gist.github.com/fluidicon.png">https://gist.github.com/burtlo/0726166e41481c286ede</span></span></a></p> 
</blockquote> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p> 
<p></p>
                
